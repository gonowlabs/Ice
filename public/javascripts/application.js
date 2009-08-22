$(function() {
  $(".placeHolder").focus(placeHolder)
  $(".placeHolder").blur(placeHolder)
  $(".datepicker").datepicker({showOn: 'button', buttonImage: '../images/calendar.gif', buttonImageOnly: true, dateFormat: 'dd/mm/yy', dayNamesMin: ['Se', 'Te', 'Qu', 'Qu', 'Se', 'Sá', 'Do'], monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'] });
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
