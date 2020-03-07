@isTest
public class ElCorreoController_TEST {
    
    static testMethod void testGetNoticias()
    {
        PeticionesNoticiero.fakeResponse = '[{"UrlImagenPequena":null,"UrlImagenPequenaAncha":null,"UrlImagenGrande":null,"UrlGaleria":null,"Titular":"Politica","Entradilla":null,"Enlace":null,"Destacada":false,"separador":true,"listaParrafos":null,"listaNoticiasMasInformacion":null},{"UrlImagenPequena":"//static3.elcorreo.com/www/multimedia/201806/15/media/cortadas/celaa-kFjH--396x245@RC.jpg","UrlImagenPequenaAncha":"//static3.elcorreo.com/www/multimedia/201806/15/media/cortadas/celaa-kFjH--396x245@RC.jpg","UrlImagenGrande":null,"UrlGaleria":null,"Titular":"El Gobierno restablece la sanidad universal para atender a los inmigrantes irregulares","Entradilla":null,"Enlace":"http://www.elcorreo.com/politica/gobierno-aprueba-sanidad-publica-universal-20180615133453-ntrc.html","Destacada":false,"separador":false,"listaParrafos":null,"listaNoticiasMasInformacion":null}]';
        ElCorreoController.getNoticias('Iberostar');
        ElCorreoController.getNoticias('ElCorreo');
        ElCorreoController.getNoticias('Athletic');
    }
    
    static testMethod void testGetNoticia()
    {
   		PeticionesNoticiero.fakeResponse = '{"UrlImagenPequena":null,"UrlImagenPequenaAncha":null,"UrlImagenGrande":null,"UrlGaleria":"","Titular":"El Gobierno aprueba la vuelta de la sanidad pública universal","Entradilla":"El Ejecutivo de Sánchez derogará así la reforma del PP que retiró la tarjeta sanitaria a los inmigrantes en situación irregular","Enlace":null,"Destacada":false,"separador":false,"listaParrafos":[{"Texto":"//static3.elcorreo.com/www/multimedia/201806/15/media/cortadas/celaa-kFjH-U6051888822ikB-624x385@RC.jpg","Tiempo":null,"Strong":false,"esImg":true,"esLive":false},{"Texto":"","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"El Gobierno ha anunciado este viernes que derogará la reforma del PP que retiró la tarjeta sanitaria a los inmigrantes en situación irregular para devolver el derecho a la sanidad universal. Así lo ha asegurado la portavoz del Ejecutivo, Isabel Celaá, durante la rueda de prensa posterior al Consejo de Ministros, en la que ha advertido de que es un asunto «extraordinariamente importante» para toda la sociedad y de «decencia política».","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"Celaá ha explicado que la reforma sanitaria se aprobó a través de un Real Decreto en abril de 2012, con lo que el Gobierno tendrá que elaborar uno nuevo para dejarlo sin vigencia, cuyo texto podría estar listo en seis semanas para su aprobación por el Consejo de Ministros. Posteriormente, según ha explicado, serán necesarios otros 30 días para su convalidación en el Congreso de los Diputados. «Hoy se abre un proceso de diálogo con las comunidades autónomas y la sociedad civil para devolver el derecho a la protección a la salud a todas las personas en el Estado», ha señalado Celaá.","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"La reforma sanitaria, aprobada con Ana Mato al frente del Ministerio de Sanidad, introdujo también nuevos copagos farmacéuticos en función de la renta, que por primera vez afectaban a a los pensionistas. Ante esta situación, algunos gobiernos autonómicos aprobaron iniciativas para aumentar la protección a los «sin papeles», que fueron recurridas por el anterior Gobierno ante el Tribunal Constitucional y que éste revocó al considerar que este colectivo no tiene derecho a la tarjeta sanitaria, como ha recordado la también ministra de Educación. La portavoz ha augurado que una vez aprobada la nueva norma, «no habrá ninguna comunidad que la incumpla».","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"«Esto es una cuestión de decencia política, pero no solo de decencia política; esta protección a la salud es, además, un mandato de todos los organismos internacionales, de la ONU, de la UE, de la OMS e, incluso, del Defensor del Pueblo, que expresó su resistencia cuando el Real Decreto fue publicado», ha dicho Celaá.","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"Liberar 7.500 millones de euros","Tiempo":null,"Strong":true,"esImg":false,"esLive":false},{"Texto":"El Ejecutivo también ha aprobado este viernes liberar 7.500 millones de euros del préstamo concedido por el Tesoro Público a la Tesorería General de la Seguridad Social, recogido en los Presupuestos del año pasado y que ascendía a 10.192 millones de euros. Celaá ha afirmado que este acuerdo se ha adoptado para poder hacer frente al pago de las casi 9,6 millones de pensiones de julio, tanto de la paga ordinaria como de la extraordinaria.","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"Ha aprobado también una batería de nombramientos en los segundos niveles de la Administración y en diversas instituciones como la Fiscalía General del Estado, al frente de la que estará la hasta ahora fiscal jefe de Sevilla, María José Segarra.","Tiempo":null,"Strong":false,"esImg":false,"esLive":false},{"Texto":"La de hoy ha sido la segunda reunión del Gobierno de Pedro Sánchez y contará con una cara nueva respecto a la del viernes pasado, la del ministro de Cultura, José Guirao, tras sustituir en el cargo a Máxim Huerta después de su renuncia. Pero no ha habido la foto de familia del Ejecutivo tras esta incorporación ya que hoy no estará presente en la reunión el ministro de Asuntos Exteriores, Josep Borrell, ya que se encuentra en Estados Unidos acompañando a los Reyes en su visita oficial a este país.","Tiempo":null,"Strong":false,"esImg":false,"esLive":false}],"listaNoticiasMasInformacion":null}';
		ElCorreoController.getNoticia('test','test');  
    }

}