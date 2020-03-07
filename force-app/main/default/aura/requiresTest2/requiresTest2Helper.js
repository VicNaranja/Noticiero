({
    initHandlers: function(component) {
        var ready = component.get("v.ready");
        if (ready === false) {
           	return;
        }
        
        // Set the context for jQuery to the component element
        // This prevents conflict between components

        var ctx = component.getElement();
        
        // Setup the modals        
        $j("#modalToggle", ctx).on("click", function() {
            $j("#" + component.get("v.modalName"), ctx).modal(); 
        });

		// Setup the toggles        
        $j("#toggleAlert", ctx).on("click", function() {
            $j("div#test_alert", ctx).toggle();
        });
        
        $j("[data-press]", ctx).each(function(i, el) {
            $j(el).on("click", function(a, b) {
                var f = $j(el).data("press");
                component.get("c." + f).run(component, null, component.get("h"));
            });
            
        });
    }
})