public class PeticionesNoticiero {

    	private static final Integer TIME_OUT = 20000;
        private static final String GET = 'GET';
        private static final String POST = 'POST';
	    public static String fakeResponse {get;set;}  
    
		public static String makeGet(String url)
        {           
            //Cabeceras por defecto
            Map<String,String> cabecera = new Map<String,String>();
            cabecera.put('content-type', 'application/json');
            return makeGet(getRequest(GET,cabecera,url));
        }
        	
        private static HttpRequest getRequest(String action,Map<String,String> headers, String url)
        {
            HttpRequest req = new HttpRequest();
            req.setEndpoint(url);
            req.setMethod(action);
            req.setTimeout(TIME_OUT);
            
            if (headers != null)
            {
                for(String key : headers.keySet())
                {
                    req.setHeader(key, headers.get(key));
                }
            }                        
            return req;
        }

        private static String makeGet(HttpRequest request)
        {
        	try 
        	{
                Http http = new Http();
                if (!Test.isRunningtest())
                {
                    HTTPResponse response = http.send(request);
                    //system.debug(req);
                    //system.debug('Respuesta GET -> ' + response.getBody());                            
                    if (response.getStatusCode() == 200)
                        return response.getBody();
                    else
                        return '';                                                 
                }
                else
                {
                    return fakeResponse;
                }
        	}
        	catch (System.CalloutException e)
        	{
        		System.debug('Error en la petición GET - ' + e.getMessage());
        		return '';
        	}            
        }

        
}