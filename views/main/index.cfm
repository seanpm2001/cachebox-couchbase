<cfoutput>

<h1>CouchBase CacheBox Provider Test</h1>
	<cfscript>
			
		testData = {
			string = "foobar",
			number = 3.14,
			JSON = '{"foo":"bar","loo":5,"subStruct":{"goo":"smar"},"subArray":[1,2,3,4,5]}',
			array = ['a','b','c','d','e'],
			struct = {"foo":"bar","loo":5,"subStruct":{"goo":"smar"},"subArray":[1,2,3,4,5]},
			XML = XMLParse('<root><item attr1="value1" attr2="value3" /><item attr1="value1" attr2="value3" /><item attr1="value1" attr2="value3" /></root>'),
			CFC = event
		};
		
		cb = getModel(dsl="cacheBox:couchBase");
		i=0;
		timer type="inline" label="looping sets" {
			while(++i<10) {
				cb.set(i,i);
			}
		}
		writeOutput('<br><br><br>');		
		i=0;
		timer type="inline" label="looping gets" {
			while(++i<10) {
				cb.get(i);
			}
		}
		writeOutput('<br><br><br>');
	
		// Careful calling this.  It is asynch and can take a while to run so you might not be able to set anything into the  
		// cache for a few minutes until it is still deleting.  (If you try, you will get nothing back so I assume it is still "deleting")
		//cb.clearAll();
		
		for(key in testData) {
			cb.set(key,testData[key]);			
		}
							
	</cfscript>

<!---	<cfloop collection="#testData#" item="key">
		#key#: <cfdump expand="false" var="#cb.get(key)#">
	</cfloop>--->

	<!---<cfdump var="#cb.getKeys()#">--->
	
	<cfdump var="#cb.getStats()#">
	
		
</cfoutput>