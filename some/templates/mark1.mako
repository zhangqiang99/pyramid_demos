<!DOCTYPE>
<html>
<head>
  <title>The Pyramid Web Framework</title>
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script>
       tinyMCE.init({
           mode : "exact",
           elements : "txtTextArea1,txtTextArea2",
       });
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script src="/static/typeahead.js/typeahead.js"></script>
  <script type="text/javascript">
    function handleClick(e){
       var x = prompt('clicked');
       $('#tests').html(x);
       var timeStr = $.ajax({url: "/servertime", async: false}).responseText;
       $('#time').html(timeStr)
       var ajaxtest1 = $.ajax({url: "/ajaxtest/"+ encodeURIComponent(x), async: false}).responseText;
       $('#ajaxtest1').html(ajaxtest1)
   }
   function handleClick1(e){
       var y = $('#title').val()
       var ajax1 = $.ajax({url: "/ajaxtest/"+ encodeURIComponent(y), async: false}).responseText;
       $('#ajax1').html(ajax1)
       $('#mark1-form').hide()
   }

   function handleClick2(e){
       $('#mark1-form').show()
       var x1 = $('#ajax1').html()
       $('#title').val(x1)
       
   }
   function handleClick3(e){
   	    var x = $('#follow').html()
	    $('#follow').html("...")
	    setTimeout(function () {
	    		if (x =="Follow")
	    		{
				$('#follow').html("Following");
	    		}
	    		else 
	    		{
				$('#follow').html("Follow");
	    		}
	    }, 3000);
	    
   	    
   }
   function handleClick4(e){
   	    var z = $('#upvote').html();
	    if (z == "Upvote")
	    {  
	       $('#upvote').html("Upvoted");
	    }
	    else
	    {
		$('#upvote').html("Upvote");
	    }
	    return false;
   }
   function handleClick5(e){
   	    $( "#ajax-comment" ).toggle( "fast", function() {
	       $("#ajax-comment").load("/form1");	       		   
 	     });
	    return false;
   }
   
    $(document).ready(function(){
        $('#button').click(handleClick);
	$('#button1').click(handleClick1);
	$('#button2').click(handleClick2);
	$('#follow').click(handleClick3);
	$('#upvote').click(handleClick4);
	$('#comment').click(handleClick5);
	
    })
    $('input.counties').typeahead({
      name: 'countries',
      local: ["Unites States", "Mexico", "Canada", "Cuba", "Guatemala"]
      });
    
  </script>

</head>
<body>
<div id="tests">
</div>
<div id="time">
</div>
<div id="ajaxtest1">
</div>
<div id="ajax1">
     
</div>
<input class="typeahead"></input>
<div class="search-test"></div>

<button type="submit" id="button2">Edit</button>
<button type="submit" id="follow">Follow</button>

<a  href="#" id="upvote"><span >Upvote</span></a>
<a  href="#" id="comment"><span >Comment</span></a>
<div id="ajax-comment">
</div>
<input class="countries" type="text" placeholder="Countries">
<div id="mark1-form">
  <form method="POST">
    <form role="title">
      <input type="text" name="title" id="title" value="${title}"/>
    </form>
    <div id="predict" name="predict"></div>
    <button value="submit" id="button">Click</button>
    <button type="submit" id="button1">Submit</button>
  </form>
   <textarea id="textarea1" class="mceEditor">Your content here.</textarea>
   <textarea id="textarea1" class="mceEditor1">Your content here.</textarea>
   <textarea id="txtTextArea1" name="txtTextArea1"></textarea>
<textarea id="txtTextArea2" name="txtTextArea2"></textarea>
<input 
</div>
<br>
<p>
When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$
</p>
 </body>
</html>
