<!DOCTYPE html>
	<html>	
    <head>
    <link href="autocomplete/autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="autocomplete/jquery.autocomplete.js"></script>
    
    
	  <script src="arcticmodal/jquery.min.js"></script>
      <script src="arcticmodal/jquery.arcticmodal-0.3.min.js"></script>
<link rel="stylesheet" href="arcticmodal/jquery.arcticmodal-0.3.css">
<link rel="stylesheet" href="arcticmodal/themes/simple.css">	
	</head>
	<body>
	 
	<div id="log">
	  <h3>Before $.noConflict(true)</h3>
	</div>
	<!--<script src="http://code.jquery.com/jquery-1.6.2.js"></script>-->
    
	 
	<script>
	var $log = $( "#log" );
	 
	$log.append( "2nd loaded jQuery version ($): " + $.fn.jquery + "<br>" );
	 
	/*
	(подгружаем новую версию)
	*/
	jq191 = jQuery.noConflict(true);
	 
	$log.append( "<h3>After $.noConflict(true)</h3>" );
	$log.append( "1st loaded jQuery version ($): " + $.fn.jquery + "<br>" );
	$log.append( "2nd loaded jQuery version (jq191): " + jq191.fn.jquery + "<br>" );
	
/*	jq = jQuery.noConflict(true);
	
	$log.append( "<h3>After $.noConflict(true)</h3>" );
	$log.append( "1st loaded jQuery version ($): " + $.fn.jquery + "<br>" );
	$log.append( "2nd loaded jQuery version (jq191): " + jq191.fn.jquery + "<br>" );
	$log.append( "3nd loaded jQuery version (jq162): " + jq162.fn.jquery + "<br>" );*/
	
	<!--jq132 = jQuery.noConflict(true);-->
	
	</script>
<script type="text/javascript">
jq = jQuery.noConflict(true);
/*   function showmod(){
   jq('#exampleModal').arcticmodal();
  }*/
  
function test() {
	var data11 = 'test';
	alert(data11+' '+jq.fn.jquery);
	jq("#procent_stavka").load("PAYment/get_procent.php", { procent_array : data11 });
	}  
</script>

<!--<input onClick="showmod();" value="Test" type="button">
<div style="display: none;">
    <div class="box-modal" id="exampleModal">
        <div class="box-modal_close arcticmodal-close">Закрыть[Х]</div>
        <br>-->
        <!--<div align="center"><iframe src="/dumper/" width="586" height="462" frameborder="0" style="margin:0;"></iframe></div><br>-->
        
<!--       <div align="center"><iframe src="phpinfo.php" width="586" height="200" align="left" frameborder="0">
    Ваш браузер не поддерживает плавающие фреймы!
 </iframe></div>
        
    </div>
</div>-->

<input style="width:50px;" type="text" onClick="test()" value="">
<div id="procent_stavka"></div>
	</body>
	</html>