$(document).ready(function(){
    window.print();
})
window.onafterprint = function() {
    history.go(-1);
};