public class PeticionesHttp {

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
    
    	public static String makeGet(String url, Map<String,String> headers)
        {
            return makeGet(getRequest(GET,headers,url));
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

        public static String makePost(string url, Map<String,String> parametros)
        {
    		String body = crearParametros(parametros);
    		return makePost(url,body);
        }

        public static String makePost(string url, String cuerpo)
        {
            return makePost(url, cuerpo, null);
        }

        public static String makePost(string url, String cuerpo, Map<String, String> mapaHeaders)
        {
    		System.debug('cuerpo: ' + cuerpo);    		
    		try
    		{
    			HttpRequest req = new HttpRequest();
    			req.setEndpoint(url);
    			req.setMethod('POST');
    			req.setbody(cuerpo);
    			req.setTimeout(20000);

                if(mapaHeaders == null || mapaHeaders.isEmpty())
                {
        			req.setHeader('Cache-control', 'no-cache');
        			req.setHeader('Pragma', 'no-cache');
        			req.setHeader('Acept-Language', 'en-US,en;q=0.5');
        			req.setHeader('Content-Type', 'application/json');
                }
                else
                {
                    for(String key : mapaHeaders.keySet())
                    {
                        req.setHeader(key, mapaHeaders.get(key));
                    }
                }
                
    			Http http = new Http();
                if (!Test.isRunningtest())
                {
    			    HTTPResponse response = http.send(req);
                    system.debug('Respuesta POST -> ' + response.getBody());

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
                System.debug('Error en la petición POST - ' + e.getMessage());
                return '';
            }
        }
 
        /**
         * Crea un string con los pares nombre valor preparado para enviar como cuerpo de un peticion POST
         * @param mapa con los parametros a incluir de tipo string
         * @return param1=valorParam1&Param2=valorParam2.....
         */
        private static String crearParametros(Map<String,String> parametros)
        {
            String resultado = '';
            for(String key : parametros.keySet())
            {
                resultado = resultado + key + '=' + parametros.get(key) + '&';
            }
            return resultado;
        }
}