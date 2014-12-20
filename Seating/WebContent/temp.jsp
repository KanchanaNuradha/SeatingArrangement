<!doctype html>
<html>
<head>
<link href="Lib/bootstrap/css/bootstrap.css" rel="stylesheet">

<script src="Lib/Js/jquery-latest.js">
    </script>
<script src="Lib/bootstrap/js/bootstrap.js">
    </script>
<link href="Lib/bootstrap/css/bootstrap-editable.css" rel="stylesheet"/>
<script src="Lib/bootstrap/js/bootstrap-editable.min.js">
    </script>
<script src="Lib/Js/jquery.mousewheel.js">
    </script>
<script src="Lib/Js/jquery.panzoom.min.js">
    </script>

<script src="Lib/Js/jstorage.min.js">
    </script>    
    
<script src="Lib/Js/jquery-ui/jquery-ui.min.js">  
</script>

<script>
		
	  function saveData(){
			
		  $("[data-key]").each(function(index,dataElem){
			  
			  var key = '';
			  var value = '';
			  
			  key = $(dataElem).attr("data-key");
			  
			  if(!key) {
				  return true;
			  }
			  
			  
			  if( $(dataElem).attr("data-bulk") == "true"){
				  
				  value = [];
				  
				  $(dataElem).find( $(dataElem).attr("data-item") ).each(function(index,dataItem){
					  value.push($(dataItem).text());  
				  });
				  
				  $.jStorage.set(key,value);
				  return true;
			  }
			  
				  
			  if( $(dataElem).is("textarea,input") ) {
				  value = $(dataElem).val();  
			  } else  {
				  value = $(dataElem).text();  
			  }
			  
			  if(!!value) {
				  $.jStorage.set(key,value);
			  }
			  
		 });
		  
	  }
	  
	  function loadData(){

		  
		$("[data-key]").each(function(index,dataElem){
			  
			  var key = '';
			  var value = '';
			  
			  key = $(dataElem).attr("data-key");
			  
			  if(!key) {
				  return true;
			  }
				  
			  value = $.jStorage.get(key,'');
			  
			  
			  if( $(dataElem).attr("data-bulk") == "true" || value.length>0 ){
				  
				  $(value).each(function(index,data){
					  seatingApp.addGuest({},data); 
				  });
				  
				  return true;
			  }
			  
			  
			  if( $(dataElem).is("textarea,input") ) {
				   $(dataElem).val(value);  
			  } else  {
				   $(dataElem).text(value);  
			  }
		 });

		  
	  }
	  
	  $(document).ready(function(){
		  //loadData();
	  });

	  /*	
      function drop(ev) {
        
       if(  !(ev instanceof MouseEvent) )
        	return true;
        
        ev.preventDefault();
        //ev.dataTransfer.dropAllowed="move";
        var data=ev.dataTransfer.getData("text/html");
        ev.target.appendChild(document.getElementById(data).cloneNode(true), 200,200);
        
      }
      function allowDrop(ev)
      {
        ev.preventDefault();
      }
      function drag(ev) {
        ev.dataTransfer.setData("text/html", ev.target.id);
      } */     
     </script>
<style>
      .dragImage {
      }
      
      body {
        background-color: #7730A1;
      }
      .canvas {
        height: 540px;
        background-color: white;
      }
      
      .draggable-guest.ui-draggable-dragging {
        border-color: #E3B14F;
        border-width: 1px;
        background-color: #E3B14F;
        font-weight: bold;
        color: black;
        cursor: move;
        max-width: 12em;
        z-index: 200;
    }
    
    input[type="date"] {
     font-weight: bold;
    }
    
    ::-webkit-calendar-picker-indicator:hover {
      color:#7730A1;
    }
    
    .panzoom {
    	background-color: #E6E600;
    	margin-top:20px;
    	margin-left:25px;
    }
    
    
    .modal-backdrop.fade.in {
    	display:none !important;
    }
    
    .CustomModal {
    	left: -800px !important;
    }
    
</style>
</head>
<body>

 
<div id="fb-root"></div>

 
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">
				Toggle navigation </span>
				<span class="icon-bar">
				</span>
				<span class="icon-bar">
				</span>
				<span class="icon-bar">
				</span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active">
					<img src="Images/Gupta_Zaveri_MARK_ROMINE_PHOTOGRAPHY_0028_low.jpg" alt="Your seat is still booked height=" 12" width="165" align="middle">
					</li>
					<li>
					<a>
					<h1>
					<span style="color:black">
					Seating Arrangement Manager </span>
					</h1>
					</a>
					</li>
				</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
				<a>
				<h4>
				<font color="black">
				Because <span style="color:blue">
				you deserve </span>
				the window seat </font>
				</h4>
				</a>
				</li>
			</ul>
			</li>
		</ul>
	</div>
	</nav>
</div>
</div>
<div class="row clearfix">
<div class="col-md-4 column">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">
			Event </h3>
			<div>
			    <input type="radio" name="eventType" value="Informal" onClick="lockFormal()">
			    <span style="color:black">Informal</span>			    
			    <input type="radio" name="eventType" value="Formal" onClick="lockInformal()">
			    <span style="color:black">Formal</span>
			
			    <script type="text/javascript">
			    function lockInformal() {
			    	$(".templatePanel").attr("data-toggle","").closest(".panel").find(".collapse").removeClass("in");
			    	$("#FormalPanel").attr("data-toggle","collapse").closest(".panel").find(".collapse").addClass("in");
			    }
			    
			    function lockFormal() {
			    	$(".templatePanel").attr("data-toggle","").closest(".panel").find(".collapse").removeClass("in");
			    	$("#InformalPanel").attr("data-toggle","collapse").closest(".panel").find(".collapse").addClass("in");
			    }
			    </script>
			    
			    <br>
				<input data-key="eventName" name="eventName" id="eventName">
				</input>				
				
				<span style="cursor: pointer;">
					<img id="add-people-img" type="image" src="Images/btnNewPeople.png" alt="Add People" 
					     align="center" width="42" height="42" title="Add People">
				</span>
				<script>

$(document).ready(function(){
	
	$("#add-people-img").click(function(event){
	
		$('.bs-example-modal-sm').modal("show");
		return false;	
	
	});

});
				</script>
			</div>
		</div>
		<div class="panel-body">
			 Location
		</div>
		<div>
			<textarea data-key="eventLocation" name="eventLocation" id="venue" rows="1" cols="19" style="margin-left:15px">
			</textarea>
			<input type="image" id="addMenu" src="Images/thali.jpg" title="Add Menu" width="57" height="39" align="center">
			</input>
			<script>
			$(document).ready(function(){
				
				$("#addMenu").click(function(event){
				
					$('.MenuModal').modal("show");
					return false;	
				
				});

			});			 
			</script>
		</div>
		<div class="panel-footer">
			 Event Date
		</div>
		<div>
		<!-- Add Calendar instead -->
			<input data-key="eventDate" type="date" name="eventDate" min="2013-01-02" id="eventDate" width="50"
			       style="margin-left:15px">
			 </input>
			 <input type="time" id="eventTime"/>
			
		<!--	
	    <script>
	     $(function() {
	    	 $("#start_date").datepicker({beforeShowDay: $datepicker.noWeekends});
	     });
	    </script>
	    -->
	    
			<input class="save-data" type="image" src="Images/btnSaveProject.png" title="Save Layout" align="center" onclick="PrintElem('#canvas')">
			</input>
		</div>
	</div>
	<div class="panel-group" id="panel-965794">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title templatePanel" id="FormalPanel" data-toggle="collapse"
				   data-parent="#panel-965794" href="#panel-element-974378">
				<span style="color:black">
				Formal Seating Template </span>
				</a>
			</div>
			<div id="panel-element-974378" class="panel-collapse collapse in">
				<div class="panel-body" id="seatImgsF" >
				
<!--				ondrop="drop(event)" ondragover="allowDrop(event)">-->
				
					<img class="dragImage" id="drpImg1" src="Images/conferenceRoom2.gif" draggable="true" title="Conference" width="72" height="72" hspace="10"> 
					 
					<img class="dragImage" id="drpImg2" src="Images/dining.jpg" draggable="true" title="Dinning" width="82" height="72" hspace="10">
					<img class="dragImage" id="drpImg3" src="Images/classroom.jpg" draggable="true" title="Classroom" width="62" height="72" vspace="10" hspace="10">
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title templatePanel" id="InformalPanel" data-toggle="collapse"
				   data-parent="#panel-965794" href="#panel-element-845215">
				<span style="color:black">
				Informal Seating Template </span>
				</a>
			</div>
			<div id="panel-element-845215" class="panel-collapse collapse">
				<div class="panel-body" id="seatImgsIF" >
				
<!--				  ondrop="drop(event)" ondragover="allowDrop(event)">-->
				  
					<img class="dragImage" id="drpImg4" src="Images/theatre.jpg" draggable="true"  title="Theatre" width="72" height="72" hspace="20" vspace="10">
					<img class="dragImage" id="drpImg5" src="Images/wedding.png" draggable="true" title="Wedding" width="72" height="72" hspace="10">
					<img class="dragImage" id="drpImg6" src="Images/collegeEent.jpg" draggable="true" title="College Event" width="72" height="72" hspace="10" vspace="10">
				</div>
			</div>
		</div>
	</div>
	
	 &nbsp;&nbsp; <button type="button" class="btn btn-default" id="customButton">
	<span style="color:black">
	Custom </span>
	<script>

	$(document).ready(function(){
		
		$(".save-data").click(function(event){
			saveData();
		});
	
		$("#customButton").click(function(event){
		
			$('.CustomModal').modal("show");
			return false;	
		});
	});
	</script>
	</button>
	
	&nbsp;&nbsp; <button type="button" class="btn btn-default" id="shareButton">
	<span style="color:black">
	Share </span>
	
	<script>
	$(document).ready(function(){
		
		$("#shareButton").click(function(event){
		
			$('.ShareModal').modal("show");
			return false;	
		});
		});
	</script>
	</button>
</div>

<div id="canvas" class="col-md-6 column canvas parent">
	<div class="panzoom" style="height:500px; width:500px;" id="template">
	
<!--	 ondrop="drop(event)" ondragover="allowDrop(event)">-->
		
	</div>
	
	<!--
<canvas style:relative>
</canvas>
-->
</div>


	<script>
			(function() {
				var $section = $('#canvas');
				var $panzoom = $section.find('.panzoom').panzoom({
	                
						startTransform: 'scale(1)',
	                    increment: 0.1,
	                    minScale: 1,
	                    maxScale: 3,
	                    disablePan: true
	                }
				);
				
				$panzoom.parent().on('mousewheel.focal', function( e ) {
					e.preventDefault();
					var delta = e.delta || e.originalEvent.wheelDelta;
					var zoomOut = delta ? delta < 0 : e.originalEvent.deltaY > 0;
					$panzoom.panzoom('zoom', zoomOut, {
					increment: 150,
					animate: true,
					focal: e});
				});
			})();
		</script>

<div class="col-md-2 column">
	<div class="list-group group-name-list">
		<a data-key="groupNameTarget" id="groupNameTarget" href="http://www.layoutit.com/build?r=20454845#" class="list-group-item active group-list">
		Group_Name </a>
		
		<div class="list-group-item host-list" id="hostNm">
			 
			 <h4 class="list-group-item-heading">Host_Name</h4>
				
			 <p data-key="hostName" class="last list-group-item-text" id="guestList"></p>
		</div>
		
		<div class="list-group-item guest-list" data-key="guestList" data-bulk="true" data-item=".list-group-item-text" id="guestListGroup">
		
			<h4 class="list-group-item-heading">List_of_Members </h4>
			
			<p class="last list-group-item-text" id="guestList">
			</p>
			
		</div>
		
		<a class="list-group-item active" id="HelpClick">
		Help </a>
		<script>
		$(document).ready(function(){
			
			$("#HelpClick").click(function(event){
			
				$('.HelpModal').modal("show");
				return false;	
			});
			
			$(".clearcanvas").click(function(event){
				
				if(confirm("This will delete all components on Canvas, Are you sure ?")){
					$(".panzoom.ui-droppable").html("");	
				}
				
				return false;
			});
			
		});		
		</script>
	</div>
	
	<div> <button class="clearcanvas btn" name="Clear">Clear Canvas</button> </div>
	<div id="menuList">
	 
	<div>
	
</div>
</div>
</div>

<!-- Share Modal -->
<div class="modal fade ShareModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" 
      aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
     <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
     <span class="sr-only">Close</span></button>
        <h4 class="modal-title">Modal title</h4>
     </div>
     
     <div class="modal-body">
     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
				
		<span>Facebook</span>
<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" 
     data-layout="button_count">
</div>

		</div>
	</div>
</div>
     </div>
    </div>
   </div>
  </div> 

<!-- Menu Modal -->
<div class="modal fade MenuModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" 
      aria-hidden="true" height="100" width="100">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
     <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
     <span class="sr-only">Close</span></button>
        <h4 class="modal-title">Menu Items</h4>
     </div>
     
     <div class="modal-body" width="193" height="119">
<!--     <div class="container"> -->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5">
				<img src="Images/maxresdefault.jpg" id="menuImg" width="172" height="100"/>
				<textarea rows="7" cols="28" id="menuNotes">Menu Notes..</textarea>
				</div>
			</div>
			
			<div>
			 <input type="radio" style="margin-left:15px" id="snacksRadio" onClick="snacksAre()">Snacks</input>
			 <input type="radio" style="margin-left:15px" id="dinnerRadio" onClick="dinnerIs()">Dinner</input>
			 <input type="radio" style="margin-left:15px" id="LunchRadio" onClick="lunchIs()">Lunch</input>
			</div>
			
			<script>
			 function snacksAre() {
				 
			 }
			 
			 function dinnerIs() {
				 
			 }
			 
			 function lunchIs() {
				 
			 }
			</script>
			
			<!-- 
			<ul class="nav nav-tabs">
				<li class="active">
					<a href='#tab1' data-tab="1">Snacks</a>
				</li>
				<li>
					<a href='#tab2' data-tab="2">Lunch</a>
				</li>
				<li>
					<a href='#tab3' data-tab="3">Dinner</a>
				</li>				
			</ul>
			<div id='tab1'>
			 <p>
			  You want Snacks
			 </p>
			<div>
			<div id='tab2'>
			 <p>
			  You want Lunch
			 </p>
			<div>
			<div id='tab3'>
			 <p>
			  You want Dinner
			 </p>
			<div>
			
			<script>
			$('ul.tabs').each(function(){
			    // For each set of tabs, we want to keep track of
			    // which tab is active and it's associated content
			    var $active, $content, $links = $(this).find('a');

			    // If the location.hash matches one of the links, use that as the active tab.
			    // If no match is found, use the first link as the initial active tab.
			    $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
			    $active.addClass('active');

			    $content = $($active[0].hash);

			    // Hide the remaining content
			    $links.not($active).each(function () {
			      $(this.hash).hide();
			    });

			    // Bind the click event handler
			    $(this).on('click', 'a', function(e){
			      // Make the old tab inactive.
			      $active.removeClass('active');
			      $content.hide();

			      // Update the variables with the new link and content
			      $active = $(this);
			      $content = $(this.hash);

			      // Make the tab active.
			      $active.addClass('active');
			      $content.show();

			      // Prevent the anchor's default click action
			      e.preventDefault();
			    });
			</script>
			-->
		</div>
	</div>
     </div>
    </div>
  </div>
</div>

<!-- Help Modal -->
<div class="modal fade HelpModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" 
      aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><span style="font-style:bold">Can we help you?</span></h4>
     </div>
     
    <div class="modal-body">
<!--     <div class="container">-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<p class="text-danger" style="color:purple"><b>
				Hover mouse over the tab to know what it does.
				Drag and drop is to be used where required.<br><br>
				For any more information or suggestions please feel free to contact
				swapnali.shrikhande@gmail.com
				
				</b>
				<!-- Hover mouse over the tab to know what it does.
				<strong>Drag and drop is to be used where required</strong>.
				For any more information or suggestions please feel free to contact
				<em>swapnali.shrikhande@gmail.com</em>
				<small></small>-->
			</p>
		</div>
	</div>
    </div>
    </div>
  </div>
</div>

<!--  Custom Modal -->
<div class="modal fade CustomModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" 
      aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
     <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">
     <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Customize</h4>
     </div>
     
      <div class="modal-body">
<!--       <div class="container">-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-849092">
				<ul class="nav nav-tabs">
					<li>
						<a href="#panel-439891" data-toggle="tab">Tables</a>
						
					</li>
					<li class="active">
						<a href="#panel-170772" data-toggle="tab">Chairs</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-439891">
						<p>
						<img class="customDragImgTable" src="Images/circularTable.jpg" width="56" height="56"></img>
						<img class="customDragImgTable" src="Images/rectangularOval.jpg" width="56" height="56"></img>
						<img class="customDragImgTable" src="Images/squareTable.jpg" width="56" height="56"></img>
						</p>
					</div>
					<div class="tab-pane active" id="panel-170772">
						<p>
      					<img class="customDragImg" src="Images/Chairs/executiveChair.jpg" width="56" height="56"></img>
						<img class="customDragImg" src="Images/Chairs/greenOvalChair.jpg" width="56" height="56"></img>
						<img class="customDragImg" src="Images/Chairs/redBoxChair.jpg" width="56" height="56"></img>
						<img class="customDragImg" src="Images/Chairs/weddingChair.jpg" width="56" height="56"></img>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-94006">
				<ul class="nav nav-tabs">
					<li>
						<a href="#panel-675146" data-toggle="tab">Stages/Doors</a>
					</li>
					<li class="active">
						<a href="#panel-866384" data-toggle="tab">Shrubs/Light</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-675146">
						<p>
     						<img class="customDragImgStage" src="Images/Stages_Doors/bigLavishStage.jpg" width="56" height="56"></img>
     						<img class="customDragImgStage" src="Images/Stages_Doors/danceStage.jpg" width="56" height="56"></img>
     						<img class="customDragImg" src="Images/Stages_Doors/simpleDoor.jpg" width="56" height="56"></img>
     						<img class="customDragImg" src="Images/Stages_Doors/weddingDoor.jpg" width="56" height="56"></img>
						</p>
					</div>
					<div class="tab-pane active" id="panel-866384">
						<p>
							<img class="customDragImg" src="Images/Shrubs_Lights/angularShrub.jpg" width="60" height="60"></img>
							<img class="customDragImg" src="Images/Shrubs_Lights/roundShrub.jpg" width="60" height="60"></img>
							<img class="customDragImg" src="Images/Shrubs_Lights/tableShrub.jpg" width="60" height="60"></img>
							<img class="customDragImg" src="Images/Shrubs_Lights/hangingLight.jpg" width="60" height="60"></img>
							<img class="customDragImg" src="Images/Shrubs_Lights/decorativeLight.jpg" width="60" height="60"></img>
							<img class="customDragImg" src="Images/Shrubs_Lights/lightStand.jpg" width="60" height="60"></img>
						</p>
					</div>
				</div>
			</div>
	</div>
</div>
      </div>
   </div>
  </div>
 </div>

<!-- Modal1 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="groupName">&times;</span><span class="sr-only">Close</span></button>
        <h4 data-key="groupNameTarget" id="groupNameTitle" class="modal-title" contenteditable="true">Group Name</h4>
      </div>	
    
      <form role="form" style="margin:5%;" method="GET" action="temp.jsp">
		  <div class="form-group">
		    <label for="exampleInputEmail1">Host</label>
		    <input data-key="hostName" class="form-control" id="hostName" placeholder="Host Name" style="width:200px">
		  </div>
		  <div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Edit Introduction</h3>
    </div>  
</div>
		  <div class="form-group">
		  
		    <label for="exampleInputPassword1">Guest</label>
		    <input class="form-control" id="guestName"
		          placeholder="Guest Name" style="width:200px">
		          <input type="checkbox" id="isVIP" name="VIPs" value="VIP"/><label>VIP</label>
		    <img class="update-button" src="Lib/bootstrap/img/tickV.png" style="width:20px; height:20px; margin-left:180px"
		         title="Add Guest">
		    <script>
             $(document).ready(function(){
	        	
	        	$(".update-button").click(seatingApp.addGuest);
	        	
	        });
             var seatingApp = {};
             seatingApp.addGuest = function(event,guestName){	
     			
            	    guestName = guestName || $("#guestName").val();
            	 
     	        	var guestElement = $('<p class="list-group-item-text draggable-guest"></p>');
     	        	
     	        	var theVIPs=document.getElementById("isVIP");
     	        	if(theVIPs.checked) {
     	        	var VIPguest=guestName.concat(" - VIP");     	        	
     	        	guestElement.text(VIPguest);
     	        	}
     	        	
     	        	else { 
     	        		guestElement.text(guestName);
     	        	}
     	        	
     	        	$(guestElement).insertBefore(".guest-list .last");
     	        	var zoom = 100;
     	        	$(guestElement).draggable({
     	                helper: 'clone', 
     	                revert: 'invalid',
   //  	                appendTo: 'body',
     	                scroll: true
     	             });
     	        	    	        	
             };    	
             
             $('.dragImage,.draggable-guest,.CustomModal img,.customDragImg,.customDragImgTable,.customDragImgStage').draggable({
                 helper: 'clone'  , 
                 revert: 'invalid',
 //                appendTo: 'body',
                 scroll: true
             });
		    </script>
		    
           <img src="Lib/bootstrap/img/cancel.png" style="width:24px; height:24px"
		         title="Clear" onclick="clearText();">
		         <script>
		          function clearText(){
		        	 document.getElementById("guestName").value="";
		        	 document.getElementById("hostName").value="";
		        	 isVIP.checked=false;
		         }
		         </script>
		  </div>

		  <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary save-button">Save changes</button>
	        <script>
	        
	        $(document).ready(function(){
	        	
	        	$(".save-button").click(seatingApp.addToHostList)
	        					 .click(seatingApp.addGroupName);
	        	
	        	$('.panzoom').droppable({
	                //tolerance: 'fit',
	                drop : function(event,ui){
	                	
	                	try{
			                        //calculate positions
	                        var dropTop =   $(".panzoom").offset().top;
	                        var dropLeft =  $(".panzoom").offset().left;
	                        //calculate absolute position
	                        var topNumber = ui.offset.top - dropTop;
	                        var leftNumber = ui.offset.left - dropLeft;
	                        
	                        var newDropped = ui.helper.clone();
	                        $(newDropped).css({ position:"absolute", top:topNumber+'px', left:leftNumber+'px'});
	                        
	                        if( $(newDropped).hasClass("addedToCanvas") ){
	                        	return true;	
	                        }
	                        
	                        $(newDropped).draggable({
			                                revert: 'invalid',
			                                stop: function(event,ui){
			                                    $(this).draggable('option','revert','invalid');
			                                },
			                                scroll: true
			                            });
	                        
	                        
	                        $(newDropped).addClass("addedToCanvas");
	                        
	                        if($(newDropped).is("img.dragImage")){
	                        	
	                        	var h = parseInt( $(newDropped).attr("height"),10);
	                        	var w = parseInt( $(newDropped).attr("width"),10);
	                        	
	                        	$(newDropped).attr("height",h*6);
	                        	$(newDropped).attr("width" ,w*6);
	                        }
	                        
	                        if(($(newDropped).is("img.customDragImgTable")) || ($(newDropped).is("img.customDragImgStage"))) {
	                        	var h = parseInt( $(newDropped).attr("height"),10);
	                        	var w = parseInt( $(newDropped).attr("width"),10);
	                        	$(newDropped).attr("height",h*2);
	                        	$(newDropped).attr("width" ,w*2);
	                        }
	                        		
	                        $(".panzoom").append(newDropped);
	                        
	                    }
	                    catch(exceptionObj){
	                        console.log(exceptionObj);
	                    }
	                	
	                }
	                
	            });
	        	
	        	/*
	        	$( ".panzoom" ).on( "drop", function (event, ui) {
                    
	        		
	        		var target = $(".panzoom");
                    
                    //if(ui && ui.draggable){
                    	$(ui.draggable).appendTo(target);
                    //}
                    
                });*/
	        });
	        
	        seatingApp.addToHostList = function(event){
	        	var hostName=$("#hostName").val();
	        	var hostElement = $('<p data-key="hostName" class="list-group-item-text"></p>');	        	
	        	hostElement.text(hostName);
	        	
	        	$(hostElement).insertBefore(".host-list .last");
	        	return false;
	        };
	        
	        seatingApp.addGroupName = function(event) {
	        	var groupName = $('#groupNameTitle').text();
	        	$("#groupNameTarget").text(groupName);
	        	return false;
	        };
	        </script>
	        <script type="text/javascript">

			    function PrintElem(elem)
			    {
			        Popup($(elem).html());
			    }
			
			    function Popup(data) 
			    {
			    	var mywindow = window.open('', 'Seating Arrangement Manager', 'height=400,width=600');
			        mywindow.document.write('<html><head><title style="font-size:30px">',$('#groupNameTitle').text(),'</title>');
			        mywindow.document.write('</head><body>');
			        mywindow.document.write('<div></div>');
			        mywindow.document.write('<br><br><p align="center">',"___________________________",'<br><br>',"Welcome all to the Event ~ ",'<br><span style="font-size:25px" align="center"><b>',$('#eventName').val(),'</b></span><br>',"___________________________",'</p>');
			        mywindow.document.write('<br><p align="center">',"On   ",'<br><span style="font-size:22px;"><b>',$('#eventDate').val(),'</b></span></p>');
			        mywindow.document.write('<p align="center"><span style="font-size:22px"><b>',$('#eventTime').val(),'</b></span></p>');
			        mywindow.document.write('<p align="center"><span style="font-size:22px">','- Venue Address - <br> <b>',$('#venue').val(),'</span></b></p>');
			        mywindow.document.write('<p align="center">','______________________________________','</p>');
			        mywindow.document.write('<p align="center"><span style="margin-left:300px">',data,'</span></p>');
			        mywindow.document.write('<p align="center">','______________________________________','</p>');
			        mywindow.document.write('<br><p align="center"><b>',"~ Host Name: ",$('#hostName').val(),"~",'</b></p>');
			        mywindow.document.write('<p align="right">','Software support:Seating Arrangement Manager','<br>',"swapnali.shrikhande@gmail.com",'</p>');
			        //mywindow.document.write('<br><p>',"Invitees",$('#guestList').val(),'</p>');
			        
			        /*$('#guestListGroup').each(function() {
			        	var classist=$(this).attr()
			        })*/
			        
			        mywindow.document.write('</body></html>');
                    			        
			        mywindow.print();
			        mywindow.close();
			
			        return true;
			    }
			
			</script>
      	  </div>  
	  </form>
  </div>
</div>


</body>
</html>