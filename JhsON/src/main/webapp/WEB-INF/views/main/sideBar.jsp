<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- Sidebar -->
 <%@ include file="/WEB-INF/views/main/channeldelete.jsp" %>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas">BIG HIT</i>
                </div>
                <div class="sidebar-brand-text mx-3">ON<sup>0.1</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
			<li class="nav-item active">
                <a class="nav-link" href="${hContext}/workspace/teamUserAdd_view.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>워크스페이스 생성</span>
                </a>
            </li>
			
			<!-- workspace transform -->
			 <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
			<li class="nav-item active" >
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMes"
                    aria-expanded="true" aria-controls="collapseMes">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>워크스페이스 전환</span>
                </a>
                <div id="collapseMes" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" id="workspacetfBtn">                    
                    	<c:forEach var="WorkSpaceVO" items="${workspaceList}">
   						 	<a class="collapse-item" type="button" id="wstranfrom_btn">
   						 		<c:out value="${WorkSpaceVO.wsName}"/>
   						 		<div id="workspaceLk" style="display: none"><c:out value="${WorkSpaceVO.wsLink}" /></div>   						 		
   						 	</a>
   						 	
						</c:forEach>      	
                    </div>
                </div>
            </li>
            
			<!-- Divider -->
            <hr class="sidebar-divider">
			
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${hContext }/main/storedThread.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>저장된 항목</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

			<li class="nav-item active">
                <a class="nav-link" href="index.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>멘션 및 반응</span></a>
            </li>

			<!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Nav Item - Pages Collapse Menu -->
            <!-- channels -->
            <li class="nav-item">
            <input type='hidden' id='helloworld'>
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMem"
                    aria-expanded="true" aria-controls="collapseMem">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>채널</span>
                </a>
                <div id="collapseMem" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" id="channelBtn">
                    
                    	<c:forEach var="ChannelVO" items="${channelList}">
   						 	<a class="collapse-item" type="button" id="channel_btn" >
   						 		<c:out value="${ChannelVO.chName}" />
   						 		<div id="channelLk" style="display: none"><c:out value="${ChannelVO.chLink}" /></div>
   						 	</a>
						</c:forEach>
   					
                       	
                        <a id="addChannelin" class="collapse-item" href="#" data-toggle="modal" data-target="#channelcreateModal">
                                + 채널 추가
                        </a>
                        
                                      	
                    </div>
                </div>
            </li>

			<!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMessage"
                    aria-expanded="true" aria-controls="collapseMessage">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>다이렉트 메시지</span>
                </a>
                <div id="collapseMessage" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<c:forEach var="ChannelVO" items="${channelListDM}">
   						 	<a class="collapse-item">#<c:out value="${ChannelVO.chName}" /></a>
						</c:forEach>
						
                        <a class="collapse-item" href="utilities-other.html" data-toggle="modal" data-target="#addteamModal">
                        	+ 팀원 추가
                        </a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseApps"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>앱</span>
                </a>
                <div id="collapseApps" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="utilities-color.html">GIT HUB</a>
                        <a class="collapse-item" href="utilities-border.html">CISCO</a>
                        <a class="collapse-item" href="utilities-animation.html">Google Drive</a>
                        <a class="collapse-item" href="utilities-other.html">+ Add Apps</a>
                    </div>
                </div>
            </li>
            
                   
        </ul>
        <!-- End of Sidebar -->
        
        <script type="text/javascript">

       	
     	// 클릭된 타겟 찾기
     	
     	
		$("#workspacetfBtn").click(function(event) {
			console.log("=============");
			var tmp = $(event.target).children("#workspaceLk").text(); //.parent().children("#workspaceLk").text();
			console.log("====="+tmp);
			$.ajax({
			    type:"GET",
			    url:"${hContext}/main/wsChanger.do",
			    dataType:"html", 
			    data:{
				    "toWsLink" : tmp
			    },
			    success:function(data){ //성공
				    //console.log("success");
				    //location.reload();	 
				    window.location.href="${hContext}/main/index.do?searchWord="+data;      
			    },
			    error:function(xhr,status,error){
			     alert("error:"+error);
			    },
			    complete:function(data){
			    	//window.location.href="${hContext}/main/index.do?searchWord="+"${sessionScope.channelVO.chLink}"; 
			    }   
			  
			});//--ajax 
			
			
		}); 

		$("#channel_btn").click(function(event) {
			
			/*var tmp = $(event.target).children("#channelLk").text(); //.parent().children("#workspaceLk").text();
			console.log("====="+tmp); */
			window.location.href="${hContext}/main/index.do?searchWord="+"${ChannelVO.chLink}";						
		});

		//채널나가기 이벤트
		$("#channelDelBtn").click(function(event) {
			/* alert("chdel test"); */
			 
			 var chLinkToDelete = $("#helloworld").val();
			 console.log("chLinkToDelete1:"+chLinkToDelete);	

			 var result = confirm("채널을 나가시겠습니까?");
			 if(!result){
			 return;
			 
			 }
			 
			 $.ajax({
	             type:"POST",
	             url:"${hContext}/channel/doDelete2.do",
	             dataType:"html", 
	             data:{
	                "chLink" : $("#helloworld").val(),
				    "userSerial" : "${sessionScope.usersVO.user_serial }"
	             },
	             
	             success:function(data){ //성공
	            	 location.reload();
	            
	             }
	           
	         });//--ajax 
		});

		//마우스우클릭
		$("#channelBtn").ready(function(){
			  //Show contextmenu:
			  $("#channelBtn").contextmenu(function(e){
				  var test1 = e.target.childNodes.item(1).textContent;
				  var test2 = JSON.stringify(test1);
				  console.log(test1);
				  console.log("test1123:"+test2);
				  document.getElementById('helloworld').value=test1;
			    //Get window size:
			    var winWidth = $(document).width();
			    var winHeight = $(document).height();
			    //Get pointer position:
			    var posX = e.pageX;
			    var posY = e.pageY;
			    //Get contextmenu size:
			    var menuWidth = $(".contextmenu").width();
			    var menuHeight = $(".contextmenu").height();
			    //Security margin:
			    var secMargin = 10;
			    //Prevent page overflow:
			    if(posX + menuWidth + secMargin >= winWidth
			    && posY + menuHeight + secMargin >= winHeight){
			      //Case 1: right-bottom overflow:
			      posLeft = posX - menuWidth - secMargin + "px";
			      posTop = posY - menuHeight - secMargin + "px";
			    }
			    else if(posX + menuWidth + secMargin >= winWidth){
			      //Case 2: right overflow:
			      posLeft = posX - menuWidth - secMargin + "px";
			      posTop = posY + secMargin + "px";
			    }
			    else if(posY + menuHeight + secMargin >= winHeight){
			      //Case 3: bottom overflow:
			      posLeft = posX + secMargin + "px";
			      posTop = posY - menuHeight - secMargin + "px";
			    }
			    else {
			      //Case 4: default values:
			      posLeft = posX + secMargin + "px";
			      posTop = posY + secMargin + "px";
			    };
			    //Display contextmenu:
			    $(".contextmenu").css({
			      "left": posLeft,
			      "top": posTop
			    }).show();
			    //Prevent browser default contextmenu.
			    return false;
			  });
			  //Hide contextmenu:
			  $(document).click(function(){
			    $(".contextmenu").hide();
			  });
			});
		
        </script>