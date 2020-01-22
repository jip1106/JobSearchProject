var tabButtons=document.querySelectorAll(".tabContainer .buttonContainer button");
var tabPanels=document.querySelectorAll(".tabContainer  .tabPanel");

function showPanel(panelIndex,colorCode) {
	
    tabButtons.forEach(function(node){
        node.style.backgroundColor="";
        node.style.color="";
    });
    
    if(panelIndex==0){	//신입
    	$("#careerType").val(1);
    	
    }else if(panelIndex==1){
    	$("#careerType").val(2);
    }
    tabButtons[panelIndex].style.backgroundColor=colorCode;
    tabButtons[panelIndex].style.color="white";
    tabPanels.forEach(function(node){
        node.style.display="none";
    });
    tabPanels[panelIndex].style.display="block";
    tabPanels[panelIndex].style.backgroundColor="white";
}
showPanel(0,'#007bff');