$(document).ready(function () {
  $(".placeHolder").focus(placeHolder);
  $(".placeHolder").blur(placeHolder);
  $(".datepicker").datepicker({showOn: 'button', buttonImage: '../images/calendar.gif', buttonImageOnly: true, dateFormat: 'dd/mm/yy', dayNamesMin: ['Se', 'Te', 'Qu', 'Qu', 'Se', 'Sá', 'Do'], monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'] });
  $("td").hover(showOptions,hideOptions);
  $(".contract").click(checkProjects);
});
function approved(id){
  $('#'+id).fadeOut('fast').addClass('approved').fadeIn('slow')
  $('#'+id).removeClass('rejected')
}
function rejected(id){
  $('#'+id).fadeOut('fast').addClass('rejected').fadeIn('slow')
  $('#'+id).removeClass('approved')
}
function placeHolder(){
  if($(this).val() == $(this).attr('title')){
    $(this).val('')
  }
  else{
    if($(this).val() == ''){
      $(this).val($(this).attr('title'))
    }
  }
}
function showOptions(){
  $(this).children('.options').show()
}
function hideOptions(){
  $(this).children('.options').fadeOut('fast')
}
function checkProjects(){
  thisId = $(this).attr("title")
  if( $(this).attr("checked") ){
    $(".contracts_" + thisId).attr("checked","checked")
  }
  else{
    $(".contracts_" + thisId).removeAttr("checked")
  }
}
function calculateTotals(id){
	var campo = $("#" + id);
	updateTotal(campo, 'week');
	updateTotal(campo, 'project');
	updateTotalGeneral();
}

function updateTotal(field, attribute) {
	var count = 0;
	var selector = "*[" + attribute + "='" + field.attr(attribute) + "']";
	$(selector).each(function() {
		var obj = $(this);
		if (obj.hasClass('total')) {
			obj.text(count);
		} else {
			valor = obj.val()
			count = count + parseFloat(valor);
		}
	});
}

function updateTotalGeneral(){
	var count = 0;
	$(".total.project").each(function(){
		valor = $(this).text();
		count = count + parseFloat(valor);
	});
	$("#total_general").text(count);
}
