<!DOCTYPE>
<html>
<head>
  <title>The Pyramid Web Framework</title>
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script>
       tinyMCE.init({
           mode : "exact",
           elements : "txtTextArea1,txtTextArea2,post-form",
       });
</script>
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
                
            });
	    cache: false
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
<div id="result"></div>
</p>
</body>
</html>