({
	doInit : function(component, event, helper) {
		
        console.log('hola'+ $(".ContenedorScroll"));
        var seccion = component.get("v.seccion");
        console.log('Seccion:' + seccion);
        helper.getNoticias(component,seccion);
        component.set("v.origen", Math.random());//Ahora vas y lo cascas
	},
    noticiaSeleccionada : function(component, event, helper) {		
        
        //guardamos scroll
        var capa = $(".ContenedorScroll")[0];
        var scrolTop = capa.scrollTop;        
        component.set("v.scrollTop",scrolTop); 
        console.log('guardado scroll:' + scrolTop);
        
        var noticia = event.getParam("noticia");
        var origenEvento = event.getParam("origen");
        var origenComponente = component.get("v.origen");
        console.log('origenEvento:' + origenEvento);
        console.log('origenComponente:' + origenComponente);
        if (origenEvento == origenComponente)
        {
            component.set("v.noticiaSeleccionada", noticia);        
            
            //Ocultamos el listado de noticias      
            $A.util.toggleClass(component.find("ContenedorNoticias"), "oculto");
            //Mostramos la noticia
            $A.util.toggleClass(component.find("ContenedorNoticia"), "oculto");
            //Mostramos el boton back
            $A.util.toggleClass(component.find("menu"), "oculto");
            
            //Subimos el scroll
            component.find("scroll").scrollTo('top',0, 0); 
        }               
	}
    ,
    backButtonPress : function(component,event,helper) {
        $A.util.toggleClass(component.find("ContenedorNoticias"), "oculto");
        $A.util.toggleClass(component.find("ContenedorNoticia"), "oculto");
        $A.util.toggleClass(component.find("menu"), "oculto"); 
        
        var scrollTop = component.get("v.scrollTop");
        console.log('recuperando scroll:' + scrollTop);
        //component.find("scroll").scrollTo('custom',0, scrollTop);
        $(".ContenedorScroll").scrollTo(scrollTop+'px',1);
    }
    ,
    onselectMenu : function(component, event, helper) {		
    	var selectedMenuItemValue = event.getParam("value");
        var action = component.set("v.seccion",selectedMenuItemValue);
        helper.getNoticias(component,selectedMenuItemValue);
        
    }   
    
})