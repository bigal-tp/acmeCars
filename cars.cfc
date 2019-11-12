component displayname="cars.cfc" hint="This CFC is used for Acme Cars configuration" output="true"
{
	remote struct function getColor(
		
	)
	 displayName="getColor"
	 description="Get Exterior Colors"
	 hint=""
	 output="true"
	 returnFormat="JSON"
	{
		/********** BEGIN DEFAULT RETURN VALUE **********/
			local.returnValue = {
				"statusCode" : 1000,
				"requestID" : createUUID(),
				"permissions" : "V",
				"message" : "Success",
				"eventName" : "getColor",
				"totalRows" : 0,
				"results" : [],
				"arguments" : {
				}
			};
		/********** END DEFAULT RETURN VALUE **********/


		/********** BEGIN CHECK FOR MISSING ARGUMENTS **********/
			try {
				//This is where I would normally put statements to check to see ensure all required arguments were passed.  However this method has no arguments.
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) { local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message }; }
					if ( isDefined( "e.TagContext" ) ) { local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext; }
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END CHECK FOR MISSING ARGUMENTS **********/

		/********** BEGIN QUERY **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/********** BEGIN QUERY **********/
					local.thisQuery = queryNew("id,color,cost","Integer,Varchar,Integer", 
                [ 
                        {id=1,color="Blue",cost=0}, 
                        {id=2,color="Silver",cost=500}, 
                        {id=3,color="White",cost=0},
                        {id=4,color="Red",cost=750}, 
                        {id=5,color="Black",cost=0} 
                ]); 
					
					/********** END QUERY **********/
				}
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END QUERY **********/

		/********** BEGIN OUTPUT **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/***** BEGIN QUERY LOOP *****/
						local.thisCountA = 1;
						
						for ( local.A IN local.thisQuery ) {
							local.returnValue["results"][ local.thisCountA ] = {
									"id" : local.A[ "ID" ],
									"color" : local.A[ "COLOR" ],
									"cost" : local.A[ "COST" ]
									};
								local.thisCountA++;
							}
						}

						local.returnValue.totalRows = 5;
					/***** END QUERY LOOP *****/
				}
			
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					//writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** BEGIN OUTPUT **********/

			return local.returnValue;
		/********** END OUTPUT **********/	
	}
	remote struct function getEngine(
		
	)
	 displayName="getEngine"
	 description="Get Engine Choices"
	 hint=""
	 output="true"
	 returnFormat="JSON"
	{
		/********** BEGIN DEFAULT RETURN VALUE **********/
			local.returnValue = {
				"statusCode" : 1000,
				"requestID" : createUUID(),
				"permissions" : "V",
				"message" : "Success",
				"eventName" : "getEngine",
				"totalRows" : 0,
				"results" : [],
				"arguments" : {
				}
			};
		/********** END DEFAULT RETURN VALUE **********/


		/********** BEGIN CHECK FOR MISSING ARGUMENTS **********/
			try {
				//This is where I would normally put statements to check to see ensure all required arguments were passed.  However this method has no arguments.
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) { local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message }; }
					if ( isDefined( "e.TagContext" ) ) { local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext; }
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END CHECK FOR MISSING ARGUMENTS **********/

		/********** BEGIN QUERY **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/********** BEGIN QUERY **********/
					local.thisQuery = queryNew("id,engine,cost","Integer,Varchar,Integer", 
                [ 
                        {id=1,engine="2 Liter Turbo",cost=0}, 
                        {id=2,engine="3 Liter Inline Six",cost=2500}, 
                        {id=3,engine="4 Liter V8",cost=5000}
                        
                ]); 
					
					/********** END QUERY **********/
				}
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END QUERY **********/

		/********** BEGIN OUTPUT **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/***** BEGIN QUERY LOOP *****/
						local.thisCountA = 1;
						
						for ( local.A IN local.thisQuery ) {
							local.returnValue["results"][ local.thisCountA ] = {
									"id" : local.A[ "ID" ],
									"engine" : local.A[ "ENGINE" ],
									"cost" : local.A[ "COST" ]
									};
								local.thisCountA++;
							}
						}

						local.returnValue.totalRows = 3;
					/***** END QUERY LOOP *****/
				}
			
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					//writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** BEGIN OUTPUT **********/

			return local.returnValue;
		/********** END OUTPUT **********/	
	}
	remote struct function getPackage(
		
	)
     displayName="getPackage"
	 description="Get Package Choices"
	 hint=""
	 output="true"
	 returnFormat="JSON"
	{
		/********** BEGIN DEFAULT RETURN VALUE **********/
			local.returnValue = {
				"statusCode" : 1000,
				"requestID" : createUUID(),
				"permissions" : "V",
				"message" : "Success",
				"eventName" : "getPackage",
				"totalRows" : 0,
				"results" : [],
				"arguments" : {
				}
			};
		/********** END DEFAULT RETURN VALUE **********/


		/********** BEGIN CHECK FOR MISSING ARGUMENTS **********/
			try {
				//This is where I would normally put statements to check to see ensure all required arguments were passed.  However this method has no arguments.
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) { local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message }; }
					if ( isDefined( "e.TagContext" ) ) { local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext; }
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END CHECK FOR MISSING ARGUMENTS **********/

		/********** BEGIN QUERY **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/********** BEGIN QUERY **********/
					local.thisQuery = queryNew("id,package,cost","Integer,Varchar,Integer", 
                [ 
                        {id=1,package="Driving Assitance Package",cost=4000}, 
                        {id=2,package="Sport Chrono Package",cost=7000}, 
                        {id=3,package="Comfort Seating Package",cost=1500},
                        {id=4,package="Cooling Package",cost=750}
                        
                ]); 
					
					/********** END QUERY **********/
				}
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END QUERY **********/

		/********** BEGIN OUTPUT **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/***** BEGIN QUERY LOOP *****/
						local.thisCountA = 1;
						
						for ( local.A IN local.thisQuery ) {
							local.returnValue["results"][ local.thisCountA ] = {
									"id" : local.A[ "ID" ],
									"package" : local.A[ "PACKAGE" ],
									"cost" : local.A[ "COST" ]
									};
								local.thisCountA++;
							}
						}

						local.returnValue.totalRows = 4;
					/***** END QUERY LOOP *****/
				}
			
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					//writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** BEGIN OUTPUT **********/

			return local.returnValue;
		/********** END OUTPUT **********/	
	}
	remote struct function insertCar(
		any color="",
		any engine="",
		any package=""
	)
     displayName="insertCar"
	 description="inserts a new car to the database"
	 hint=""
	 output="true"
	 returnFormat="JSON"
	{
		/********** BEGIN DEFAULT RETURN VALUE **********/
			local.returnValue = {
				"statusCode" : 1000,
				"requestID" : createUUID(),
				"permissions" : "V",
				"message" : "Success",
				"eventName" : "insertCar",
				"totalRows" : 0,
				"results" : [],
				"arguments" : {
					"color" : {
						"value" : arguments.color,
						"type" : "numeric",
						"required" : true,
						"description" : "The ID of the color table",
						"validate" : [
							{ "statusCode" : 5211, "length" : 0, "errorMessage" : "The length of the argument ""color"" is less than 1 characters in length" },
							{ "statusCode" : 5251, "length" : 10, "errorMessage" : "The length of the argument ""color"" is longer than 10 characters" },
							{ "statusCode" : 5101, "errorMessage" : "The ""color"" is not a valid integer." }
						]
					},
					"engine" : {
						"value" : arguments.engine,
						"type" : "numeric",
						"required" : true,
						"description" : "The id of the engine table",
						"validate" : [
							{ "statusCode" : 5211, "length" : 1, "errorMessage" : "The length of the argument ""engine"" is less than 1 characters in length" },
							{ "statusCode" : 5251, "length" : 10, "errorMessage" : "The length of the argument ""engine"" is longer than 10 characters" },
							{ "statusCode" : 5101, "errorMessage" : "The ""engine"" is not a valid interger." }
						]
					},
					"package" : {
						"value" : arguments.package,
						"type" : "string",
						"required" : false,
						"description" : "The id of the package table.",
						"validate" : [
							{ "statusCode" : 5211, "length" : 1, "errorMessage" : "The length of the argument ""package"" is less than 1 characters in length" },
							{ "statusCode" : 5251, "length" : 10, "errorMessage" : "The length of the argument ""package"" is longer than 10 characters" }
						]
					}
				}
			};
		/********** END DEFAULT RETURN VALUE **********/


		/********** BEGIN CHECK FOR MISSING ARGUMENTS **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					for ( local.A in local.returnValue.arguments ) {
						for ( local.B in local.returnValue.arguments[ local.A ].validate ) {
							if ( local.returnValue.arguments[ local.A ].required || local.returnValue.arguments[ local.A ].value != "" ) {
								switch( local.B.statusCode ) {
									case 5101 :
										// Not a Integer
										if ( !REFindNoCase( "^\d*$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5105 :
										// BOOLEAN
										if ( !REFindNoCase( "^(1|0|true|false)$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5111 :
										// MIN LENGTH
										if ( !REFindNoCase( "^.{" & local.B.length & ",}$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5240 :
										// MIN LENGTH
										if ( !REFindNoCase( "^.{" & local.B.length & ",}$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5251 :
										// MAX LENGTH
										if ( len( local.returnValue.arguments[ local.A ].value ) > 1 && !REFindNoCase( "^.{1," & local.B.length & "}$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5270 :
										// MAX LENGTH
										if ( len( local.returnValue.arguments[ local.A ].value ) > 1 && !REFindNoCase( "^.{1," & local.B.length & "}$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5112 :
										// JAVASCRIPT FUNCTION NAME
										if ( !REFindNoCase( "^[$A-Z_][0-9A-Z_$]*$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5259 :
										// MAX LENGTH JAVASCRIPT FUNCTION NAME
										if ( !REFindNoCase( "^.{1," & local.B.length & "}$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5540 :
										// FOLDER PATH
										if ( !REFindNoCase( "^((http(s)?|ftp)(:\/\/)).+$", local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
									case 5990 :
										// FOLDER PATH
										if ( !REFindNoCase( variables.statusValues, local.returnValue.arguments[ local.A ].value ) ) {
											local.returnValue.statusCode = local.B.statusCode;
											local.returnValue.arguments[ local.A ]["error"] = local.B.errorMessage;
										}
										break;
								}
							}
						}
					}
				}
				/***** BEGIN UPDATE OF STATUS CODE*****/
					if ( !REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) { local.returnValue.message = "An error has occurred"; }
				/***** END UPDATE OF STATUS CODE *****/
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) { local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message }; }
					if ( isDefined( "e.TagContext" ) ) { local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext; }
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END CHECK FOR MISSING ARGUMENTS **********/
		
		/********** BEGIN QUERY **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/********** BEGIN QUERY **********/
						local.queryService = new query();
						local.queryService.setDatasource( "acmeCars" );
						local.queryService.setName( "thisQuery" );

						/***** BEGIN QUERY PARAMETERS *****/
							local.queryService.addParam( name="color", value=arguments.color, cfsqltype="cf_sql_integer" );
							local.queryService.addParam( name="engine", value=arguments.engine, cfsqltype="cf_sql_integer" );
							if ( arguments.package != "" ) {
								local.queryService.addParam( name="package", value=arguments.package, cfsqltype="cf_sql_varchar" );
							} else {
								local.queryService.addParam( name="package", value="", cfsqltype="cf_sql_varchar" );
							}
						/***** END QUERY PARAMETERS *****/

						/***** BEGIN QUERY STRING *****/
							local.queryService.sqlString = "
								INSERT INTO car (
									color, 
									engine, 
									package)
								VALUES (
									:color, 
									:engine, 
									:package);
							";

						/***** END QUERY STRING *****/

						/***** BEGIN QUERY EXECUTE *****/
						//	local.queryResult = local.queryService.execute( sql= local.queryService.sqlString );
						/***** END QUERY EXECUTE *****/

						/***** BEGIN QUERY RESULTS *****/
						//	local.queryMetaData = local.queryResult.getPrefix();
						//	local.thisQuery = local.queryResult.getResult();
						/***** END QUERY RESULTS *****/
					/********** END QUERY **********/
					}
			}
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** END QUERY **********/

		/********** BEGIN OUTPUT **********/
			try {
				if ( REFindNoCase( "1\d{3}", local.returnValue.statusCode ) ) {
					/***** BEGIN QUERY LOOP *****/
						
						//instead of data I am returning the query and if arguments.package is empty, I am returning it as Null
							if (arguments.package EQ ""){
								arguments.package = "NULL"
							}
							local.returnValue["results"][ 1 ] = {
								"Query" : "INSERT INTO car (color,engine,package) VALUES ( " & arguments.color & ", " & arguments.engine & ", " & arguments.package & ")"
							};
					/***** END QUERY LOOP *****/
				}
				for ( local.A IN local.returnValue.arguments ) {
					for ( local.B in local.returnValue.arguments[ local.A ] ) { if ( !REFindNoCase( "^(message|value|error)$", local.B ) ) { StructDelete( local.returnValue.arguments[ local.A ], local.B, "True"); } }
					if ( StructIsEmpty( local.returnValue.arguments[ local.A ] ) ) { StructDelete( local.returnValue.arguments, local.A, "True"); }
				}
			}			
			catch ( any e ) {
				/***** END BEGIN ERROR MESSAGE *****/
					local.returnValue.statusCode = 5000;
					local.returnValue.message = "An error occurred while running the method <tt>" & ListLast(local.returnValue.eventName, '/') & "</tt>. The error message is " & e.Message & ".";

					if ( isDefined( "e.RootCause.Message" ) ) {
						 local.returnValue.results[ 1 ][ "RootCause" ] = { "message" : e.RootCause.Message };
					}

					if ( isDefined( "e.TagContext" ) ) {
						local.returnValue.results[ 1 ][ "tagContext" ] = e.TagContext;
					}
				/***** END BEGIN ERROR MESSAGE *****/

				/***** BEGIN LOG UPDATE *****/
					//writeLog( file="acmeCars", type="Error", text=local.returnValue.message );
				/***** END LOG UPDATE *****/
			}
		/********** BEGIN OUTPUT **********/

			return local.returnValue;
		/********** END OUTPUT **********/	
	}					
}