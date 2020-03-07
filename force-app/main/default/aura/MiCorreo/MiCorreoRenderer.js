({
	// Your renderer method overrides go here
	afterRender: function (component, helper) {
    	this.superAfterRender();
    	// interact with the DOM here
    	console.log('after render');
	}

})