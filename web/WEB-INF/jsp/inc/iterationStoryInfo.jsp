<%@ include file="./_taglibs.jsp"%>

<div class="structure-main-block project-color-header ui-tabs ui-widget ui-widget-content ui-corner-all" id="storyPointInfo" style="margin-top: 3em;">
	<ul class="backlogTabs ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
	  <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
	  	<a href="#"><span><img src="static/img/info.png" /> StoryPoint Info</span></a>
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
					<td align="center"><ww:property value="iterationMetrics.storyPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.notStartedStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.startedStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.pendingStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.blockedStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.implmentedStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.doneStoryPoints" /></td>
					<td align="center"><ww:property value="iterationMetrics.deferredStoryPoint" /></td>
				</tr>
			</tbody>		
		</table>
	</div>
</div>