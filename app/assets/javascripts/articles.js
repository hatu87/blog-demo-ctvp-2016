// function onMouseOver(row) {
//   row.className = 'hover-row';
// }
//
// function onMouseOut(row) {
//   row.className = "";
// }

$(document).ready(function () {
  $("table > tbody > tr").hover(function(){
    $(this).addClass('hover-row')
  }, function() {
    $(this).removeClass('hover-row')
  })
});
