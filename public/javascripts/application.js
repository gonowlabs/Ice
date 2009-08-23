$(function() {
  $(".placeHolder").focus(placeHolder)
  $(".placeHolder").blur(placeHolder)
  $(".datepicker").datepicker({showOn: 'button', buttonImage: '../images/calendar.gif', buttonImageOnly: true, dateFormat: 'dd/mm/yy', dayNamesMin: ['Se', 'Te', 'Qu', 'Qu', 'Se', 'Sá', 'Do'], monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'] });
  $("td").hover(showOptions,hideOptions)
})
function approved(id){
  $('#'+id).fadeOut('fast').addClass('approved').fadeIn('slow')
  $('#'+id).removeClass('rejected')
}
function rejected(id){
  $('#'+id).addClass('rejected').pulsate()
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
function calculateTotals(id){
	var campo = $("#" + id);
	updateTotal(campo, 'week');
	updateTotal(campo, 'project');
}

function updateTotal(field, attribute) {
	var soma = 0;
	var selector = "*[" + attribute + "='" + field.attr(attribute) + "']";
	$(selector).each(function() {
		var obj = $(this);
		if (obj.hasClass('total')) {
			obj.text(soma);
		} else {
			soma = soma + parseFloat(obj.val());
		}
	});
}
