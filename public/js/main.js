require.config({
	paths: {
		jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min',
		underscore: 'libs/underscore-min', //AMD support
		backbone: 'libs/backbone-optamd3-min' //AMD support
	}
});

require(['domReady', 'libs/modernizr-2.0.6', 'plugins', 'app'], function(domReady, modernizr, plugins, app) {
	domReady(function () {
		app.init();
	});
});