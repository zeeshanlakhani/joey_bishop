define(['jquery', 'underscore', 'backbone', 'models/testmodel'], function($, _, Backbone, TestModel) {

	var Project = Backbone.Collection.extend({
		model: TestModel
	});

	return new Project;

});