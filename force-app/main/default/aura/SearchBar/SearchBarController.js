({
    searchKeyChange: function(component, event, helper) {       
        var myEvent = $A.get("e.VIC1:SearchKeyChange");
        myEvent.setParams({"searchKey": event.target.value});
        myEvent.fire();
    }
})