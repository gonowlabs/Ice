$(document).ready(function () {
  $(".project").click(checkContract);

});

function checkContract(){
  if( $(this).attr("checked") ){
    contract = $(this).attr("class").split(" ").pop();
    $("#filters_"+contract).attr("checked","checked");
  }
};
