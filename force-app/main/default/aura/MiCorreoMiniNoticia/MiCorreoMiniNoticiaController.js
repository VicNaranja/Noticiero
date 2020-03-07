({
	noticiaSeleccionada : function(component, event, helper) {
		var enlace = component.get("v.noticia").Enlace;  
		var origen = component.get("v.origen"); 
		var seccion = component.get("v.seccion");  
        helper.recuperarNoticia(enlace,component,origen,seccion);
	}
})