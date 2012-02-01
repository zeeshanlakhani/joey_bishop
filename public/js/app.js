define(['require', 'jquery', 'backbone'], function(require, $, Backbone, testview) {
	return {
		initialize: function(args) {
			log('init app');
			Backbone.sync = function(method, model, success, error) {
				success();
    		}
			if(typeof args != 'undefined') {
				if(args.hasOwnProperty('depends')) {                                                                                                                                                                                                                                                                                                                     
					require(args.depends, this.onDependsLoaded);
				}
			}
		},

		onDependsLoaded: function(TestView) {
			var testview = new TestView;
		}
	};
});