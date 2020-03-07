({
	update: function(component, evt, helper) {
      var expense = component.get("v.expense");                   
       //alert(JSON.stringify(expense));
      var updateEvent = $A.get("e.VIC1:updateExpenseItem");
      updateEvent.setParams({ "expense": expense }).fire();
    }
})