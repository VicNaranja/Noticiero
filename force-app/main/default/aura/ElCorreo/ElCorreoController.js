({
	doInit : function(component, event, helper) {		
        //Recuperamos listado de noticias
        helper.getNoticias(component);
        
        //Inicializamos noticia seleccionada
        var noticiaSeleccionadaVacia = new Object();
        noticiaSeleccionadaVacia.UrlImagenGrande = "";
        noticiaSeleccionadaVacia.Titular = "";
        noticiaSeleccionadaVacia.Entradilla = "";
        noticiaSeleccionadaVacia.listaParrafos = null;
        component.set("v.noticiaSeleccionada", noticiaSeleccionadaVacia);
        
	},
    noticiaSeleccionada : function(component, event, helper) {		
        var noticia = event.getParam("noticia");
        component.set("v.noticiaSeleccionada", noticia);		
        //Ocultamos el listado de noticias		
		$A.util.toggleClass(component.find("ContenedorNoticias"), "oculto");
        //Mostramos la noticia
        $A.util.toggleClass(component.find("ContenedorNoticia"), "oculto");
        //Mostramos el boton back
        $A.util.toggleClass(component.find("menu"), "oculto");  
	}
    ,
    backButtonPress : function(component,event,helper) {
        $A.util.toggleClass(component.find("ContenedorNoticias"), "oculto");
        $A.util.toggleClass(component.find("ContenedorNoticia"), "oculto");
        $A.util.toggleClass(component.find("menu"), "oculto"); 
    }
})