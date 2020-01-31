package com.ezen.jobsearch.company.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.apply.model.ApplyVO;
import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.common.FileUploadUtil;
import com.ezen.jobsearch.company.model.CompanyService;
import com.ezen.jobsearch.company.model.CompanyVO;
import com.ezen.jobsearch.emptype.model.EmpTypeService;
import com.ezen.jobsearch.emptype.model.EmpTypeVO;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;
import com.ezen.jobsearch.member.model.MemberService;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.payment.model.PaymentVO;
import com.ezen.jobsearch.resume.model.ResumeVO;

@Controller
@RequestMapping("/company")
public class CompanyController {//
	
	private static final Logger logger=LoggerFactory.getLogger(CompanyController.class);
		
	@Autowired
	private CompanyService companyService;
	@Autowired
	private LocationService lService;
	@Autowired
	private CategoryService cService;
	@Autowired
	private EmpTypeService eService;
	@Autowired
	private MemberService mService;
	@Autowired
	private FileUploadUtil fileUtil;
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	
	//마이페이지 - 회원정보수정
	@RequestMapping(value = "/companymypageedit.do",method = RequestMethod.GET)
	public String insertInfo_get(HttpSession session, Model model) {
		//세션에서 vo받아온 뒤 seq추출
		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int memberSeq=memberVo.getMemberSeq();		
		
		//기존의 컴퍼니 정보를 seq를 이용해서 불러옴	
		CompanyVO vo=companyService.selectCompany(memberSeq);
			
		logger.info("기업회원 정보수정창 memberSeq={}, companyVo={}",memberSeq,vo);	
		//model에 저장
		model.addAttribute("vo",vo);
		return "company/companymypageedit";
	}
	
	@RequestMapping(value = "/companymypageedit.do",method = RequestMethod.POST)
	public String insertInfo_post(@ModelAttribute MemberVO memberVo,
								@ModelAttribute CompanyVO companyVo,@RequestParam String chkComImage, HttpSession session,HttpServletRequest request,Model model) {
		logger.info("기업회원 정보수정 처리, 파라미터companyVO ::::::::: {}, memberVO={}",companyVo,memberVo );

		
		MemberVO sessionVo=(MemberVO)session.getAttribute("loginMember");
		
		int memberSeq=sessionVo.getMemberSeq();
		//이미지 중복 검증용
		String dbImgname=companyService.selectComImg(memberSeq);
		memberVo.setMemberSeq(memberSeq);
		companyVo.setRefMemberseq(memberSeq);
		
		
		List<Map<String,Object>> list= fileUtil.fileUpload(request);
		
		String comRenameimage="",comImg="";		
		
		for(Map<String,Object> map : list) {
			comImg=(String)map.get("originalFileName");
			comRenameimage=(String)map.get("fileName");	
						companyVo.setComImg(comImg);
			companyVo.setComRenameimage(comRenameimage);
			logger.info("기업회원 로고이미지 url={},renameimage={}",comImg,comRenameimage);
		}
		//세션에서 vo받아온뒤 seq추출하고 파라미터 memberVo와 companyVo에 세팅해줌
		//사진 null로 올라갈시 이전사진으로 고정
		if(comRenameimage==null||comRenameimage.isEmpty()) {
			companyVo.setComRenameimage(dbImgname);
		}			
		logger.info("변경후 파라미터 memberVo={},companyVo={}",memberVo,companyVo);
		//둘다 업데이트 처리해줌
		int cnt=companyService.updateComMem(memberVo);
		int cnt2=companyService.updateComInfo(companyVo);
		
		String msg="",url="/company/companymypageedit.do";
		if(cnt>0 && cnt2>0) {
			msg="정보가 정상적으로 수정되었습니다.";			
		}else {
			msg="정보 수정하는데 실패하였습니다.";			
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
		
	}	
	
	//기업공고등록 관련 페이지
	@RequestMapping(value = "/companymypageannouncement.do",method = RequestMethod.GET)
	public String insertAnn_get(Model model,HttpSession session) {
		MemberVO sessionVo=(MemberVO)session.getAttribute("loginMember");
		int memberSeq=sessionVo.getMemberSeq();
		CompanyVO comVo=companyService.selectCompany(memberSeq);
		logger.info("기업회원 공고글등록 리스트");
		
		
		if(comVo.getSetupDate()==null||comVo.getComTel()==null||comVo.getEmployeeNum()==null||comVo.getComType()==null||comVo.getComSales()==null||comVo.getComField()==null||comVo.getComDesc()==null) {
			String msg= "공고글의 정확성을 위하여 기업 추가정보를 기입해주세요";
			String url= "/company/companyPwdChk.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
			
		}else {
						
			//1번지역 불러오기
			List<LocationVO1> list1=lService.selectLocation1();	
			//1번 카테고리 불러오기
			List<CategoryVO1> list2=cService.selectCategory1();
			//직종 불러오기
			List<EmpTypeVO> list3=eService.selectEmpType();
			
			logger.info("list3.size={}",list3.size());
				
			model.addAttribute("locationList1",list1);
			model.addAttribute("categoryList1",list2);
			model.addAttribute("empTypeList",list3);
			
			return "company/companymypageannouncement";
		}
			
		
	}
	
	@RequestMapping(value = "/companymypageannouncement.do",method = RequestMethod.POST)
	public String insertAnn_post(@ModelAttribute AnnounceMentVO announceMentVo,HttpSession session,Model model) {
		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int memSeq=memberVo.getMemberSeq();	
		//회사 번호 찾아오기
		int comseq=companyService.selectComSeq(memSeq);
		
		announceMentVo.setRefCompanyseq(comseq);
		
		logger.info("기업회원 공고글 등록처리 파라미터 vo ={}",announceMentVo);
		
		int cnt=companyService.insertAnn(announceMentVo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="공고가 정상적으로 등록되었습니다.";
			url="/company/companyMyAnnList.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/companymypageannedit.do")
	public void editMyAnn(@RequestParam(defaultValue = "0") int annSeq,Model model) {		
		logger.info("기업회원 공고글 수정페이지 리스트 보여주기 파라미터 annSeq={}",annSeq);
		
		AnnounceMentVO annVo=companyService.viewMyAnnByAnnSeq(annSeq);
		logger.info("기업회원 공고글 수정페이지 annVo={}",annVo);
		//1번지역 불러오기
		List<LocationVO1> list1=lService.selectLocation1();	
		//1번 카테고리 불러오기
		List<CategoryVO1> list2=cService.selectCategory1();
		//직종 불러오기
		List<EmpTypeVO> list3=eService.selectEmpType();
		
		model.addAttribute("annVo",annVo);
		model.addAttribute("locationList1",list1);
		model.addAttribute("categoryList1",list2);
		model.addAttribute("empTypeList",list3);		
		
	}

	@RequestMapping(value = "/companymypageannedit.do",method = RequestMethod.POST)
	public String editMyAnn_post(@ModelAttribute AnnounceMentVO announceMentVo,HttpSession session,Model model) {
		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int memSeq=memberVo.getMemberSeq();	
		//회사 번호 찾아오기
		int comseq=companyService.selectComSeq(memSeq);
		
		announceMentVo.setRefCompanyseq(comseq);
		
		logger.info("기업회원 공고글 수정처리 파라미터 annVo ={}",announceMentVo);
		
		int cnt=companyService.updateMyAnn(announceMentVo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="공고가 정상적으로 수정되었습니다.";
			url="/company/companyMyAnnList.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/companyMyAnnList.do")
	public void viewMyAnn(HttpSession session,Model model) {
		
		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int refMemberseq=memberVo.getMemberSeq();
		int refCompanyseq=companyService.selectComSeq(refMemberseq);
		
		logger.info("기업회원 내 공고글 리스트 보여주기 파라미터 refCompanyseq={}",refCompanyseq);
		
		int count=companyService.countMyAnn(refCompanyseq);		
		List<Map<String,Object>> list=companyService.viewMyAnn(refCompanyseq);			
		
		model.addAttribute("count",count); //내 공고글 작성수
		model.addAttribute("list",list);   //내 공고글 정보
				
	}	
	@RequestMapping("/companyMyAnnApply.do")
	public void viewMyApply(@RequestParam int annSeq,Model model) {
		logger.info("지원자 확인하기 int annSeq={}",annSeq);
		
		List<ResumeVO> list=companyService.selectMyAnnApply(annSeq);
		
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/companyDeleteMyAnn.do")
	public String deleteMyAnn(@RequestParam(defaultValue = "0")int annSeq, Model model) {
		//후에 추가 검증처리
		
		logger.info("공고글 삭제처리 파라미터 annSeq={}",annSeq);
		
		int cnt=companyService.deleteMyAnn(annSeq);
		
		String msg="삭제 실패하였습니다.",url="/company/companyMyAnnList.do";
		if(cnt>0) {
			msg=annSeq+"번 공고글이 삭제되었습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/companyPwdChk.do", method = RequestMethod.GET) 
  	public String mypageeditcheck_get() {
  		logger.info("비밀번호체크 화면보여주기");  		
  		return "company/companyPwdChk"; 
	}

  	@RequestMapping(value="/companyPwdChk.do", method = RequestMethod.POST)
	public String mypageeditcheck_post(@RequestParam String memberPwd,
			HttpSession session, Model model) {
  		
  		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		String memberId = memberVo.getMemberId();	
  		String dbPwd = mService.selectPwd(memberId);
  		boolean pwdChk = false;
  		
  		//비밀번호 비교
		pwdChk = passwordEncoder.matches(memberPwd, dbPwd);
  		
		if(pwdChk) {
			String url = "/company/companymypageedit.do";
			String message = "비밀번호 확인";
			System.out.println("비밀번호 확인");
			
			model.addAttribute("msg", message);
			model.addAttribute("url", url);
			
		}else {
			String url = "/company/companyPwdChk.do";
			String message = "비밀번호가 일치하지 않습니다.";
			
			System.out.println("비밀번호 불일치");
			
			model.addAttribute("msg", message);
			model.addAttribute("url", url);
		}
		
		return "common/message";
  		
  	}
  	
  	@RequestMapping("/companypay.do")
  	public void companypay(@RequestParam int annSeq,HttpSession session,Model model) {
  		logger.info("결제하기 페이지 파라미터 annSeq={}",annSeq);
  		MemberVO vo=(MemberVO)session.getAttribute("loginMember");
  		String Name=vo.getMemberName();  		
  		model.addAttribute("Name",Name);
  	}
  	
  	@RequestMapping("/companyprepay.do")
  	public void companyprepay(@ModelAttribute PaymentVO payVo,HttpSession session,Model model) {
  		logger.info("결제창 파라미터 payVo={}",payVo);
  		model.addAttribute("payVo",payVo);
  	}
  	
  	@RequestMapping("/companypaycomplete.do")
  	public void companypaycomplete(@RequestParam String paymentCode,@RequestParam String refAnnouncement) {
  		  		
  		logger.info("결제 완료 처리 파라미터 paymentCode={},refAnnouncement={}",paymentCode,refAnnouncement);
  		if(paymentCode!=null) {
	  		PaymentVO paymentVo=new PaymentVO();
	  		paymentVo.setPaymentCode(paymentCode);
	  		paymentVo.setRefAnnouncement(Integer.parseInt(refAnnouncement));  		
	  		companyService.payMyAnn(paymentVo);
  		}  		
  		
  	}
  	
  	@RequestMapping("/companypaycompletepage.do")
  	public void companypaycompletepage() {
  		logger.info("결제가 완료되었습니다.");
  	}  
	
  	@RequestMapping("/companymyorderlist.do")
  	public void companymyorderlist(HttpSession session,Model model) {
  		
  		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int memberSeq=memberVo.getMemberSeq();
  		logger.info("결제 확인 페이지 memberseq={}",memberSeq);
  		
  		List<PaymentVO> list=companyService.CompanyPayList(memberSeq);
  		logger.info("list.size={}",list.size());
  		model.addAttribute("list",list);
  		
  		
  	}
  	@RequestMapping("/companydetail.do")
  	public void companydetail(@RequestParam(defaultValue = "0") int comSeq, Model model) {
  		
  		logger.info("회사 상세페이지 파라미터 comSeq={}",comSeq);
  		if(comSeq==0) {
  			return;
  		}
  		CompanyVO companyVo=companyService.CompanyDetail(comSeq);
  		int refMemberseq=companyVo.getRefMemberseq();
  		
  		MemberVO memberVo=mService.selectComMem(refMemberseq);
 		
  		model.addAttribute("memberVo",memberVo);
  		model.addAttribute("companyVo",companyVo);  	
  		
  	}
  	@RequestMapping("/KakaoMap.do")
  	public void naverMap(@RequestParam int comSeq,Model model) {
  		logger.info("카카오지도api 파라미터 memSeq={}",comSeq);
  		
  		CompanyVO companyVo=companyService.CompanyDetail(comSeq);
  		
  		int refMemberseq=companyVo.getRefMemberseq();
  		
  		MemberVO memberVo=mService.selectComMem(refMemberseq);
  		
  		model.addAttribute("memberVo",memberVo);
  		
  	}
}
