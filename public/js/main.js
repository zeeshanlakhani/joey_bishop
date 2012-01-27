require.config({
	paths: {
		"jquery": "//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min"
	}
});

require(["jquery", "/js/libs/modernizr-2.0.6.js", "plugins", "/js/libs/less-1.2.1.min.js"], function($) {
    $(function() {
    	log("foo");
    });
});