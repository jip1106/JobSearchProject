package com.ezen.jobsearch.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.common.ProjectUtil;
import com.ezen.jobsearch.member.model.MemberService;
import com.ezen.jobsearch.member.model.MemberVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/admin/memberList.do")	
	public String memberList(@ModelAttribute MemberVO searchVo, Model model) {
		
		//System.out.println("memberList :: memberVO" + searchVo);
		
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		searchVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MemberVO> memberList = memberService.selectMemberList(searchVo);
		
		//System.out.println(memberList);
		
		int totalRecord = memberService.selectTotalRecord(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("totalRecord", totalRecord);
		
		
		return "/admin/admin-member/memberList";
	}
	@RequestMapping(value="/admin/memberDel.do")
	public String memberList(@RequestParam(value="memberSeq") String memberSeq, @RequestParam(value="type") String type) {
		
		//System.out.println("memberSeq :: " + memberSeq);
		//System.out.println("type :: " + type);
		
		type=type.toUpperCase();
				
		int delCnt = memberService.deleteMember(memberSeq, type);
		
		
		return "redirect:/admin/memberList.do";
	}
	
	@RequestMapping(value="/admin/memberListExcel.do")
	public void memberListExcel(HttpServletResponse response) throws Exception{
		
		List<MemberVO> memberList = memberService.selectAll();
		//System.out.println(memberList);

		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원리스트");

	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);


	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();

	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    


	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");

	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("전화번호");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("등록일");
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원유형");	    
	    
	    // 데이터 부분 생성

	    for(MemberVO vo : memberList) {

	        row = sheet.createRow(rowNo++);

	        cell = row.createCell(0);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue(vo.getMemberSeq());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getMemberName());

	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getMemberId());
	        
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getPhone());

	        
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getRegDate());
	        
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        String strRegType = "";
	        if(vo.getRegType().equals("1")) {
	        	strRegType = "일반회원";
	        }else if(vo.getRegType().equals("2")){
	        	strRegType = "기업회원";
	        }
	        cell.setCellValue(strRegType);	        


	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=mebmerList.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();

		
	}
	
}
