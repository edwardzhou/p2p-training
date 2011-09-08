// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function hideBlock() {
    block = $(this).data("target");
    $("#" + block).hide("blind");
    if( $(this).data("clean-on-hide") ) {
        $("#"+block).empty();
    }
}

$(document).ready(function(){
    $('a[hide_block=true]').click(hideBlock)
});
