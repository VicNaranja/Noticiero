({
	recuperarNoticia : function(articulo,component,origen,seccion) {
		var action = component.get("c.getNoticia");
        action.setParams({ 
          "articulo": articulo,
          "seccion": seccion
        });
        var self = this;
        action.setCallback(this, function(a) {     
            
            var noticiaSeleccionadaEvent = $A.get("e.c:MiCorreoNoticiaSeleccionada"); 
            noticiaSeleccionadaEvent.setParams({ "noticia": a.getReturnValue(),"origen":origen }).fire();
        });
        $A.enqueueAction(action);
        
        
	}
})