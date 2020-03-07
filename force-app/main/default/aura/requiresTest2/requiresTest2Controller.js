({
    init: function(component, event, helper) {
        // The objs parameter from the event contains objects returned in the requirejs callback
      	var objs = event.getParams().objs;
        
        // Use $j rather than $ to avoid jQuery conflicts
        if (typeof jQuery !== "undefined" && typeof $j === "undefined") {
            $j = jQuery.noConflict(true);;
        }        
        
       	component.set("v.ready", true);
       	helper.initHandlers(component);
    },
        
    toggleAlert: function(component, event, helper) {
        /*
         * The second argument to jQuery is the context, which is the top-level container
         * for the queries. Use the component element as the context, so that the queries
         * do not "leak" outside of the component.
         */
        var context = component.getElement();
        $j("div#test_alert", context).toggle();
    }
})