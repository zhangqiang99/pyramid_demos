<!DOCTYPE>
<html>
<head>
  <title>The Pyramid Web Framework</title>
  <script src="../static/jquery.js"></script>

<script type="text/javascript" src="/static/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
tinyMCE.init({
    mode : "textareas",
    theme : "advanced",
    theme_advanced_buttons1 : "bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright, justifyfull,bullist,numlist,undo,redo,link,unlink",
    theme_advanced_buttons2 : "",
    theme_advanced_buttons3 : "",
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left",
    theme_advanced_statusbar_location : "bottom",
    plugins : 'inlinepopups',
    
});
</script>

<style>
div[mce_name="o:title"] {
  background-image:url(/images/title_tag.png);
  background-repeat:no-repeat;
  background-position:2px 5px;
}
</style>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script>
$(document).ready(function(){

        $(".post-input").submit(function(){
            var postcontent = $(".post-form").val();

            if (postcontent == ""){
                return false;
            }

            $(".post-form").attr("disabled", "disabled");
	    
            $.ajax({
                url: '/ajax2',
                type: 'POST',
                data: 'post-form='+postcontent,
                dataType: 'text',
		success: function(data, textStatus, jqXHR)
    		{
		
    	      	 },
                
            });
	    cache: false
	    $.getJSON('/ajax3.json', function(data) {
            			       var target = $('#result1 ul');
            			       target.empty();
            			       $.each(data, function (key, val) {
                		       		       alert(val)
            					       });
 			});
	    
        });
    });
</script>
<script>
 $(function() {

    function get_comments () {
        $( "#ajax-comment" ).toggle( "fast", function() {
	       $("#ajax-comment").load("/form1");	       		   
 	     });
    }

    $('#comment').click(function () {
        get_comments();
	return false;
    });
   

    
});
</script>
<script>
$(function() {

    function get_updates () {
        $.getJSON('/updates.json', function(data) {
            var target = $('#result ul');
            target.empty();
            $.each(data, function (key, val) {
                target.append('<li>Update #' + val + '</li>');
            });
        });
    }

    $('#sidebar').click(function () {
        get_updates();
	return false;
    });
   

    
});

</script>


</head>
<body>
<form class="post-input" action="" method="post" accept-charset="utf-8">
                <textarea class="post-form" name="post-form" rows="1" cols="10" onFocus="this.value='';return false;"></textarea>
                <p><input class="post-submit" type="submit" name = "post.submitted" value="Post"></p>
            </form>

<p>
<a id="sidebar" href="#">Click here</a>
<a id="comment" href="#">Click comment</a>
<div id="ajax-comment">
</div>

<div id="result">
<ul></ul>
</div>
<div id="result1">
<ul></ul>
</div>
</p>
</body>
</html>
