<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="navbar-header">
		<a href="#" class="navbar-brand"></a>
	</div>
	<div class="collapse navbar-collapse" id="three">
		<div class="nav-logo">
			<a href="${pageContext.request.contextPath}/main/mainpage.do" class="navbar-brand nav-fixed-1"></a>
			<ul class="nav navbar-nav">
				<li class="n_click" ng-class="{'active':'main'=='${activeBar }'}"><a href="${pageContext.request.contextPath}/main/mainpage.do" class="m_nav">메인페이지</a></li>
				<li><a href="#myModal2" data-toggle="modal" data-target="#myModal2" class="m_nav">글쓰기</a></li>
				<li ng-class="{'active':'profile'=='${activeBar }'}"><a href="${pageContext.request.contextPath}/profile/myprofile.do" class="m_nav">회원정보</a></li>
			</ul>
		</div>
		<div class="nav-logo">
			<form class="navbar-form">
				<div class="form-group nav-control">
					<input type="text" class="form-control" ng-model="searchValue" size="40" placeholder="Search" />
				</div>
				<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal4" ng-click="getData2(searchValue);test(searchValue2)"><i class="glyphicon glyphicon-search"></i></button>
			</form>
		</div>
		
		<div class="nav-right collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/search/userpage.do?id=${id}">
				<span class="glyphicon glyphicon-user" style="font-size:15px;"></span>마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- 사진 업로드 모달 -->
<div class="modal fade" id="myModal2">
	<!-- modal-lg  | default | modal-sm -->	
<div class="modal-dialog modal-lg">
	
	<div class="modal-content" >
		<div class="modal-header">
			<p><h4 style="text-align:center;">새로운 피드 작성</h4></p>
		</div>
		<div class="modal-body" id = "loadModalBody" >
		<!-- 업로드 폼 Modal -->		
				<div class="panel panel-primary"  >
					
					<form id="upload-image-form" method="post" enctype="multipart/form-data">			
						<label for="content"></label>					
						<div class="panel-body">								
							<div class="form-group">
								<!-- <input class="form-control" rows = "5" type="text" name="content" id="content"/> -->
								<textarea name="content" id="content" rows="5" class = "form-control" placeholder="오늘 기분이 어떠신가요?"></textarea>
							</div>
							<div class="filebox">
								<input type="text" class="form-control" name="tag" placeholder="hashtag를 입력하세요"><br />
								<label class="btn btn-default btn-file">
									파일추가<input  type="file" name="file" id="myFile" class="myFile" required>
								</label>
								<div id="image-preview-div" style="display: none">
		                        	<img id="preview-img" src="">
		                     	</div>	
							</div>
						</div>		
						<div class="panel-footer panel-right">
								<button class="btn  btn-primary" id="upload-button" type="submit" disabled>업로드</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</form>
					
					<div class="alert alert-info" id="loading" style="display: none;"
					role="alert">
						Uploading image...
						<div class="progress">
							<div class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuenow="45" aria-valuemin="0"
								aria-valuemax="100" style="width: 100%"></div>
						</div>
					</div>
					<div id="message">
					</div>
				</div>				
	<!-- 여기까지!!!!! -->
			<!-- 물어볼곳	<br> 
				<div class="alert alert-info" id="loading" style="display: none;"
					role="alert">
					Uploading image...
					<div class="progress">
						<div class="progress-bar progress-bar-striped active"
							role="progressbar" aria-valuenow="45" aria-valuemin="0"
							aria-valuemax="100" style="width: 100%"></div>
					</div>
				</div> 
			<div id="message">
			</div>		-->	
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달로 뜨는 검색 결과창 -->
<div class="modal fade" id="myModal4">
  <div class="modal-dialog modal-lg">
 
    <div class="modal-content">
   	 <div class="modal-header">
   	 	<button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
	  	<p><h4 style="text-align:center;">검색 결과</h4></p>
	  </div>
      <div class="modal-body">
        
        <div class="modal-title">
        	<!-- 검색어 입력 -->
 		<div class="insideSearch">
	   		<input type="text" ng-keyup="getData2(searchValue2)" ng-model="searchValue2" class="form-control" aria-describedby="basic-addon2"
	   			id="innerSearch" placeholder="검색조건을 입력해주세요">
	   			<button type="button" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
 		</div>		
       	<!-- 카테고리 -->
   		<div class="form-group search-category">    	
	    	<ul class="nav nav-justified">
			    <li class="s_click active">
			      <a href="#a" ng-click="selectValue='pop'; getData2(searchValue);" data-toggle="tab" class="s_menu">인기</a>
			    </li>
			    <li>
			      <a href="#a" ng-click="selectValue='human'; getData2(searchValue);" data-toggle="tab" class="s_menu">사람</a>
			    </li>
			    <li>
			      <a href="#a" ng-click="selectValue='tag'; getData2(searchValue);" data-toggle="tab" class="s_menu">태그</a>
			    </li>
		    </ul>
  		</div>
  				
       </div>   
     <!-- 검색 결과창 modal-body -->      
     	<div class="tab-contents">
     		<div class="tab-pane fade in active" id="a">
			<table class="table table-bordered table-hover">
				<tbody class="tab-pane">
					<tr data-link="row" class="rowlink" ng-required="true" ng-model="ulli" ng-repeat="tmp in searchList">
						<td style="padding:20px;"><img ng-src="${pageContext.request.contextPath}/upload/{{tmp.orgFileName}}" width="50" style="border-radius: 50%; display:inline-block;" alt="" />
						<a href="${pageContext.request.contextPath}/search/userpage.do?id={{tmp.id}}" class="s-result" style="display:inline-block">{{tmp.name}} {{tmp.id}}</a>{{tmp.count}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
     </div>
    
   </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->