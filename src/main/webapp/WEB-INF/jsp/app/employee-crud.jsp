<%--
	- A template page for your reference
	-
	- @author - Your name here
--%>
<%@ page contentType="text/html;utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="tides" uri="http://www.ideyatech.com/tides"%>

<app:header pageTitle="label.employee" active="employee"/>

<div id="employee-body" class="container">

<div id="search-body">

	<div id="search-panel" class="span3">

		<div id="search-panel-inner" data-spy="affix" data-offset-top="60">
			<div class="navbar">
				<div class="navbar-inner">
					<span class="brand"><i class="icon-search"></i><spring:message code="label.search" /></span>
					<a class="show-search-form btn collapsed pull-right hidden-desktop hidden-tablet" data-toggle="collapse" data-target=".search-form">
						<i class="icon-chevron-up"></i>
						<i class="icon-chevron-down"></i>
					</a>
				</div>
			</div>
			<div class="search-form collapse">
				<form:form modelAttribute="searchCommand" id="employee-search" >
					<!-- Define search fields here -->
					<tides:input label="label.employee.firstName" path="firstName"/>
					<tides:input label="label.employee.lastName" path="lastName"/>
					<hr/>
					<input type="submit" class="btn btn-info btn-block" data-submit="search" value="<spring:message code="label.search"/>">
					<button type="button" class="btn btn-link btn-block" data-submit="clear"><spring:message code="label.clear" /></button>
				</form:form>
			</div>
		</div>
	</div>
	
	<div id="results-panel" class="span9">
		
		<div id="message-panel" class="row-fluid">
			<button id="employee-add" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.add" />
			</button>
			<div class="status" data-display-pagelinks="false" data-display-summary="true" data-summary-message='
				<spring:message code="message.displaying-x-of-y" arguments="${symbol_pound}start,${symbol_pound}end,${symbol_pound}total,records"/>
			'>
				<tides:status results="${results}" />
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div class="table-wrapper-2 overflow-hidden">
			<div class="table-wrapper">
				<table id="employee-results" class="footable table-bordered table-striped table-hover table-condensed" data-page="${results.currPage}" >
					<thead>
						<tr class="table-header">
							<!-- Define headers here -->
							<th><spring:message code="label.employee.email" /> </th>
							<th><spring:message code="label.employee.firstName" /> </th>
							<th><spring:message code="label.employee.lastName" /> </th>
							<th data-field-name="ot3-controls"></th>
						</tr>
					</thead>
					<tbody>
						<script type="text/template" class="template">
	                		<tr id="employee-row-{{id}}" data-id="{{id}}">
								<!-- Define template here -->
								<td>
									{{email}}
								</td>
								<td>
									{{firstName}}
								</td>
								<td>
									{{lastName}}
								</td>
								<td>
									<i class='icon-pencil edit-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
									<i class='icon-trash remove-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
									<i class='icon-wrench' data-id='{{id}}' data-title="<spring:message code="label.employee.manageSkill" />"></i>
									<i class='icon-time' data-id='{{id}}' data-title="<spring:message code="label.employee.manageDailyTimeRecord" />"></i>
								</td>
							</tr>
						</script>
						<c:forEach items="${results.results}" var="record" varStatus="status">
							<tr data-id="${record.id}">
								<!-- Define table body here -->
								<td>
									<c:out value="${record.email}"/>
								</td>
								<td>
									<c:out value="${record.firstName}"/>
								</td>
								<td>
									<c:out value="${record.lastName}"/>
								</td>
								<td>
									<i class='icon-pencil edit-action' data-id='${record.id}' data-title="<spring:message code="label.edit" />"></i>
									<i class='icon-trash remove-action' data-id='${record.id}' data-title="<spring:message code="label.delete" />"></i>
									<i class='icon-wrench' data-id='${record.id}' data-title="<spring:message code="label.employee.manageSkill" />"></i>
									<i class='icon-time' data-id='${record.id}' data-title="<spring:message code="label.employee.manageDailyTimeRecord" />"></i>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>

		<div class="paging clearfix">
			<tides:paging results="${results}"/>
		</div>
	</div>
	
</div>

<div id="form-body" class="modal fade hide">

	<div id="form-panel" >
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="${add}"><spring:message code="label.employee.add" /></h4>
			<h4 class="${update}"><spring:message code="label.employee.update" /></h4>
		</div>

		<form:form modelAttribute="formCommand" id="employee-form">
			<div class="modal-body">
				<div class="message-container"></div>
				<!-- Define form fields here -->
				<tides:input label="label.employee.firstName" path="firstName" required="true"/>
				<tides:input label="label.employee.middleName" path="middleName"/>
				<tides:input label="label.employee.lastName" path="lastName" required="true"/>
				<tides:input label="label.employee.email" path="email" required="true"/>
				<tides:date_picker label="label.employee.birthdate" path="birthDate"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal"><spring:message code="label.close" /></button>
				<input type="submit" class="btn btn-info  ${add}" data-form-display="add" data-submit="save-and-new" value="<spring:message code="label.save-and-new" />" />
				<input type="submit" class="btn btn-success" data-submit="save" value="<spring:message code="label.save" />" />
				<input type="hidden" name="id" />
			</div>
		</form:form>
	</div>
	
</div>

<div class="adjust-photo-modal modal hide fade" data-width="760" tabindex="-1"></div>
<div class="upload-photo-modal modal hide fade" data-width="760" tabindex="-2"></div>

</div>

<div id="skills-body" class="modal fade hide">
	<div id="form-panel" >
		<div class="modal-header">
			<button id="add-skill" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.addSkill" />
			</button> 
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
			<div class="skills-container">
			</div>
		</div>
	</div>
</div>

<div id="dtr-body" class="modal fade hide">
	<div id="form-panel" >
		<div class="modal-header">
			<button id="add-dtr" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.addDTR" />
			</button>
			<select id="timesheet" name="timesheet">
			</select>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
			<div class="dtr-container">
			</div>
		</div>
	</div>
</div>

<script type="text/template" id="skills-template">
	<form class="row-fluid skill-row" data-id={{id}}>
			<input type="hidden" readonly="readonly" id="employee" value="{{id}}" name="employee" data-id={{id}} />
		<div class="span5">
			<input type="text" readonly="readonly" value="{{name}}" name="name" data-id={{id}} />
		</div>
		<div class="span5">
			<input type="text" readonly="readonly" value="{{rating}}" name="rating" data-id={{id}} />
		</div>
		<div class="span2">
			<i class='icon-save save-skill-action hide' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-save update-skill-action hide' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-pencil edit-skill-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-trash remove-skill-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
		</div>
		
	</form>
</script>

<script type="text/template" id="dtr-template">
	<form class="row-fluid dtr-row" data-id={{id}}>
		<input type="hidden" readonly="readonly" value="{{id}}" name="timesheet" data-id={{id}} />
		<div class="span5">
			<input type="datetime-local" readonly="readonly" value="{{timeInWithTime}}" name="timeIn" data-id={{id}} />
		</div>
		<div class="span5">
			<input type="datetime-local" readonly="readonly" value="{{timeOutWithTime}}" name="timeOut" data-id={{id}} />
		</div>
		<div class="span2">
			<i class='icon-save save-dtr-action hide' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-pencil edit-dtr-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-trash remove-dtr-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
		</div>
	</form>
</script>

<script type="text/template" id="timesheet-template">
	<option value="{{id}}">{{cutoff}}</option>
</script>

<tides:footer>
	<script type="text/javascript">
		var loadDTR = function(){
			$('#dtr-body .dtr-container').empty();
			var id = $('#timesheet').val();
			$.getJSON(
				'dailytimerecord/findByEmployeeId/' + id, // url
				null, // data
				function(DTRs) { // callback
					var template = opentides3.template($('#dtr-template').html());
					$.each(DTRs, function(i, DTR) {
						var DTRRow = template(DTR);
						$('#dtr-body .dtr-container').append(DTRRow);
					})
				}
			);
		};
	
		$(document).ready(function() {
			
			$("#employee-body").RESTful();
			
			$('.footable').footable();
			
			$('body').tooltip({selector: '.edit-action, .remove-action'});
			
			$('.icon-wrench').click(function() {
				$('#skills-body .skills-container').empty();//empty div before displaying results
				var id = $(this).data('id');
				$('#skills-body').modal('show');
				$('#skills-body').data('employee', id);
				$.getJSON(
					'skill/findByEmployeeId/' + id, // url
					null, // data
					function(skills) { // callback
						var template = opentides3.template($('#skills-template').html());
						$.each(skills, function(i, skill) {
							var skillRow = template(skill);
							$('#skills-body .skills-container').append(skillRow);
						})
					}
				);
			});
			
			$('.icon-time').click(function() {
				$('#dtr-body #timesheet,.dtr-container').empty();//empty div before displaying results
				var id = $(this).data('id');
				$('#dtr-body').modal('show');
				$('#dtr-body').data('employee', id);
				$.getJSON(
					'timesheet/findByEmployeeId/' + id, // url
					null, // data
					function(timesheets) { // callback
						var template = opentides3.template($('#timesheet-template').html());
						$.each(timesheets, function(i, timesheet) {
							var cutOff = template(timesheet);
							$('#dtr-body #timesheet').append(cutOff);
						});
						loadDTR();
					}
				);
			});
			
			$('#timesheet').change(function() {
				loadDTR();
			});
			
			$('#add-dtr').click(function() {
				var dtr = {
						id :$('#timesheet').val(),
						timeOutWithTime : "",
						timeInWithTime : ""
					};
				var newDTRRow = opentides3.template($('#dtr-template').html(), dtr);
				var newRow = $('#dtr-body .dtr-container').append(newDTRRow);
				newRow = newRow.find('.dtr-row').last();
				newRow.find('input').prop('readonly', false);
				newRow.find('.save-dtr-action').removeClass('hide');
				newRow.find('.edit-action').addClass('hide');
				newRow.find('.remove-action').addClass('hide');
			});
			
			$('#add-skill').click(function() {
				
				var skill = {
						id : $('#skills-body').data('employee'),
						rating : "",
						name : ""
					};
				
				var newSkillRow = opentides3.template($('#skills-template').html(), skill);
				//$(newSkillRow).find('input').prop('readonly', false);
				var newRow = $('#skills-body .skills-container').append(newSkillRow);
				newRow = newRow.find('.skill-row').last();
				newRow.find('input').prop('readonly', false);
				newRow.find('.save-skill-action').removeClass('hide');
				newRow.find('.edit-skill-action').addClass('hide');
				newRow.find('.remove-skill-action').addClass('hide');
			});
			
		}).on('click', '.save-skill-action', function() {
			var skillRow = $(this).closest('.skill-row');
			$.ajax({type : 'POST', // method
				url : 'skill', // url
				data : skillRow.serialize(), // data
				success : function(json) { // callback
					if (typeof (json.command) === 'object'
						&& json.command.id > 0) {
						skillRow.find('input').prop('readonly', true);
						skillRow.find('.save-skill-action').addClass('hide');
						skillRow.find('.edit-skill-action').removeClass('hide');
						skillRow.find('.remove-skill-action').removeClass('hide');
					}
				},
					dataType : 'json'
			});

		}).on('click', '.edit-skill-action', function() {
			var skillRow = $(this).closest('.skill-row');
			
			skillRow.find('input').prop('readonly', false);
			skillRow.find('.update-skill-action').removeClass('hide');
			skillRow.find('.edit-skill-action').addClass('hide');
			skillRow.find('.remove-skill-action').addClass('hide');
			
			$("input#employee").attr('name', 'id');
			console.log(skillRow.serialize());
			
		}).on('click', '.update-skill-action', function() {
			var skillRow = $(this).closest('.skill-row');
			
			var id = $(this).data('id');
			
			console.log(id);
			console.log(skillRow.serialize());
			
			$.ajax({type : 'POST', // method
				url : 'skill/' + id, // url
				data : skillRow.serialize(), // data
				success : function(json) { // callback
					if (typeof (json.command) === 'object'
						&& json.command.id > 0) {
						skillRow.find('input').prop('readonly', true);
						skillRow.find('.update-skill-action').addClass('hide');
						skillRow.find('.edit-skill-action').removeClass('hide');
						skillRow.find('.remove-skill-action').removeClass('hide');
					}
				},
					dataType : 'json'
			});
			
		}).on('click', '.save-dtr-action', function() {
			var dtrRow = $(this).closest('.dtr-row');
			$.ajax({type : 'POST', // method
				url : '${home}/dailytimerecord', // url
				data : dtrRow.serialize(), // data
				success : function(json) { // callback
					if (typeof (json.command) === 'object'
						&& json.command.id > 0) {
						dtrRow.find('input').prop('readonly', true);
						skillRow.find('.save-dtr-action').addClass('hide');
						skillRow.find('.edit-dtr-action').removeClass('hide');
						skillRow.find('.remove-dtr-action').removeClass('hide');
					}
					console.log(json);
				},
					dataType : 'json'
			});
		});
	</script>
</tides:footer>