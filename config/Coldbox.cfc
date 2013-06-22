<cfcomponent output="false">
<cfscript>

	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "CouchBaseTestApp",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			
			//Implicit Events
			defaultEvent			= "main.index",
				
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
	
		
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm"
		};
		
		//Register interceptors as an array, we need order
		interceptors = [
			{class="coldbox.system.interceptors.SES"}
		];
		
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" },
				files={class="coldbox.system.logging.appenders.AsyncRollingFileAppender",
					properties = {
						filename = coldbox.appName, filePath="logs"
					}
				}
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ] 
		};
				
	}

</cfscript>
</cfcomponent>