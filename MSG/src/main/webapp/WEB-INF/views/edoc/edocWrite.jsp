<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/edocWrite.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/dateTimePicker/dist/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/edocWrite.js"></script>
    <script src="https://kit.fontawesome.com/4c554cd518.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath }/resources/dateTimePicker/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath }/resources/dateTimePicker/dist/js/datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/dateTimePicker/dist/js/i18n/datepicker.ko.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jsTree/dist/themes/default/style.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jsTree/dist/jstree.min.js"></script>
    <script>
  		var jq = jQuery.noConflict();
  		
  		function getContextPath() { // contextPath 구하기
  			return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
  		}
  		
  		// 여기서부터 jstree

  		var selectedTree;
  		var flowLine = new Array();
  		var coopLine = new Array();
  		var referLine = new Array();
  		
  		jq.ajax({
  		    type:"get",
  		    url: "/msg/edoc/jstree.do",
  		    dataType: "json",
  		    success: function(response){
  		 		jq("#ajax_jstree")
  		 		.on("changed.jstree", function (e, data) {
					if(data.selected.length) {
						selectedTree = data.instance.get_node(data.selected[0]).text;
						/* console.log("선택된 요소입니다"+selectedTree); */
					}
				})
  		 		.jstree({
  		            core: {
  		                data: response
					}
  		        
  		        })
  		    }
  		});
    

	</script>
    <title>edocWrite</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section>
            <article>
                <div class="subNav">
                    <h3>전자결재</h3>
                    <ul>
                        <li onclick="location.href='${pageContext.request.contextPath}/edoc/srch.do'">문서검색</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/edoc/list.do'">내문서함</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/edoc/write.do'">문서기안</li>
                     </ul>
                </div>
                <div class="content">
                    <div class="control">
                        <input type="text" name="" id="" placeholder="제목을 입력하세요">
                        <form action="">
                            <div id="selectDocu" class="select-box">
                                <div id="currentExp" class="select-box__current" tabindex="1">
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D0" value="1" name="Ben"/>
                                    <p class="select-box__input-text">기타양식</p>
                                    </div>
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D1" value="2" name="Ben"/>
                                    <p class="select-box__input-text">공 문</p>
                                    </div>
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D2" value="3" name="Ben"/>
                                    <p class="select-box__input-text">비용정산서</p>
                                    </div>
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D3" value="4" name="Ben"/>
                                    <p class="select-box__input-text">구매요청서</p>
                                    </div>
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D4" value="5" name="Ben"/>
                                    <p class="select-box__input-text">지출결의서</p>
                                    </div>
                                    <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="D5" value="6" name="Ben" checked="checked"/>
                                    <p class="select-box__input-text">휴가신청서</p>
                                    </div><img id="iconExp" class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
                                </div>
                                <ul id="listExp" class="select-box__list">
                                    <li>
                                    <label class="select-box__option" for="D5" aria-hidden="aria-hidden">휴가신청서</label>
                                    </li>
                                    <li>
                                    <label class="select-box__option" for="D4" aria-hidden="aria-hidden">지출결의서</label>
                                    </li>
                                    <li>
                                    <label class="select-box__option" for="D3" aria-hidden="aria-hidden">구매요청서</label>
                                    </li>
                                    <li>
                                    <label class="select-box__option" for="D2" aria-hidden="aria-hidden">비용정산서</label>
                                    </li>
                                    <li>
                                    <label class="select-box__option" for="D1" aria-hidden="aria-hidden">공 문</label>
                                    </li>
                                    <li>
                                    <label class="select-box__option" for="D0" aria-hidden="aria-hidden">기타 양식</label>
                                    </li>
                                </ul>
                            </div>
                        </form>
                        <button type="button" name="" id="flowBtn" class="whiteBtn commonBtn">결재선 지정</button>
                    </div>
                    <div class="tbRow">
                        <table class="docuInfoTb">
                            <tr>
                                <td>문서번호</td>
                                <td>2020-G0001-001</td>
                            </tr>
                            <tr>
                                <td>기안자</td>
                                <td>경영지원부 과장 장그래</td>
                            </tr>
                            <tr>
                                <td>기안일자</td>
                                <td>2020/02/28</td>
                            </tr>
                            <tr>
                                <td>보안등급</td>
                                <td>
                                    <div class="secuBox">
                                        <form action="">
                                            <div class="select-box">
                                                <div class="select-box__current" tabindex="1">
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="S0" value="1" name="Ben"/>
                                                    <p class="select-box__input-text">C</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="S1" value="2" name="Ben"/>
                                                    <p class="select-box__input-text">B</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="S2" value="3" name="Ben"/>
                                                    <p class="select-box__input-text">A</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="S3" value="4" name="Ben" checked="checked"/>
                                                    <p class="select-box__input-text">S</p>
                                                    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
                                                </div>
                                                <ul class="select-box__list">
                                                    <li>
                                                    <label class="select-box__option" for="S3" aria-hidden="aria-hidden">S</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="S2" aria-hidden="aria-hidden">A</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="S1" aria-hidden="aria-hidden">B</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="S0" aria-hidden="aria-hidden">C</label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>보존연한</td>
                                <td>
                                    <div class="periodBox">
                                        <form action="">
                                            <div class="select-box">
                                                <div class="select-box__current" tabindex="1">
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="P0" value="1" name="Ben"/>
                                                    <p class="select-box__input-text">1년</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="P1" value="2" name="Ben"/>
                                                    <p class="select-box__input-text">3년</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="P2" value="3" name="Ben"/>
                                                    <p class="select-box__input-text">5년</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="P3" value="4" name="Ben"/>
                                                    <p class="select-box__input-text">10년</p>
                                                    </div>
                                                    <div class="select-box__value">
                                                    <input class="select-box__input" type="radio" id="P4" value="5" name="Ben" checked="checked"/>
                                                    <p class="select-box__input-text">영구</p>
                                                    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
                                                </div>
                                                <ul class="select-box__list">
                                                    <li>
                                                    <label class="select-box__option" for="P4" aria-hidden="aria-hidden">영구</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="P3" aria-hidden="aria-hidden">10년</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="P2" aria-hidden="aria-hidden">5년</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="P1" aria-hidden="aria-hidden">3년</label>
                                                    </li>
                                                    <li>
                                                    <label class="select-box__option" for="P0" aria-hidden="aria-hidden">1년</label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table class="docuFlowTb">
                            <tr>
                                <th rowspan="3" class="NoRBorder">결 재</th>
                                <th></th>
                                <th></th>
                                <th>장그래</th>
                                <th>안영이</th>
                                <th class="NoRBorder">천관웅</th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>장그래<br>직인</td>
                                <td></td>
                                <td class="NoRBorder"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>2020/02/28</td>
                                <td></td>
                                <td class="NoRBorder"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="tbRow">
                        <table class="docuRefeTb">
                            <tr>
                                <td>참 조</td>
                                <td>경영지원부</td>
                            </tr>
                        </table>
                        <table class="docuCoopTb">
                            <tr>
                                <th rowspan="3" class="NoRBorder">협 조</th>
                                <th></th>
                                <th></th>
                                <th class="NoRBorder">장백기</th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td class="NoRBorder"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td class="NoRBorder"></td>
                            </tr>
                        </table>
                    </div>
                    <div id="tbRowExp" class="tbRow">
                        <table class="docuContentTb">
                            <tr>
                                <td>일 시</td>
                                <td>
                                    <input type="text" data-range="true" data-multiple-dates-separator=" ~ " data-date-format="yyyy-m-d D"
                                    data-language="ko" id='timepicker-startend' class="datepicker-here"/>
                                    
                                    <i class='far fa-calendar-alt startendicon' style='font-size:32px'></i>
                                </td>
                                <td>잔여휴가</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용일수</td>
                                <td></td>
                                <td>구분</td>
                                <td>
                                    <form action="">
                                        <div id="selectVac" class="select-box">
                                            <div id="currentExp2" class="select-box__current" tabindex="1">
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V0" value="1" name="Ben"/>
                                                <p class="select-box__input-text">기타</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V1" value="2" name="Ben"/>
                                                <p class="select-box__input-text">무급</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V2" value="3" name="Ben"/>
                                                <p class="select-box__input-text">병가</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V3" value="4" name="Ben"/>
                                                <p class="select-box__input-text">경조사</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V4" value="5" name="Ben"/>
                                                <p class="select-box__input-text">공가</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V5" value="6" name="Ben"/>
                                                <p class="select-box__input-text">포상</p>
                                                </div>
                                                <div class="select-box__value">
                                                <input class="select-box__input" type="radio" id="V6" value="7" name="Ben" checked="checked"/>
                                                <p class="select-box__input-text">연가</p>
                                                </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
                                            </div>
                                            <ul id="listExp2" class="select-box__list">
                                                <li>
                                                <label class="select-box__option" for="V6" aria-hidden="aria-hidden">연가</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V5" aria-hidden="aria-hidden">포상</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V4" aria-hidden="aria-hidden">공가</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V3" aria-hidden="aria-hidden">경조사</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V2" aria-hidden="aria-hidden">병가</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V1" aria-hidden="aria-hidden">무급</label>
                                                </li>
                                                <li>
                                                <label class="select-box__option" for="V0" aria-hidden="aria-hidden">기타 휴가</label>
                                                </li>
                                            </ul>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>사유</td>
                                <td colspan="3">
                                    <textarea name="" id="" cols="85" rows="6" placeholder="사유를 입력하세요" style="resize: none;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td>
                                    <input type="text" name="" id="" class="textIpt" placeholder="비상 연락처를 입력하세요">
                                </td>
                                <td>업무/결재<br>대행</td>
                                <td>
                                    <input type="text" name="" id="" class="textIpt" placeholder="검색할 이름을 입력하세요">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tbRow">
                        <table class="docuAttachTb">
                            <tr>
                                <td>첨부파일</td>
                                <td>20200314_장그래_병원진단서.pdf</td>
                                <td><button type="button" name="" id="attachBtn" class="whiteBtn commonBtn">파일첨부</button></td>
                            </tr>
                        </table>
                    </div>
                    <div class="btnGrp">
                        <button type="button" id="cancleBtn" class="whiteBtn commonBtn">취 소</button>
                        <button type="button" id="tmpBtn" class="whiteBtn commonBtn">임시저장</button>
                        <button type="button" id="saveBtn" class="yellowBtn commonBtn">문서상신</button>
                    </div>
                </div> 
            </article>
        </div>
    </section>
    <!-- The Modal -->
    <div id="flowModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div class="flowTitle">
                <h1>결재선 지정</h1>
                <button type="button" id="loadBtn" class="whiteBtn commonBtn">불러오기</button>
                <button type="button" id="saveBtn" class="whiteBtn commonBtn">저장하기</button>
            </div>
            <div class="flowTbDiv">
                <table class="flowModalTb">
                    <tr>
                        <td>
                        	조직도
                        </td>
                        <td>

                        </td>
                        <td>
                        	결재
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="6">
                            <div id="ajax_jstree" class="demo"></div>
                        </td>
                        <td>
                            <div id="flowArrow">
	                            <i class="fas fa-angle-double-right arrowIcon" style="font-size:48px;color:#333333"></i>                            
                            </div>
                        </td>
                        <td  class="flowBox">
							<form action="">
								<table id="flowLineTb" class="flowLineTable">
									<tr id="deadline">
										<th colspan=3>이름</th>
										<th>전결</th>
										<th>삭제</th>
									</tr>

								</table>
							</form>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                        	협조
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-angle-double-right arrowIcon" style="font-size:48px;color:#333333"></i>
                        </td>
                        <td class="flowBox">
                            
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                        	참조
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-angle-double-right arrowIcon" style="font-size:48px;color:#333333"></i>
                        </td>
                        <td class="flowBox">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="marginTd" colspan="2">
                        </td>
                    </tr>
                </table>
                <div class="divBtn">
                    <button type="button" id="flowBoxBtn" class="whiteBtn commonBtn">확인</button>
                    <button type="button" id="closeBoxBtn" class="close whiteBtn commonBtn">취소</button>
                </div>
            </div>
        </div>
    </div>
    <script>
		
		$("#flowArrow").click(function(){
	  		$.ajax({
	  		    type:"get",
	  		    url: "/msg/edoc/jstreeMem.do",
	  		    data: {
	  		    	name : selectedTree
	  		    },
	  		    dataType: "json",
	  		    success: function(response){
/* 	  		 		console.log("dept"+response['dept']);
	  		 		console.log("name"+response['name']); */
	  		 		var tmp = [response['dept'],response['name']];
					flowLine.push(tmp);
	  		 		/* console.log(flowLine.length); */
	  		 		if(flowLine.length > 5){
	  		 			alert("결재선은 최대 5명까지 지정 가능합니다.");
	  		 			flowLine.splice(5,1);
	  		 			return;
	  		 		}
	  		 		var i = flowLine.length - 1;
					$("#flowLineTb").append("<tr id=flowLine"+i+"><td>"+response['dept']+"</td><td></td><td>"+response['name']+"</td><td><label class='flowLine-container kor float' for='flowLine"+flowLine.length+"'><input type='radio' name='flowLine' id='flowLine"+flowLine.length+"'><span class='flowLine-checkmark'</span></label></td><td id='flowBoxX'><img src='${pageContext.request.contextPath}/resources/image/X-icon.png' onclick='removeFlow(this)' class='flowBoxX'/></td></tr>");
					/* console.log(flowLine); */
	  		    }
	  		});
		});
		
		function removeFlow(obj){
			jq("#deadline").siblings("tr").remove();
			var indexStr = jq(obj).parent().parent("tr").attr("id");
			/* console.log(indexStr); */
			var indexNo = indexStr.substr(indexStr.length-1);
			/* console.log(indexNo); */
			flowLine.splice(indexNo,1);
			/* console.log(flowLine); */
			
 			for(var i in flowLine){
				$("#flowLineTb").append("<tr id=flowLine"+i+"><td>"+flowLine[i][0]+"</td><td></td><td>"+flowLine[i][1]+"</td><td><label class='flowLine-container kor float' for='flowLine"+flowLine.length+"'><input type='radio' name='flowLine' id='flowLine"+flowLine.length+"'><span class='flowLine-checkmark'</span></label></td><td id='flowBoxX'><img src='${pageContext.request.contextPath}/resources/image/X-icon.png' onclick='removeFlow(this)' class='flowBoxX'/></td></tr>");
			}
			
		};
		
		$('#timepicker-startend').datepicker({
			onSelect: function onSelect (fd) {
				console.log(fd)
		    }
		})
	</script>
</body>
</html>