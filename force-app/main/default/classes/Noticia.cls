public class Noticia {
		
        @AuraEnabled
    	public boolean Destacada{get;set;}
    	@AuraEnabled
        public boolean separador{get;set;}
    	@AuraEnabled
        public String Enlace{get;set;}
    	@AuraEnabled
        public String Entradilla{get;set;}
    	@AuraEnabled
        public String Titular{get;set;}
    	@AuraEnabled
        public String UrlImagenGrande {get;set;}
        @AuraEnabled
        public String UrlImagenPequena{get;set;}
        @AuraEnabled
        public String UrlImagenPequenaAncha{get;set;}
    	@AuraEnabled
        public Noticia[] listaNoticiasMasInformacion {get;set;}
    	@AuraEnabled
        public Parrafo[] listaParrafos  {get;set;}
        @AuraEnabled
        public Integer id  {get;set;}
 
    	public class Parrafo
        {
            @AuraEnabled
            public String Texto {get;set;}
            @AuraEnabled
            public String Strong {get;set;}  
            @AuraEnabled
            public Boolean esImg {get;set;}
        }
}