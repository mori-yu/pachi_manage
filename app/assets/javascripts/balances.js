$(document).on('turbolinks:load', function() {
  var select = function(start) {
    //console.log(start.format('YYYY-MM-DD'));
    //var select_day = start.format('YYYY-MM-DD').to_s;
    /*$.ajax({
      type: "POST",
      url: "/balances/event",
      dataType: 'json',
      data: {
        day: start.format('YYYY-MM-DD')
      }
    });*/
    //calendar.fullCalendar('unselect');
  };
  $('#calendar').fullCalendar({
    selectable: true,
    ignoreTimezone: false,
    select: select
  });
});

$(function(){
    //Default
    $('#datepicker-default .date').datepicker({
        format: "yyyy-mm-dd",
        language: 'ja'
    });

});

  //$('#calendar').fullCalendar {
    //lang: 'ja'
    //dayClick: function(date) {
      //day = moment( data ).format( 'YYYY/MM/DD' )
      //alert('Clicked on: ' + date.format());
    //}
  //}
