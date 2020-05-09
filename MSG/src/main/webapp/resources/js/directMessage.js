var lastID = 0;
var toId = "";
function getContextPath() { 
//	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	return '${pageContext.request.contextPath}';
}

hdjq(function(){
    hdjq(".dmBar").hide();
});

hdjq(function(){
    hdjq("#dmClose").click(function(){
    	hdjq('#dm-container').empty();
    	hdjq("#name-span").empty();
    	hdjq(".dmBar").fadeOut(100);
    })
});

hdjq(document).ready(function(){
	var repeatDmList = "";
	var repeatDmRead= "";
	var dmKeyword = hdjq("input[name=dmKeyword").html();
	hdjq("#hamburger").change(function(){
        if(hdjq("input:checkbox[id='hamburger']").is(":checked")==true){
        	dmListFunction();
        	repeatDmList = setInterval(function() {
        		dmListFunction();
        	}, 3000);
        	getAllUnreadDm();
        	repeatDmRead = setInterval(function() {
        		getAllUnreadDm();
        	}, 3000);
        }
        else if(hdjq("input:checkbox[id='hamburger']").is(":checked")==false){
        	clearInterval(repeatDmList);
        }
        hdjq("#dm-search-icon").click(function(){
        	clearInterval(repeatDmList, repeatDmRead);
        });
        hdjq("#srchDmWord").keyup(function(event){
        	 if (event.keyCode == 13) {
        		 searchMember();
        		 clearInterval(repeatDmList, repeatDmRead);
        	 }
        });
	});
});
function getAllUnreadDm() {
	hdjq.ajax({
		type : "Post",
		url : "/chat/getAllUnreadDm.do",
		data:{
			fromId: fromId
		},
		success : function(data) {
			hdjq("#getAllReadDm").html(data);
		}
	});
}
function dmListFunction() {
	hdjq.ajax({
		type : "GET",
		url : "/chat/headerDmList.do",
		dataType: "json",
		success : function(data) {
			hdjq("#dmList").html('');
			for (var i = 0; i < data.length; i++) {
					addList(data[i]['empImage'], data[i]['empName'], data[i]['jobName'], data[i]['toId'], data[i]['unread']);
			}
		}
	});
}
function searchMember() {
	var dmKeyword = hdjq("input[name=dmKeyword").val();
	hdjq.ajax({
		type : "GET",
		url : "/chat/headerDmList.do",
		data:{
			keyword: dmKeyword,
		},
		dataType: "json",
		success : function(data) {
			hdjq("#dmList").html('');
			for (var i = 0; i < data.length; i++) {
				
				addList(data[i]['empImage'], data[i]['empName'], data[i]['jobName'], data[i]['toId'], data[i]['unread']);

			}
		} 
	});
}
function addList(empImage, empName, jobName, toId, unread) {
	if(unread == 0){
		hdjq("#dmList").append(
							'<li>'+
							'<a href="#" onclick="dmWindow('+"'"+toId+"', '"+empName+"'"+');">'+
							'<img src="/resources/upload/empImg/'+ empImage+'" class="member-img">'+
							'<span class="headerlistname">'+empName+' '+
							jobName+
							'</span>'+
							'</li>');
	}else{
		hdjq("#dmList").append(
							 '<li>'+
							 '<a href="#" onclick="dmWindow('+"'"+toId+"', '"+empName+"'"+');">'+
							 '<img src="/resources/upload/empImg/'+ empImage+'" class="member-img">'+
							 '<span class="headerlistname">'+empName+' '+
							 jobName+
							 '</span>'+
							 '<span class="getUnread">'+unread+'</span>'+
							 '</li>');
	}
}
function dmWindow(paramId, empName){
	hdjq('#dm-container').empty();
	hdjq("#name-span").html(empName);
	hdjq(".dmBar").fadeIn(100);
	toId = paramId;
	
	chatListFunction(0, toId, fromId);
	
	var repeat = setInterval(function() {
		chatListFunction(lastID, toId, fromId);
	}, 1000);
	
	hdjq("#dmClose").click(function(){
		clearInterval(repeat);
	});

}

function chatListFunction(type, toId, fromId) {
	hdjq.ajax({
		cache: false,
		type : "POST",
		url : "/chat/msgList.do",
		data : {
			fromId : encodeURIComponent(fromId),
			toId : encodeURIComponent(toId),
			listType : type
		},
		success : function(data) {
			if (data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for (var i = 0; i < result.length; i++) {
				
				var originDate = result[i][4].value;
				var year = originDate.substring(23,28);
				var subMonth = originDate.substring(4,7);
				var day = originDate.substring(8,10);
				if(day < 10){
					day = day.substring(1,2);
				}
				var date = new Date(year+"/"+subMonth+"/"+day);
		        var week = new Array('일','월','화','수','목','금','토');
		        var dayOfWeek = week[date.getDay()];
				var month = date.getMonth()+1;
				var hrDate = year+"년 "+month+"월 "+day+"일 "+dayOfWeek+"요일";
				var hour = originDate.substring(11,13);
				var minute = originDate.substring(14,16);
				var timeType = "AM";
				var hideDate = hrDate;
				if(hour >= 12){
					timeType = "PM";
					hour -= 12;
				}else{
					hour = hour.substring(1,2);
				}
				var msgTime = hour+":"+minute+" "+timeType;
				addChat(result[i][2].value, result[i][3].value, msgTime, hrDate, hideDate, result[i][5].value, fromId);
			}
			lastID = Number(parsed.last);
		}
	});
}

function addChat(toId, msgContent, msgTime, hrDate, hideDate, empImage, fromId) {
		let style = {display: "none"};
	var selHideDate =hdjq("#dm-container").children().children("p:last").text();
	if(selHideDate != hideDate){
		hdjq("#dm-container").append(
									'<div id="hr-container">'
					                +'<hr class="dmHr" id="hr-left" align="left">'
					                +'<span id="span-date">'
					                +'</span>'
					                +hrDate
					                +'<hr class="dmHr" id="hr-right" align="right">'
					                +'</div>');
	}
	if(toId == fromId ){
		hdjq("#dm-container").append(
									'<div id="from-dm">'
					                +'<img src="/resources/upload/empImg/'+empImage+'" id="from-dm-img" class="member-img">'
					                +'<div id="from-dm-content" class="dm-content">'+msgContent
					                +'<span id="from-dm-time" class="dm-time">'
					                +msgTime
									+'</span>'
									+'</div>'
									+'<p>'
									+hideDate
									+'</p>'
				            		+'</div>');
	}else{
		hdjq("#dm-container").append(
									'<div id="to-dm">'
						            +'<img src="/resources/upload/empImg/'+empImage+'" id="to-dm-img" class="member-img">'
						            +'<div id="to-dm-content" class="dm-content">'+msgContent
						            +'<span id="to-dm-time" class="dm-time">'
						            +msgTime
						            +'</span>'
						            +'</div>'
						            +'<p>'
									+hideDate
									+'</p>'
					            	+'</div>');
	}
	hdjq('#dm-container').scrollTop(hdjq('#dm-container')[0].scrollHeight);
	hdjq("#dm-container").children().children("p:last").css(style);
	
}

function submitFunction() {
	var msgContent = hdjq("#msgContent").val();
	hdjq.ajax({
		type : "POST",
		url : "/chat/msgInsert.do",
		data : {
			fromId : encodeURIComponent(fromId),
			toId : encodeURIComponent(toId),
			msgContent : encodeURIComponent(msgContent),
			empNo : encodeURIComponent(empNo)
		},
		success : function(result) {
			if (result == 1) {
				autoClosingAlert('#successMessage', 2000);
			} else if (result == 0) {
				autoClosingAlert('#dangerMessage', 2000);
			} else {
				autoClosingAlert('#warningMessage', 2000);
			}
		}
	});
	hdjq('#msgContent').val('');
}
