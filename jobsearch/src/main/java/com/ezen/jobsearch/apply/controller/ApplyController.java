package com.ezen.jobsearch.apply.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.apply.model.ApplyService;
import com.ezen.jobsearch.apply.model.ApplyVO;

@Controller
public class ApplyController {
	private final Logger logger
		=LoggerFactory.getLogger(ApplyController.class);
	
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping(value = "/apply.do", method = RequestMethod.POST)
	public String insertApply(@ModelAttribute ApplyVO applyVo, Model model) {
		logger.info("지원하기, applyVo={}", applyVo);
		
		String msg="오류가 발생했습니다.", url="/ann/detail.do?annSeq="+applyVo.getRefAnnseq();
		if(applyService.selectApplyYN(applyVo)>0) {
			msg="이미 지원한 공고입니다.";
		}else {			
			int cnt=applyService.insertApply(applyVo);
			logger.info("지원 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="지원되었습니다.";
			}
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping(value = "/applyCancel.do")
	public String deleteApply(@RequestParam(defaultValue = "0") int applySeq, Model model) {
		logger.info("지원 취소, 파라미터 applySeq={}", applySeq);
		
		String msg="지원 취소 중 오류 발생", url="/member/mypageapply.do";
		if(applySeq==0) {
			msg="잘못된 url입니다.";						
		}else {		
			int cnt=applyService.deleteApply(applySeq);
			
			if(cnt>0) {
				msg="입사지원이 취소되었습니다.";
			}
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/admin/stats.do")
	public String statistics() {
		logger.info("차트");
				
		return "admin/admin-statistics/statistics";
	}
	
	@RequestMapping(value = "/applyStats.do")
	@ResponseBody
	public Object selectStats() {
		
		Calendar cal=Calendar.getInstance();
		
		List<Map<String, Object>> list=applyService.selectCountByDate(cal.get(Calendar.MONTH)+1);
		logger.info("조회 결과list.size={}", list.size());
		
		JSONObject data=new JSONObject();
		
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		
		JSONArray title=new JSONArray();
		col1.put("label", "날짜");
		col1.put("type", "string");
		col2.put("label", "지원자 수");
		col2.put("type", "number");
		
		title.add(col1);
        title.add(col2);
        
        data.put("cols", title);
        
        JSONArray body = new JSONArray(); 
        for (Map<String, Object> map : list) { 
            
            JSONObject regDate = new JSONObject(); 
            regDate.put("v", map.get("REG_DATE")); 
            
            JSONObject count = new JSONObject(); 
            count.put("v", map.get("COUNT")); 
            
            JSONArray row = new JSONArray(); 
            row.add(regDate);
            row.add(count); 
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); 
            body.add(cell); 
                
        }
        
        data.put("rows", body); 
        
        return data; 
	}
}
