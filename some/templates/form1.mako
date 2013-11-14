<!DOCTYPE>
<html>
<head>
  <title>The Pyramid Web Framework</title>
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script type="text/javascript">
   function handleClick1(e){
       var z = $('#ftitle').val();
       var y = $.parseHTML( z );
       var ajaxtest1 = $.ajax({
       	   	     url: "/form2",
		     type: 'POST',
		     data: 'post-sub='+z,
		     dataType: 'text',
		     
		   }).responseText;
       $('#some').html(ajaxtest1)
       $('#fmark1-form').hide()
       
   }
   
   function handleClick2(e){
       $('#fmark1-form').show()
       var x1 = $('#fajax1').html()
       $('#ftitle').val(x1)
       
   }   
    $(document).ready(function(){
	$('#fbutton1c').click(handleClick1);
	$('#fbutton2').click(handleClick2);
    })
   
  </script>

</head>
<body>
<div id="fajax1">
</div>
<button type="submit" id="fbutton2">Edit</button>

<div id="fmark1-form">
  <form method="POST">
    <form role="title">
      <textarea type="text" name="ftitle" id="ftitle" >${title}</textarea>
    </form>
    <div id="fpredict" name="predict"></div>
    <button type="submit" id="fbutton1">Submit</button>
    % for x in items:
      	 <button type="submit" id="fbutton1${x}">Submit${x}</button>
    % endfor
  </form>
   
</div>
<p id="some">${some}</p>
 </body>
</html>
