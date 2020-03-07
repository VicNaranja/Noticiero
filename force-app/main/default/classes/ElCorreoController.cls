/*
Clase controladora para recuperar noticias de varias fuentes
*/
public class ElCorreoController {

    @AuraEnabled
    public static List<Noticia> getNoticias(String section) {
         String url = '';
         system.debug('getNoticias::section::' + section);
         if (section == 'Iberostar')
         {
             url = 'http://www.vic-designs.com/api/Iberostar/Noticias/';             
         }
         else
         {
             if (section == null || section == 'ElCorreo')
                 section = 'portada';
             
             url = 'http://www.vic-designs.com/api/ElCorreo/Noticias/' + section;                          
         }    
                  
         String noticiasJSON = PeticionesNoticiero.makeGet(url);
         system.debug('noticiasJSON::' + noticiasJSON);
         List<Noticia> noticias = (List<Noticia>)JSON.deserialize(noticiasJSON, List<Noticia>.class);
         Integer i = 0;
         for(Noticia n : noticias)
         {
             n.id = i;
             i++;
             if (n.UrlImagenPequena == '')
                 n.UrlImagenPequena = n.UrlImagenPequenaAncha;
             
             system.debug('NOTICIA::' + n.UrlImagenPequena);
             if (n.UrlImagenPequena != null && !n.UrlImagenPequena.startsWith('http'))    
                 n.UrlImagenPequena = 'http:' + n.UrlImagenPequena;
             else if (n.UrlImagenPequena != null && !n.UrlImagenPequena.startsWith('https'))    
                 n.UrlImagenPequena = 'https:' + n.UrlImagenPequena;
         }
         return noticias;
    }
    
    @AuraEnabled
    public static Noticia getNoticia(String articulo,String seccion) {
        
        String url = '';

        if (seccion == 'Iberostar')
         {
             url = 'http://www.vic-designs.com/api/Iberostar/Noticia/?url=' + EncodingUtil.urlEncode(articulo,'UTF-8');    
         }
         else
         {
             url = 'http://www.vic-designs.com/api/ElCorreo/Noticia/?url=' + EncodingUtil.urlEncode(articulo,'UTF-8');                       
         } 

        String noticiaJSON = PeticionesNoticiero.makeGet(url);
        system.debug('noticiaJSON ->' + noticiaJSON);
        Noticia n = (Noticia)JSON.deserialize(noticiaJSON, Noticia.class);
        
        system.debug('NOTICIA ' + n);
        //Verificamos si tiene imagen 
        if (n.UrlImagenGrande == null)
            n.UrlImagenGrande = '';

		if (n.UrlImagenGrande != null && !n.UrlImagenGrande.startsWith('http:'))    
                 n.UrlImagenGrande = 'http:' + n.UrlImagenGrande;
        
        for(Noticia.Parrafo p : n.listaParrafos)
        {
            if (p.esImg && p.Texto != null && !p.Texto.startsWith('http'))    
                 p.Texto = 'http:' + p.Texto;
        }
        
        return n;
    }
        
    
}