({
	getNoticias : function(component,seccion) {
		var action = component.get("c.getNoticias");
        action.setParams({ 
          "section": seccion
        });
        var self = this;
        
        action.setCallback(this, function(a) {     
            component.set("v.noticias", a.getReturnValue()); 
            
            component.find("scroll").scrollTo('top',0, 0); 
            //alert("Noticias:" + component.get("v.noticias")[5].separador)
            //debugger;
        });
        
        $A.enqueueAction(action);
        
	}
})