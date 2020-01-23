package com.ezen.jobsearch.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.category.model.CategoryVO2;
import com.ezen.jobsearch.category.model.CategoryVO3;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	//직업별 공고 리스트 페이지
	@RequestMapping("/cate/categoryList.do")
	public String categoryList(@RequestParam(value="cateSeq1", required=false, defaultValue="1") String cateSeq1 , Model model) {
		
		List<CategoryVO1> categoryList1 = categoryService.selectCategory1();
		model.addAttribute("categoryList1",categoryList1);
		
		List<CategoryVO2> categoryList2 = categoryService.selectSubCateList(cateSeq1);
		model.addAttribute("categoryList2",categoryList2);
		
		return "/ann/categoryList";
	}
	
	//두번째 카테고리 불러오기
	@RequestMapping("/cate/subCategoryList.do")
	public @ResponseBody List<CategoryVO2> subCategoryList(@RequestParam String cateSeq1) {
		
		List<CategoryVO2> subCategoryList= categoryService.selectSubCateList(cateSeq1);
		
		return subCategoryList;
	}
	
	
	//세번째 가테고리 불러오기
	@RequestMapping("/cate/thirdCategoryList.do")
	public @ResponseBody List<CategoryVO3> thridCategoryList(@RequestParam String cateSeq1, @RequestParam String cateSeq2){
		
		List<CategoryVO3> thirdCategoryList = categoryService.selectThirdCateList(cateSeq1, cateSeq2);
		
		
		return thirdCategoryList;
	}
	

}
