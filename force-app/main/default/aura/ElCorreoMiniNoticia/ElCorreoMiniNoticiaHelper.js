({
	recuperarNoticia : function(articulo,component) {
        var action = component.get("c.getNoticia");
        action.setParams({ 
          "articulo": articulo
        });
        var self = this;
        action.setCallback(this, function(a) {     
            var noticiaSeleccionadaEvent = $A.get("e.c:ElCorreoNoticiaSeleccionada");            
            noticiaSeleccionadaEvent.setParams({ "noticia": a.getReturnValue() }).fire();
        });
        $A.enqueueAction(action);
	}
})