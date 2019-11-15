/*   
Template Name: Color Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.4
Version: 1.7.0
Author: Sean Ngu
Website: http://www.seantheme.com/color-admin-v1.7/admin/
*/

var handleCalendarDemo = function () {
	"use strict";
	// var buttonSetting = {left: 'today prev,next ', center: 'title', right: 'month,agendaWeek,agendaDay'};
	var buttonSetting = {left:'prev',center:'title',right:'next'};

	var date = new Date();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	var calendar = $('#calendar').fullCalendar({
		header: buttonSetting,
		eventRender: function(event, element) {
			var id = event._id;
			if(id !=''){
				console.log(element.html());
				var title = element.find('.fc-event-inner').html();
				element.find('.fc-event-inner').html("<i class='fa fa-calendar'></i>"+title);

			}
		},
		events: [{"start":"2017-08-17","end":"2017-08-17","className":"bg-green"},{"start":"2017-08-17","end":"2017-08-17","className":"bg-green"},{"start":"2017-08-17","end":"2017-08-06","className":"bg-green"},{"start":"2017-08-17","end":"2017-08-31","className":"bg-green"},{"start":"2017-09-01","end":"2017-09-01","className":"bg-green"},{"start":"2017-09-09","end":"2017-09-09","className":"bg-green"},{"start":"2017-08-29","end":"2017-08-29","className":"bg-green"},{"start":"2017-09-15","end":"2017-09-21","className":"bg-green"}],
		eventLimit: true, // allow "more" link when too many events

	});
};


var Calendar = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleCalendarDemo();
        }
    };
}();