<!DOCTYPE>
<html>
<head>
  <title>The Pyramid Web Framework</title>
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script type="text/javascript">
  function handleClick5(e){
  	    $('#chk2').checked=!$('#chk1').checked;
   	    $( "#ajax-comment" ).show( "fast", function() {
	       $("#ajax-comment").load("/form1");	       		   
 	     });
   }
   function handleClick4(e){
   	    $('#chk1').checked=!$('#chk2').checked;
	    $( "#ajax-comment" ).hide( "fast", function() {
	       $("#ajax-comment").load("/form1");	       		   
 	     });
   }
    $(document).ready(function(){
	$('#chk2').click(handleClick5);
	$('#chk1').click(handleClick4);
	
    })
    </script>
</head>
<body>

  <form method="POST" accept-charset="utf-8"
      enctype="multipart/form-data" name="f1" id="f1">
  <input type='radio' name=chk1 id=chk1 onclick=javascript:document.f1.chk2.checked=!document.f1.chk1.checked;> Check 1<BR>
<input type='radio' name=chk2 id=chk2 onclick=javascript:document.f1.chk1.checked=!document.f1.chk2.checked;> Check 2<BR>
      <div id="ajax-comment">
      </div>
  <input type="submit" value="Submit">  
  </form>
    
 </body>
</html>
