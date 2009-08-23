$(function() {
  $(".placeHolder").focus(placeHolder)
  $(".placeHolder").blur(placeHolder)
  $(".datepicker").datepicker({ dayNamesMin: ['Se', 'Te', 'Qu', 'Qu', 'Se', 'Sá', 'Do'], monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'] });
})

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