require.config({
	paths: {
		require: 'libs/require',
		jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min',
		underscore: 'libs/underscore-min', //AMD support
		backbone: 'libs/backbone-min', //AMD support
		views: 'views'
	}
});

require(['domReady', 'plugins', 'app'], function(domReady, plugins, app) {
	domReady(function () {
		app.initialize({depends: environment.deps});
	});
});