({
	doInit : function(component, event, helper) {
		
        var newExpense = component.get("v.newExpense");  
        //Si cambio el nombre se refleja automaticamente en la interfaz
        //newExpense.Name = "Hola caracola JS";
        //No hace falta hacer un set para que el cambio se refleje en la interfaz
        //component.set("v.newExpense", newExpense );
        helper.getExpenses(component);        
	},
    createExpense : function(component, event, helper) {
        
        var amtField = component.find("amount");
        var amt = amtField.get("v.value");
        
        if (isNaN(amt)||amt=='')
        {
            amtField.setValid("v.value", false);
            amtField.addErrors("v.value", [{message:"Enter an expense amount."}]);
        }
        else 
        {
            amtField.setValid("v.value", true);
            var newExpense = component.get("v.newExpense");  
            //alert(JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
    },
    updateEvent : function(component, event, helper) {
        helper.upsertExpense(component, event.getParam("expense"));                
	}
    
    
})