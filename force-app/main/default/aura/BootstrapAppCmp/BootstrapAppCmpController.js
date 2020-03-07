({
    initScripts: function(component, event, helper) {

        //Ignore duplicate notifications that may arrive because other components 
        //loading scripts using the same library. 
        if (component.alreadyhandledEvent)  
        {
            alert('init script');
            return;
        }
        	alert('init script2');
            var btn = component.find("modalToggle").getElement();
            var dlg = component.find("modalDlg").getElement();
            $(btn).on("click", function() {                
                jQuery(dlg).modal();
            });
            component.alreadyhandledEvent = true;
        
    },
    doInit : function(component, event, helper) {
		
       
        
	},
})