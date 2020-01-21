package com.ezen.jobsearch.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.common.FileUploadUtil;
import com.ezen.jobsearch.company.model.CompanyService;
import com.ezen.jobsearch.company.model.CompanyVO;
import com.ezen.jobsearch.member.model.MemberService;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.resume.model.ResumeService;
import com.ezen.jobsearch.resume.model.ResumeVO;
import com.ezen.jobsearch.scrap.model.ScrapService;
import com.ezen.jobsearch.viewann.model.ViewAnnService;

@Controller
public class MemberController {
	//회원가입, 로그인 및 회원관련 컨트롤러
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private ViewAnnService viewAnnService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	//암호화 의존성 주입
	//bean 등록 필요(context-common.xml) , pom.xml 수정 필요(spring security 추가)
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private ResumeService resumeService;
	
	
	//로그인
	@RequestMapping("/member/login.do")
	public String loginPage() {
		return "member/login";
	}
	
	//회원가입
	@RequestMapping("/member/register.do")
	public String register(@RequestParam(defaultValue="1", required=false) String regType, Model model) {
		
		//1 일반회원, 2 기업회원
		if( !(regType.equals("1") || regType.equals("2")) ) {
			regType = "1";
		}
		
		model.addAttribute("regType",regType);
			
		return "member/register";
	}
	
	@RequestMapping("/member/insertMember.do")
	public String insertMember(@ModelAttribute MemberVO memberVo,Model model, @ModelAttribute CompanyVO companyVo,HttpServletRequest request) {
		
		logger.info("memberVo={}",memberVo);
		
		String regType = memberVo.getRegType();
		
		String encPassword = passwordEncoder.encode(memberVo.getMemberPwd());
		//암호화된 비밀번호 셋팅
		memberVo.setMemberPwd(encPassword);
		
		int memberResult = 0;
		int companyResult = 0;
		
		//회원 가입
		memberResult = memberService.insertMember(memberVo);
		
		//기업회원 가입
		if(regType.equals("2")) { 
			if(memberResult>0) {
				int refMemberSeq = memberService.selectMaxmemSeq();
				
				companyVo.setRefMemberseq(refMemberSeq);
				companyResult = companyService.insertCompany(companyVo);
			}
		}
		
		String url="/home.do";
		String message = "회원가입 성공.";
		
		if(memberResult > 0) {
			
			if(regType.equals("1")) {
				message= "일반회원 가입 완료";
			}
			if(regType.equals("2")) {
				message= "기업회원 가입 완료";
			}
		}else {
			message = "오류발생";
		}
		
		request.setAttribute("msg", message);
		request.setAttribute("url", url);
			
		return "common/message";
		
	}
	
	//ajax 처리 회원 id 중복검사
	@RequestMapping("/member/dupchk.do")
	public @ResponseBody int  dupchkIdCount(@RequestParam String memberId) {
		int result = 0;
		
		result = memberService.dupchkIdCount(memberId);
		
		return result;
		
	}
	
	//인증번호 메일 발송
	@RequestMapping("/member/certiNumber.do")
	public @ResponseBody String sendCertiNumberMail(@RequestParam String inputMail,Model model) throws Exception{
		String certiNumber = memberService.sendCertiNumberMail(inputMail);
		
		return certiNumber;
		
	}
	
	//로그인 
	@RequestMapping("/member/loginCheck.do")
	public String loginCheck(@RequestParam String memberId, @RequestParam String memberPwd, @RequestParam String regType,
			HttpServletRequest request, Model model) {
		
		//암호화 된 비밀번호 비교를 위해 db에서 비밀번호 select
		String dbPwd = memberService.selectPwd(memberId);
		
//		System.out.println("memberId : " + memberId);
//		System.out.println("memberPwd : " + memberPwd);
//		System.out.println("regType : " + regType);

		boolean pwdChk = false;

		//비밀번호 비교
		pwdChk = passwordEncoder.matches(memberPwd, dbPwd);
		
//		System.out.println("pwdChk ::: " + pwdChk);
		
		MemberVO memberVo = null;
		
		//비밀번호 일치
		if(pwdChk) {
			memberVo = memberService.selectMember(memberId,regType);
			//System.out.println("memberVo : " + memberVo);
			
			if(memberVo == null) {
				String message="가입하지 않은 아이디 이거나, 잘못된 비밀번호 입니다.";
				
				model.addAttribute("message",message);
				
				if(regType.equals("1") || regType.equals("2")) {	//일반, 기업회원
					return "/member/login";
				}else {												//관리자
					return "/admin/login/login";
				}
			}
			
			memberVo.setMemberPwd("");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", memberVo);
			
			if(regType.equals("1") || regType.equals("2")) {	//일반, 기업회원
				return "redirect:/home.do";
			}else {												//관리자
				return "redirect:/admin/home.do";
			}
		}else {
			String message="가입하지 않은 아이디 이거나, 잘못된 비밀번호 입니다.";
			
			model.addAttribute("message",message);
			
			if(regType.equals("1") || regType.equals("2")) {	//일반, 기업회원
				return "/member/login";
			}else {					
				return "/admin/login/login";
			}
		}
		
	}
	
	//로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO)session.getAttribute("loginMember");
		String regType = memberVo.getRegType();
		
		String returnPage = "redirect:/home.do";
		
		if(regType.equals("0")) {
			returnPage = "redirect:/admin/login.do";
		}
		
		session.invalidate();
		
		
		return returnPage;
	}
	
	//id찾기, 비밀번호 찾기
	@RequestMapping("/member/findIdPwd.do")
	public String findIdPwd() {
		
		return "/member/findIdPwd";
	}
	
	//id 찾기
	@RequestMapping("/member/findId.do")
	public @ResponseBody List<HashMap<String,String>> findId(@RequestParam String memberName , @RequestParam String phone) {
	//	System.out.println("memberName : " + memberName);
	//	System.out.println("phone : " + phone);
		
		List<HashMap<String,String>> aList = memberService.findId(memberName, phone);
		System.out.println("aList :: "+aList);
		
		return aList;
	}
	
	//비밀번호 찾기(메일발송)
	@RequestMapping("/member/sendPwdMail.do")
	public @ResponseBody int sendPwdMail(@RequestParam(value="memberId") String memberId) {
		
		String randomPwd = memberService.sendRandomPassword(memberId);
		
		
		int updateCnt = 0;
		
		
		if(randomPwd.equals("0")) {	//메일발송 실패
			
		}else {	//메일발송 성공
			HashMap<String,String> hMap = new HashMap<String,String>();
			
			//비밀번호 암호화
			String encPwd = passwordEncoder.encode(randomPwd);
			
			hMap.put("memberId", memberId);
			hMap.put("memberPwd", encPwd);
			
			updateCnt = memberService.updatePassword(hMap);
		}
		
		System.out.println("updateCnt : " + updateCnt);
		return updateCnt; 
		
		
	}
	
	@RequestMapping("/member/cMinfo.do")
	public String confirmMemInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
//		String url="/home.do";
//		String message = "잘못된 접근입니다.";
//		if(session.getAttribute("loginMember") == null) {
//			
//			request.setAttribute("msg", message);
//			request.setAttribute("url", url);
//			
//			return "common/message";
//		}
		
		return "member/confirmMemInfo";
	}
	
	@RequestMapping("/member/chkMem.do")
	public String chkPwd(@RequestParam String memberPwd, @RequestParam String memberId, HttpServletRequest request) {
		//암호화 된 비밀번호 비교를 위해 db에서 비밀번호 select
		
		String dbPwd = memberService.selectPwd(memberId);
		
		System.out.println("memberId : " + memberId);
		System.out.println("memberPwd : " + memberPwd);

		boolean pwdChk = false;

		//비밀번호 비교
		pwdChk = passwordEncoder.matches(memberPwd, dbPwd);
		
		if(pwdChk) {
			System.out.println("비밀번호 일치");
			return "member/editMeminfo";
		}else {
			String url = "/member/cMinfo.do";
			String message = "비밀번호가 일치하지 않습니다.";
			
			System.out.println("비밀번호 불일치");
			
			request.setAttribute("msg", message);
			request.setAttribute("url", url);
			
			return "common/message";
		}
		
		
	}
	
		
		//마이페이지 - 회원정보수정 비밀번호체크****
	  	@RequestMapping(value="/member/mypageeditcheck.do", method = RequestMethod.GET) 
	  	public String mypageeditcheck_get() {
	  		logger.info("비밀번호체크 화면보여주기");
	  		
	  		return "member/mypageeditcheck"; 
		}
	  	
	  	
	  	@RequestMapping(value="/member/mypageeditcheck.do", method = RequestMethod.POST)
		public String mypageeditcheck_post(@RequestParam String memberPwd,
				HttpSession session, Model model) {
	  		
	  		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
			String memberId = memberVo.getMemberId();	
	  		String dbPwd = memberService.selectPwd(memberId);
	  		boolean pwdChk = false;
	  		
	  		//비밀번호 비교
			pwdChk = passwordEncoder.matches(memberPwd, dbPwd);
	  		
			if(pwdChk) {
				String url = "/member/mypageedit.do";
				String message = "비밀번호 확인";
				System.out.println("비밀번호 확인");
				
				model.addAttribute("msg", message);
				model.addAttribute("url", url);
				
			}else {
				String url = "/member/mypageeditcheck.do";
				String message = "비밀번호가 일치하지 않습니다.";
				
				System.out.println("비밀번호 불일치");
				
				model.addAttribute("msg", message);
				model.addAttribute("url", url);
			}
			
			return "common/message";
	  		
	  	}
		
		

	  //마이페이지 - 회원탈퇴 비밀번호체크****
	  	@RequestMapping(value="/member/mypagedeletecheck.do", method = RequestMethod.GET) 
	  	public String mypagedeletecheck_get() {
	  		logger.info("회원탈퇴 화면 보여주기");
	  		return "member/mypagedeletecheck"; 
		  }
	  	
	  	
	  	@RequestMapping(value="/member/mypagedeletecheck.do", method = RequestMethod.POST)
		public String mypagedelete_post(@RequestParam String memberPwd,
				HttpSession session, Model model) {
	  		
	  		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
			String memberId = memberVo.getMemberId();	
	  		String dbPwd = memberService.selectPwd(memberId);
	  		boolean pwdChk = false;
	  		
	  		//비밀번호 비교
			pwdChk = passwordEncoder.matches(memberPwd, dbPwd);
	  		
			if(pwdChk) {
				memberService.withdrawMember(memberId);

				String url = "/member/login.do";
				String message = "회원탈퇴 성공";
				
				System.out.println("회원탈퇴 성공");
				
				session.invalidate();
				
				model.addAttribute("msg", message);
				model.addAttribute("url", url);
			}else {
				String url = "/member/mypagedeletecheck.do";
				String message = "비밀번호가 일치하지 않습니다.";
				
				System.out.println("비밀번호 불일치");
				
				model.addAttribute("msg", message);
				model.addAttribute("url", url);
				
			}
			return "common/message";
	  		
	  	}
		
	  //마이페이지 - 회원정보수정****
	  	@RequestMapping(value="/member/mypageedit.do", method = RequestMethod.GET)
		public String mypageedit_get(HttpSession session, Model model) throws ParseException  {
			MemberVO memberVo = (MemberVO)session.getAttribute("loginMember");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String b = sdf.format(sdf.parse(memberVo.getBirthday()));
			memberVo.setBirthday(b);
			
			model.addAttribute("vo", memberVo);
			return "member/mypageedit";
		}
	  		
  		@RequestMapping(value="/member/mypageedit.do", method = RequestMethod.POST)
  		public String mypageedit_post(@ModelAttribute MemberVO vo, 
  				HttpSession session, HttpServletRequest request,
  				@RequestParam String memberPwd, @RequestParam String memberPwd2, 
  				Model model) {
  			
  			MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
  			MemberVO memberVo2 = memberService.selectMember(memberVo.getMemberId(), memberVo.getRegType());

			String memberId = memberVo.getMemberId();
  			
  			//중복검증용
  			String dbImgname= memberVo.getprofileRenameimg();
			//String genderType = memberVo.getGenderType();	
			
  			vo.setMemberId(memberId);
  			//vo.setGenderType(genderType);
  			
  			List<Map<String,Object>> list= fileUtil.fileUpload(request);
  			
  			String profileRenameimg="", profileImg="";		
  			
  			for(Map<String,Object> map : list) {
  				profileImg=(String)map.get("originalFileName");
  				profileRenameimg=(String)map.get("fileName");	
  						vo.setProfileImg(profileImg);
						vo.setProfileRenameimg(profileRenameimg);
  				logger.info("기업회원 로고이미지 url={},renameimage={}",profileImg, profileRenameimg);
  			}
  			//세션에서 vo받아온뒤 seq추출하고 파라미터 memberVo와 companyVo에 세팅해줌
  			//사진 null로 올라갈시 이전사진으로 고정
  			if(profileRenameimg==null||profileRenameimg.isEmpty()) {
  				vo.setProfileRenameimg(dbImgname);
  			}
  			
  			logger.info("회원수정처리 vo={}",vo);
  			int cnt = 0;
  			if(StringUtils.isEmpty(memberPwd)) {
  				vo.setMemberPwd(memberVo2.getMemberPwd());
  	  			cnt = memberService.updateMember(vo);
  			} else if (StringUtils.equals(memberPwd, memberPwd2)){
	  			String Password = passwordEncoder.encode(memberPwd);
  	  			memberVo.setMemberPwd(Password);
  	  			cnt = memberService.updateMember(vo);
  			}
	  	  			
  			String msg="", url="";
						
			if(cnt>0) {
				session.setAttribute("loginMember", memberService.selectMember(memberVo.getMemberId(), memberVo.getRegType()));
				msg="회원정보 수정되었습니다.";
				url="/member/mypagerecentnotice.do";
			}else {	
	  			msg="회원정보 수정 실패!";
	  			url="/member/mypageedit.do";
  			}	
  		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
  		
			return "common/message";
  		}
		
  		/*
  		@RequestMapping(value="/member/mypageedit.do", method = RequestMethod.POST)
  		public String mypageedit_post(@ModelAttribute MemberVO vo, 
  				HttpSession session,
  				@RequestParam String memberPwd, 
  				@RequestParam String memberPwd2, Model model) {
  			
  			MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
  			MemberVO memberVo2 = memberService.selectMember(memberVo.getMemberId(), memberVo.getRegType());
  			
  			String memberId = memberVo.getMemberId();	
  			//String genderType = memberVo.getGenderType();	
  			
  			vo.setMemberId(memberId);
  			//vo.setGenderType(genderType);
  			
  			
  			logger.info("회원수정처리 vo={}",vo);
  			int cnt = 0;
  			if(StringUtils.isEmpty(memberPwd)) {
  				vo.setMemberPwd(memberVo2.getMemberPwd());
  				cnt = memberService.updateMember(vo);
  			} else if (StringUtils.equals(memberPwd, memberPwd2)){
  				String Password = passwordEncoder.encode(memberPwd);
  				memberVo.setMemberPwd(Password);
  				cnt = memberService.updateMember(vo);
  			}
  			
  			String msg="", url="";
  			
  			if(cnt>0) {
  				msg="회원정보 수정되었습니다.";
  				url="/member/mypagerecentnotice.do";
  			}else {	
  				msg="회원정보 수정 실패!";
  				url="/member/mypageedit.do";
  			}	
  			
  			model.addAttribute("msg", msg);
  			model.addAttribute("url", url);
  			
  			return "common/message";
  		}*/
		
		
		//마이페이지 - 이력서
		@RequestMapping("/member/mypageresume.do")
		public String mypageresume_get(HttpSession session, HttpServletRequest request, Model model) {
			
			MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
			int memberSeq =memberVo.getMemberSeq();
			
			List<ResumeVO> list=resumeService.resumeList(memberSeq);
			int count=resumeService.resumeListCount(memberSeq);
			
			model.addAttribute("list",list);
			model.addAttribute("count",count);
			
			return "member/mypageresume";
		}
		
		//마이페이지 - 이력서삭제
		@RequestMapping("/resume/resumeListDel.do")
		public String mypageresuem_del(@RequestParam(defaultValue = "0")int resumeSeq, Model model) {
			
			int cnt=resumeService.resumeListDel(resumeSeq);
			
			String msg="", url="";
			if(cnt>0) {
				msg=resumeSeq+"번 이력서 삭제!";
				url="/member/mypageresume.do";
			}else {
				msg="이력서 목록 삭제 실패!";
				url="/member/mypageresume.do";
			}
			
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
			
		}

		//최근본 공고
		@RequestMapping("/member/mypagerecentnotice.do")
		public String viewNotice(HttpSession session, Model model) {
			MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
			int memberSeq =memberVo.getMemberSeq();
			
			List<Map<String, Object>> list =viewAnnService.selectmypagerecentnoticeList(memberSeq);
			
			model.addAttribute("list",list);
			model.addAttribute("count",list.size());
			
			return "member/mypagerecentnotice";
		}
		
		//최근본 공고 삭제 
		@RequestMapping("/member/mypagerecentnoticeListDel.do")
		public String mypagerecentnotice_del(@RequestParam(defaultValue = "0")int viewSeq, Model model) {
			
			int cnt=viewAnnService.mypagerecentnoticeListDel(viewSeq);
			
			String msg="", url="";
			if(cnt>0) {
				msg=viewSeq+"번 최근 공고 삭제!";
				url="/member/mypagerecentnotice.do";
			}else {
				msg="이력서 목록 삭제 실패!";
				url="/member/mypagerecentnotice.do";
			}
			
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
			
		}
		
		//마이페이지 - 즐겨찾기
		@RequestMapping("/member/mypagebookmark.do")
		public String Viewbookmark(HttpSession session, Model model) {
			MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
			int memberSeq =memberVo.getMemberSeq();
			
			List<Map<String, Object>> list =scrapService.selectmypagebookmarkList(memberSeq);
			
			model.addAttribute("list",list);
			model.addAttribute("count",list.size());
			
			return "member/mypagebookmark";
		}
		
		//마이페이지 - 즐겨찾기 삭제
		@RequestMapping("/member/mypagebookmarkListDel.do")
		public String mypagebookmark_del(@RequestParam(defaultValue = "0")int scrapSeq, Model model) {
		
			int cnt=scrapService.mypagebookmarkListDel(scrapSeq);
			
			String msg="", url="";
			if(cnt>0) {
				msg=scrapSeq+"번 즐겨찾기 목록 삭제!";
				url="/member/mypagebookmark.do";
			}else {
				msg="이력서 목록 삭제 실패!";
				url="/member/mypagebookmark.do";
			}
			
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
			
		}
		
		
		//마이페이지 - 이력서테스트
		@RequestMapping("/member/mypageresumeTest.do")
		public String mypageresumeTest(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			int memberSeq = ((MemberVO)session.getAttribute("loginMember")).getMemberSeq();
			
			
			System.out.println("MemberController 로그인 회원 seq : " + memberSeq);
			
			List<ResumeVO> resumeList = resumeService.selectResumeList(memberSeq);
			int resumeCount = resumeService.selectMyResumeCount(memberSeq);
			
			model.addAttribute("resumeList",resumeList);
			model.addAttribute("resumeCount",resumeCount);
			
			return "member/mypageresume2";
		}		

	
	
}
