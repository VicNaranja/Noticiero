({
	noticiaSeleccionada : function(component, event, helper) {
		var enlace = component.get("v.noticia").Enlace;        
        //Hace la peticion para recuperar la noticia completa y lanzar el evento de noticia seleccionada
        //Dicho evento lo recogera el componente principal y lo mostrara ocultando si procede el listado
        helper.recuperarNoticia(enlace,component);
	}
})