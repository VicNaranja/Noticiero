({    
    fireRequiresReady: function(component, objs) {
		var evt = component.getEvent("requiresReady");
        evt.setParams({objs: objs});
        evt.fire();
    },
    
    setup: function(component, event, next) {
        
        var self = this;
        if (typeof requirejs !== "undefined") {
          	self.loadRequired(component);
        } else {
            // Load require.js        
            var self = this;
            self.loadScript("requirejs", "/resource/aotp1__require/require.min.js", function() {
                self.loadRequired(component);
            });
        }
    },
    
    loadRequired: function(component) {
        
        var self = this;
        
        // Get the Global Id to use a a key
      	var globalId = component.getGlobalId();
        
        // Get the namespace
      	var ns = component.getDef().getDescriptor().getNamespace();
        
        // Get the base URL
       	var baseUrl = component.get("v.baseUrl");

        var path = null;
        var fullPath = null;
        
        // Load the styles        
        var styles = component.get("v.styles").toJSON();
        
        for (var key in styles) {
            path = styles[key];
            fullPath = baseUrl + ns + "__" + path;
            self.loadStyle(fullPath);
        }
        

		// Create the requirejs config object
        var config = {
            baseUrl: baseUrl,
            paths: {},
            shim: {}
        };

        // Load the scripts
        var scripts = component.get("v.scripts").toJSON();
        var scriptArray = [];
        
        for (var key in scripts) {
            path = scripts[key];
            scriptArray.push(key);
            // Remove the .js extension, if present
            path = path.replace(/\.js/g, "");
            fullPath = baseUrl + ns + "__" + path;
            config.paths[key] = fullPath;
        }

        // Load the deps
        var deps = component.get("v.deps").toJSON();
        
        for (var key in deps) {
            config.shim[key] = deps[key];
        }

        requirejs.config(config);
        requirejs(scriptArray, function() {
            var objs = {};
            for (var i = 0; i < scriptArray.length; i++) {
                objs[scriptArray[i]] = arguments[i];
            }
            self.fireRequiresReady(component, objs);
        });
        
    },
    
    loadStyle: function(stylePath, next) {
        var id = stylePath.replace("/", "_");
        var link = document.getElementById(id);
        if (!link) {
            var head = document.getElementsByTagName('head')[0];
            var link = document.createElement('link');
            
            link.href = stylePath; 
            link.rel = 'stylesheet';
            link.helper = this;
            link.id = id;
            
            link.onload = function() {
                if (typeof next === "function") {
                    next();
                }
            }
            
            head.appendChild(link);
        }
    },
    
    loadScript: function(name, scriptPath, next) {
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        
        script.src = scriptPath; 
        script.type = 'text/javascript';
        script.key = scriptPath;
        script.helper = this;
        script.id = "script_" + name;
        
        script.onload = next;
        head.appendChild(script);
    }
})