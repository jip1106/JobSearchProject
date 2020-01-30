package com.ezen.jobsearch.resume.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.education.model.EducationService;
import com.ezen.jobsearch.education.model.EducationVO;
import com.ezen.jobsearch.hopework.model.HopeworkService;
import com.ezen.jobsearch.hopework.model.HopeworkVO;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.mycareer.model.MycareerService;
import com.ezen.jobsearch.mycareer.model.MycareerVO;
import com.ezen.jobsearch.resume.model.ResumeSearchVO;
import com.ezen.jobsearch.resume.model.ResumeService;
import com.ezen.jobsearch.resume.model.ResumeVO;


@Controller
public class ResumeController {
	private Logger logger=
		LoggerFactory.getLogger(ResumeController.class);
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private EducationService educationService;
	
	@Autowired
	private HopeworkService hopeworkService;
	
	@Autowired
	private MycareerService mycareerService;
	

	@RequestMapping(value="/resume/resume.do", method=RequestMethod.GET)
	public String resume_get(HttpSession session, Model model) throws ParseException {
		logger.info("resuem 화면보여주기");
		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String b = sdf.format(sdf.parse(memberVo.getBirthday()));
		memberVo.setBirthday(b);
		

		List<Map<String, Object>> list=resumeService.selectEmp();
		List<Map<String, Object>> list_cate=resumeService.selectCate();
		List<Map<String, Object>> list_loca=resumeService.selectLoca();


		model.addAttribute("list", list);
		model.addAttribute("list_cate", list_cate);
		model.addAttribute("list_loca", list_loca);

		model.addAttribute("vo", memberVo);
		return "resume/resume";
	}
	
		
	
	//인재검색
	@RequestMapping(value="/resume/searchResume.do")
	public String searchResume(Model model,ResumeSearchVO resumeSearchVo) {
		
		List<Map<String, Object>> emp_list = resumeService.selectEmp();
		List<Map<String,Object>> loca_list = resumeService.selectLoca();
		List<Map<String,Object>> cate_list = resumeService.selectCate();
		
		List<Map<String,Object>> resume_list = resumeService.selectAllResume(resumeSearchVo);
		
		//System.out.println("resumeSearchVO : " + resumeSearchVo);
		model.addAttribute("emp_list",emp_list);	//근무형태
		model.addAttribute("loca_list",loca_list);	//지역
		model.addAttribute("cate_list",cate_list);	//직종
		model.addAttribute("resume_list",resume_list);	//이력서 리스트
		
		return "resume/searchResume";
	}
	
	@RequestMapping(value="/resume/detailResume.do")
	public String detailResume(@RequestParam String resumeSeq,Model model) {
		
		Map<String, Object> myResume = resumeService.selectResumeByresumeSeq(resumeSeq);
		List<EducationVO> eduInfo = educationService.selectEduList(resumeSeq);
		
		model.addAttribute("myResume", myResume);
		model.addAttribute("eduInfo",eduInfo);
		
		
		return "resume/resumeDetail";
	}
	
	
	
	//이력서 상세 등록 페이지 이동 박준일
	@RequestMapping(value="/resume/resumeView.do")
	public String resumeView(@RequestParam(value="resumeSeq",defaultValue="0") String resumeSeq ,
								HttpSession session, 
								Model model) {
		
		//logger.info("resuem 화면보여주기");
		
		int memberSeq = (int)((MemberVO)session.getAttribute("loginMember")).getMemberSeq();
		
		logger.info(resumeSeq);
		int count = resumeService.selectMyResumeCount(memberSeq);
		
		if(count<50 && resumeSeq.equals("0")) {	//등록페이지
				
			List<Map<String, Object>> list=resumeService.selectEmp();
			List<Map<String, Object>> list_cate=resumeService.selectCate();
			List<Map<String, Object>> list_loca=resumeService.selectLoca();
	
			model.addAttribute("resumeSeq", resumeSeq);
			model.addAttribute("list", list);
			model.addAttribute("list_cate", list_cate);
			model.addAttribute("list_loca", list_loca);
			
			return "resume/resume2";
		}else if(!resumeSeq.equals("0")){//수정페이지
			List<Map<String, Object>> list=resumeService.selectEmp();
			List<Map<String, Object>> list_cate=resumeService.selectCate();
			List<Map<String, Object>> list_loca=resumeService.selectLoca();
			
			Map<String, Object> resumeInfo = resumeService.selectMyResumeInfo(resumeSeq);
			List<EducationVO> list_edu = educationService.selectEduList(resumeSeq);
			//System.out.println("수정페이지 :: " + list_edu);
	
			model.addAttribute("resumeSeq", resumeSeq);
			model.addAttribute("resumeInfo", resumeInfo);
			model.addAttribute("list_edu",list_edu);
			
			
			model.addAttribute("list", list);
			model.addAttribute("list_cate", list_cate);
			model.addAttribute("list_loca", list_loca);
			
			
			return "resume/resume2";
		}else {
			String url = "/member/mypageresumeTest.do";
			String msg = "이력서는 최대 " + count + "개까지 입력 할 수 있습니다.";
						
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	}
	
	//이력서 등록	박준일
	@RequestMapping(value="/resume/resumeInsert.do")
	public String insertResume(@ModelAttribute ResumeVO resumeVo, 
							@ModelAttribute EducationVO educationVOList,
							@ModelAttribute HopeworkVO hopeworkVo,
							@ModelAttribute MycareerVO mycareerVo,		
							@RequestParam String educationSize,
							HttpSession session) {
		
		//이력서 데이터
		logger.info("resumeVo :: {} ", resumeVo);
		
		//이력서 데이터 insert
		int refMemberseq = ((MemberVO) session.getAttribute("loginMember")).getMemberSeq();
		
		resumeVo.setRefMemberseq(refMemberseq);
		int resultCnt = resumeService.insertResumeTest(resumeVo);
		int resumeSeq = resumeVo.getResumeSeq();
		

		if(resumeSeq > 0 && resultCnt > 0) {
			//logger.info("eduList.getEducationVOList() :: {} " , educationVOList.getEducationVOList());
			//logger.info("resumeSeq :: {} ", resumeSeq);
			
			//학력사항 데이터 insert
			int ieducationSize = Integer.parseInt(educationSize);
			
			for(int i=0; i<ieducationSize;i++) {
				//System.out.println("ieducationSize :: " + ieducationSize + " /// i :: " + i );
				
				educationVOList.getEducationVOList().get(i).setRefResumeseq(resumeSeq);
				
				if(i==ieducationSize-1) {
					//System.out.println("aa");
					educationVOList.getEducationVOList().get(i).setLastEducation("Y");
					//System.out.println(educationVOList.getEducationVOList().get(i).getLastEducation());
				}
				
				//logger.info("eduList.getEducationVOList() :: {} " , educationVOList.getEducationVOList());
				
				resultCnt = educationService.insertEducation(educationVOList.getEducationVOList().get(i));
				

				logger.info("학력사항 데이터 insert 결과 :: {} ", resultCnt );
			}
			
			//희망근무조건
			logger.info("hopeworkVo :: {} " , hopeworkVo );
			//희망근무조건 insert
			
			hopeworkVo.setRefResumeseq(resumeSeq);
			resultCnt = hopeworkService.insertHopework(hopeworkVo);
			
			
			//경력사항 insert
			logger.info("mycareerVo :: {} " , mycareerVo);
			mycareerVo.setRefResumeseq(resumeSeq);
			resultCnt = mycareerService.insertMycareer(mycareerVo);
			
		}
		
		return "redirect:/member/mypageresumeTest.do";
	}
	
	
	//이력서 수정 박준일
	@RequestMapping(value="/resume/resumeUpdate.do")
	public String updateResume(@ModelAttribute ResumeVO resumeVo, 
							   @ModelAttribute HopeworkVO hopeworkVo,
							   @ModelAttribute MycareerVO mycareerVo,
							   @ModelAttribute EducationVO educationVOList,
							   @RequestParam String educationSize) {
		
		//System.out.println(resumeVo);
		
		//이력서 제목, 자기소개 제목, 자기소개 내용 업데이트
		int resumeCnt = resumeService.updateResume(resumeVo);
		//System.out.println("hopeworkVo :: " + hopeworkVo);
		
		hopeworkVo.setRefResumeseq(resumeVo.getResumeSeq());
		int hopeworkCnt = hopeworkService.updateHopework(hopeworkVo);
		
		//System.out.println("hopeworkCnt :: " + hopeworkCnt);
		
		//System.out.println(mycareerVo);
		
		mycareerVo.setRefResumeseq(resumeVo.getResumeSeq());
		int mycareerCnt = mycareerService.updateMycareer(mycareerVo);
		
		//학력사항 등록 및 수정		
		//System.out.println("eduList ::: " + educationVOList.getEducationVOList());
		
		
		//학력사항 데이터 insert
		int ieducationSize = Integer.parseInt(educationSize);
		int resumeSeq = resumeVo.getResumeSeq();
		
		int eduResult = 0;
		
		//학력정보수정
		for(int i=0; i<ieducationSize;i++) {
			
			educationVOList.getEducationVOList().get(i).setRefResumeseq(resumeSeq);
			
			if(i==ieducationSize-1) {
		
				educationVOList.getEducationVOList().get(i).setLastEducation("Y");
		
			}else {
				educationVOList.getEducationVOList().get(i).setLastEducation("N");
			}
			
			if(educationVOList.getEducationVOList().get(i).getEduSeq() == 0) {	//등록
				eduResult = educationService.insertEducation(educationVOList.getEducationVOList().get(i));	
			}else {			//수정
				eduResult = educationService.updateEducation(educationVOList.getEducationVOList().get(i));
			}
		}
		
		
		
		return "redirect:/member/mypageresumeTest.do";
	}
	
	//이력서 삭제 박준일
	@RequestMapping(value="/resume/resumeDelete.do")
	public String deleteResume(@RequestParam String resumeSeq) {
		
		int deleteCnt = resumeService.deleteResume(resumeSeq);
		
		return "redirect:/member/mypageresumeTest.do";
	}
	
	

	
	
	
	
	
	
}
