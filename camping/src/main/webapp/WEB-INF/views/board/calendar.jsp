<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='/fullcalendar-6.0.1/dist/index.global.js'></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	 $(function () {
         var request = $.ajax({
             /* url: "/full-calendar/calendar-admin", */ // 변경하기
             data: {"camp_id":$("#camp_id").val()},
             method: "GET"
         });
         request.done(function (data) {
        	 console.log(data); // log 로 데이터 찍어주기.
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale : "ko",
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:data 
    });

    calendar.render();
 		 });
	 });        
});



</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  .add-button {
    top: 1px;
    right: 230px;
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}

</style>
</head>
<body>
<sec:authorize access="isAuthenticated">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
  <div id='calendar'>
  </div>
		<button class = "add-button" type = "button" 
        	onclick="click_add();">일정 추가</button>
</body>
<sec:authorize access="isAuthenticated()">
<script>
function click_add() {
	var url = "/full-calendar/schedulePopup/${principal.member.id}/${camp_id}";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 , top=50,location=no";
	window.open(url,name,option)
};
</script>
</sec:authorize>
</html>
