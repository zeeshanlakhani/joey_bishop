define(['jquery', 'underscore', 'backbone'], function($, _, Backbone) {
	var TestModel = Backbone.Model.extend({
		defaults: {
			part1: 'I miss the rat pack',
			part2: 'Yep'
		},
	});
	return TestModel;
});