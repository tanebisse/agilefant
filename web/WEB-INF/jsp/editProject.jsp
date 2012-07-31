<%@ include file="./inc/_taglibs.jsp"%>

<struct:htmlWrapper navi="backlog">
<jsp:body>

<aef:backlogBreadCrumb backlog="${project}" />

<div class="structure-main-block project-color-header" id="backlogInfo">

	<ul class="backlogTabs">
	  <li class="">
	  	<a href="#backlogDetails"><span><img alt="Edit" src="static/img/info.png" /> Info</span></a>
	  </li>
	  <!-- <li class=""><a href="#backlogAssignees"><span><img alt="Edit" src="static/img/team.png" /> Assignees</span></a></li>-->
	  <li id="projectActions" class="ui-state-disabled dynamictable-captionaction ui-corner-all" style="float: right; opacity: 1 !important; filter: alpha(opacity = 100) !important; border-width: 1px !important;">
	    Actions
	  </li>
	</ul>

	<div class="details" id="backlogDetails" style="overflow: auto;"></div>
	<!-- <div class="details" id="backlogAssignees"></div> -->

</div>

<div class="structure-main-block project-color-header ui-tabs ui-widget ui-widget-content ui-corner-all" id="storyPointInfo" style="margin-top: 3em;">
	<ul class="backlogTabs ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
	  <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
	  	<a href="#storyPointDetails"><span><img src="static/img/info.png" /> StoryPoint Info</span></a>
	  </li>
	</ul>
	<div class="details ui-tabs-panel ui-widget-content ui-corner-bottom" id="storyPointDetails" style="overflow: auto;min-height: 100px;">
		<table  rules="all">
			<thead>
				<tr>
					<th>TOTAL NOT DEFERRED</th>
					<th>NOT STARTED</th>
					<th>STARTED</th>
					<th>PENDING</th>
					<th>BLOCKED</th>
					<th>IMPLEMENTED</th>
					<th>DONE</th>
					<th>DEFERRED</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><ww:property value="projectMetrics.storyPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.notStartedStoryPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.startedStoryPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.pendingStoryPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.blockedStoryPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.implmentedStoryPoints" /></td>
					<td align="center"><ww:property value="projectMetrics.numberOfDoneStories" /></td>
					<td align="center"><ww:property value="projectMetrics.deferredStoryPoint" /></td>
				</tr>
			</tbody>		
		</table>
	</div>
</div>


<script type="text/javascript">
var agilefantTimesheetsEnabled = ${settings.hourReportingEnabled};

$(document).ready(function() {
  $("#backlogInfo").tabs();
  
  $("#releaseContents").tabs({
    cookie: { name: 'agilefant-project-tabs' }
  });
  
  var controller = new ProjectController({
    id: ${project.id},
    tabs: $("#releaseContents"),
    projectDetailsElement: $("#backlogDetails"),
    textFilterElement: $('#searchByText')
  });

  var actionMenu = $('<ul class="actionCell backlogActions"/>').appendTo(document.body).hide();
  
  $('<li/>').text('Spent effort').click(function() {
    closeMenu();
    controller.openLogEffort();
  }).appendTo(actionMenu);

  $('<li/>').text('Delete').click(function() {
    closeMenu();
    controller.removeProject();
  }).appendTo(actionMenu);

  
  var closeMenu = function() {
    actionMenu.fadeOut('fast');
    actionMenu.menuTimer('destroy');
  };
  
  var openMenu = function(element) {
    var pos = $("#projectActions").offset();
    actionMenu.css({
      position: 'absolute',
      top: pos.top + 20,
      left: pos.left
    });

    actionMenu.show();
    actionMenu.menuTimer({
      closeCallback: function() {
        closeMenu();
      }
    });
  };

 $('#projectActions').click(function() { openMenu(); });

  
});
</script>

<div style="margin-top: 3em;" class="structure-main-block project-color-header" id="releaseContents">
<ul class="backlogTabs">
  <li class=""><a href="#storyTreeContainer"><span><img
        alt="Edit" src="static/img/story_tree.png" /> Story tree</span></a></li>
  <li class=""><a href="#stories"><span><img
				alt="Edit" src="static/img/leaf_stories.png" /> Leaf stories</span></a></li>
  <li class=""><a href="#iterations"><span><img
				alt="Edit" src="static/img/backlog.png" /> Iterations</span></a></li>
  <li id="searchByText" style="float: right;"> </li>
</ul>

<form onsubmit="return false;">
  <div class="details projectStoryTreeContainer" id="storyTreeContainer" style="position: relative;"></div>
  <div class="details" id="stories"></div>
  <div class="details" id="iterations">
  		<div id="iterations">&nbsp;</div>
  </div>
</form>

</div>



<p style="text-align: center;">
	<img src="drawProjectBurnup.action?backlogId=${project.id}" id="bigChart" width="780" height="600" />
</p>

</jsp:body>
</struct:htmlWrapper>
