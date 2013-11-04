// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function clickFileButton() {

	document.getElementById("fileButton").click();

}

function getFilePath() {
	document.getElementById("filePath").innerHTML = document.getElementById("fileButton").files.item(0).name;
}

function clickSubmitButton() {
    $('#submitButtonPanel').fadeOut("slow",function(){
        $('#loadingPanel').fadeIn("slow").delay(2000,function(){

            $("#submissionForm").submit();


        });
    });

}
function enableProxySubmission() {
 $('#enableProxySubmission').fadeOut("slow",function(){
        $('.proxySubmissionField').fadeIn("slow").delay(2000,function(){

		});
	});
}

function FlyIn(x,y){
//alert('#r' + x.toString() + '_' + y.toString());
document.getElementById("r" + x + "_" + y).css.display="inline";


	
}

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");