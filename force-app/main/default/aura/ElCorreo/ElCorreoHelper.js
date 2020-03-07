({
	getNoticias : function(component) {
		var action = component.get("c.getNoticias");
        action.setParams({ 
          "section": "portada"
        });
        var self = this;
        action.setCallback(this, function(a) {     
            component.set("v.noticias", a.getReturnValue()); 
            //alert("Noticias:" + component.get("v.noticias")[5].separador)
            //debugger;
        });
        $A.enqueueAction(action);
	}
})