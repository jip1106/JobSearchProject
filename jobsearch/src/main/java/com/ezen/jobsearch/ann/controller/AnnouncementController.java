package com.ezen.jobsearch.ann.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.ann.model.AnnouncementService;
import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.category.model.CategoryVO2;
import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;
import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.resume.model.ResumeService;
import com.ezen.jobsearch.resume.model.ResumeVO;
import com.ezen.jobsearch.scrap.model.ScrapService;
import com.ezen.jobsearch.scrap.model.ScrapVO;
import com.ezen.jobsearch.viewann.model.ViewAnnService;
import com.ezen.jobsearch.viewann.model.ViewAnnVO;

@Controller
public class AnnouncementController {
	private final Logger logger
		=LoggerFactory.getLogger(AnnouncementController.class);
	
	@Autowired
	private AnnouncementService annService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private ViewAnnService viewAnnService;
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value = "/ann/getAnnListByLoc.do")
	public String getAnnListByLoc(String locationSeq1, String locationSeq2,String currentPage , Model model){
		
		//페이지 계산
		int pageRowCount = 6;	//한 페이지 컨텐츠 수 
		int startRow = (Integer.parseInt(currentPage)-1) * pageRowCount + 1;
		int endRow = startRow + pageRowCount - 1;
		
		//공고 리스트
		List<HashMap<String,Object>> annList = annService.getAnnListByLoc(locationSeq1, locationSeq2,startRow,endRow);
		
		
		//지역1 리스트
		List<LocationVO1> locationList1 = locationService.selectLocation1();
		
		//검색 지역
		String searchLocName = locationService.selectLocationName(locationSeq1);
		List<String> searchLocNameList = locationService.searchLocNameList(locationSeq2);
	
		//공고 검색 카운트
		int searchCount = annService.selectAnnListCount(locationSeq1,locationSeq2);
				
		int blockSize = 5;
		//페이징 셋팅
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(blockSize);
		pagingInfo.setRecordCountPerPage(pageRowCount);
		pagingInfo.setCurrentPage(Integer.parseInt(currentPage));
		pagingInfo.setTotalRecord(searchCount);
		
		//System.out.println(pagingInfo.toString());
		
		model.addAttribute("annList",annList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("searchCount",searchCount);
		model.addAttribute("searchLocNameList",searchLocNameList);
		model.addAttribute("searchLocName",searchLocName);
		model.addAttribute("locationList1", locationList1);
		
		return "/ann/locationList";		
		
	}
	

	//카테고리 선택에따른 공고 선택
	@RequestMapping("/ann/getAnnListBycate.do")
	public String getAnnListBycate(@RequestParam String cateSeq1, 
						 @RequestParam String cateSeq2, 
						 @RequestParam String cateSeq3, @RequestParam(defaultValue="1") String currentPage,
						 Model model){
			
	
		int pageRowCount = 6;	//한 페이지 컨텐츠 수 
		int startRow = (Integer.parseInt(currentPage)-1) * pageRowCount + 1;
		int endRow = startRow + pageRowCount - 1;
		
		//카테고리리스트1
		List<CategoryVO1> categoryList1 = categoryService.selectCategory1();
		model.addAttribute("categoryList1",categoryList1);
		
		//카테고리리스트2
		List<CategoryVO2> categoryList2 = categoryService.selectSubCateList(cateSeq1);
		model.addAttribute("categoryList2",categoryList2);
		
		//공고 리스트
		List<HashMap<String,Object>> annList = annService.getAnnListBycate(cateSeq1, cateSeq2,cateSeq3 , startRow, endRow);
		
		//공고 리스트 검색 카운트
		int searchCount = annService.selectAnnListCountBycate(cateSeq1, cateSeq2,cateSeq3);
		
		String searchCateName1 = categoryService.getSearchCateName1(cateSeq1);
		String searchCateName2 = categoryService.getSearchCateName2(cateSeq2);
		List<String> searchCateName3List = categoryService.getSearchCateName3List(cateSeq3);
		
		int blockSize = 5;
		//페이징 셋팅
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(blockSize);
		pagingInfo.setRecordCountPerPage(pageRowCount);
		pagingInfo.setCurrentPage(Integer.parseInt(currentPage));
		pagingInfo.setTotalRecord(searchCount);
		
						
		model.addAttribute("annList",annList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("searchCount",searchCount);
		
		//첫번째 카테고리 이름
		model.addAttribute("searchCateName1",searchCateName1);
		//두번째 카테고리 이름
		model.addAttribute("searchCateName2",searchCateName2);
		//세번째 카테고리 리스트
		model.addAttribute("searchCateName3List",searchCateName3List);
		
		
		return "/ann/categoryList";	
	}
		

	@RequestMapping("/ann/detail.do")
	public String annDetail(@RequestParam(defaultValue = "0")int annSeq, HttpSession session, Model model) {
		logger.info("공고 상세보기, 파라미터 annSeq={}", annSeq);
		
		if(annSeq==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/home.do");
			
			return "common/message";
		}
		//접속 회원이 일반회원일 경우 
		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		if(memberVo != null) {
			if(memberVo.getRegType().equals("1")) {
				//공고 조회수 업데이트
				int cnt=annService.updateAnnHits(annSeq);
				logger.info("공고 조회수 업데이트, cnt={}", cnt);
				ScrapVO scrapVo=new ScrapVO();
				scrapVo.setRefAnnseq(annSeq);
				scrapVo.setRefMemberseq(memberVo.getMemberSeq());
				
				ViewAnnVO viewAnnVo=new ViewAnnVO();
				viewAnnVo.setRefAnnseq(annSeq);
				viewAnnVo.setRefMemberseq(memberVo.getMemberSeq());
				
				//최근 본 공고 등록
				cnt=viewAnnService.insertViewAnn(viewAnnVo);
				logger.info("최근 본 공고에 등록, cnt={}", cnt);
				
				//즐겨찾기 여부
				int scrapYN=scrapService.selectScrapYN(scrapVo);
				logger.info("즐겨찾기 여부 scrapYN={}", scrapYN);
				
				//지원할 이력서 목록
				List<ResumeVO> resumeList=resumeService.selectResumeList(memberVo.getMemberSeq());
				logger.info("조회한 이력서 목록, resumeList.size()={}", resumeList.size());
								
				model.addAttribute("scrapYN", scrapYN);
				model.addAttribute("resumeList", resumeList);
			}
		}
		
		AnnounceMentVO vo=annService.selectBySeq(annSeq);
		logger.info("vo::::::: {}",vo);	
				
		model.addAttribute("vo", vo);
				
		return "ann/annDetail";

	}
	
	@RequestMapping(value = "/announcementStats.do")
	@ResponseBody
	public Object selectStats() {
	
		List<Map<String, Object>> list=annService.selectCountByCategory();
		logger.info("조회 결과list.size={}", list.size());
		
		JSONObject data=new JSONObject();
		
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		
		JSONArray title=new JSONArray();
		col1.put("label", "분야");
		col1.put("type", "string");
		col2.put("label", "공고 수");
		col2.put("type", "number");
		
		title.add(col1);
        title.add(col2);
        
        data.put("cols", title);
        
        JSONArray body = new JSONArray(); 
        for (Map<String, Object> map : list) { 
            
            JSONObject cateName = new JSONObject(); 
            cateName.put("v", map.get("CATE_NAME1")); 
            
            JSONObject count = new JSONObject(); 
            count.put("v", map.get("COUNT")); 
            
            JSONArray row = new JSONArray(); 
            row.add(cateName);
            row.add(count); 
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); 
            body.add(cell); 
                
        }
        
        data.put("rows", body); 
        
        return data; 
	}
	
	
	
}
