<cfscript>
	cars=createObject("component","cars");
	variables.color = cars.getColor();
	variables.engine =cars.getEngine();
	variables.package = cars.getPackage(); 
</cfscript>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
    <title>Acme Cars</title>
    <meta name="description" content="Simple Car Cretion Form">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="cars.js"></script>  	
  	<title>
  		Acme Cars
  	</title>
  	<script type="application/javascript" >
  		//begin global variable
  		var global = {
  			"errors" : {
  				"errorCount" : 0,
  				"text"	: ""
  			},
  			data : {},
  			logging : []
  		};
  		//convert data calls from cfc to JS usable json
  		global.data.color = <cfoutput>#serializeJson(variables.color)#</cfoutput>;
  		global.data.engine = <cfoutput>#serializeJson(variables.engine)#</cfoutput>;
  		global.data.package = <cfoutput>#serializeJson(variables.package)#</cfoutput>;
  		
  		
  		//page defaults
  		 $( document ).ready(function() {
  			//Populate select Menus
  			$( "#color" ).html( createColorSelect() );
  			$( "#engine" ).html( createEngineSelect() );
  			//Populate checkboxes
  			$( "#package" ).html( createPackageCheckbox() );
  			//Event Listners
  			colorChange();
  			engineChange();
  			package1();
  			package2();
  			package3();
  			package4();
  			beforeSubmit();
 		});		
  	</script>
  </head>
  <body>
  	<h1 class="text-center">
  		Acme Cars
  	</h1>
  	<h2 class="text-center">
  		Base Price for Aspen GT car is $25600.00
  	</h2>	
  	<div class="container">
  		<form>
			<div class="row">
				<label for="color">Choose A Color: *</label>
	    		<select id="color" class="form-control">
      			</select>
	  		</div>
	  		<div class="row">
	  			<label for="engine">Choose An Engine: *</label>
	    		<select id="engine" class="form-control">
      			</select>
	  		</div>
	  		<div class="row" id="packages">
	  			<label for="checkbox">Choose Packages: &nbsp;&nbsp;</label>
	    		<span id="package">
	    			
	    		</span>
  			</div>
  			<div class="row">
	  			<div>Your Price for Aspen GT car is <strong>$</strong></div><strong> <div id="totalCost">25600</div></strong><strong><div>.00</div></strong>
  			</div>
	  		
	  		<div class="row">
	  			<button type="button" class="btn btn-primary" id="insert">Insert</button>
	  		</div>	
  		</form>
  		<div id="sql">
  			
  		</div>	
  			
  	</div>	
  </body>
</html>