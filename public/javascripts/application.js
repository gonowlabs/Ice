$(function() {
  $(".placeHolder").focus(placeHolder)
  $(".placeHolder").blur(placeHolder)
  $(".datepicker").datepicker({ dayNamesMin: ['Se', 'Te', 'Qu', 'Qu', 'Se', 'Sá', 'Do'], monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'] });
  $(".entry").blur(calcula_total_semana)
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

function calcula_total_semana(){
	var coluna = '.'+$(this).attr('class').split(' ').pop();
	var soma = 0;
	$(coluna).each(function(){
		if ($(this).hasClass('total_hour')) {
			$(this).text(soma);
		} else {
			soma = soma + parseFloat($(this).val());
		}
	});
	calcula_total_projeto($(this));
}

function calcula_total_projeto(campo){
	var linha = '.'+campo.attr('class').split(' ')[1];
	var soma = 0;
	$(linha).each(function(){
		if (campo.hasClass('total_project')) {
			campo.text(soma);
		} else {
			soma = soma + parseFloat(campo.val());
		}
	});	
}