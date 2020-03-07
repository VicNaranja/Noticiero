({
	render : function(component, helper) {
        //console.warn("render");
		var ret = this.superRender();
      	//helper.initScripts(component);
        return ret;
	},
    
	afterRender : function(component, helper) {
        //console.warn("afterRender");
		this.superAfterRender();
       	helper.initHandlers(component);
	}
})