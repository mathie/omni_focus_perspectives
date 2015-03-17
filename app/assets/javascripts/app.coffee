perspectives = angular.module('perspectives', [
  'templates',
  'ngRoute',
  'controllers'
])

perspectives.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider.when('/',
      templateUrl: 'index.html'
      controller: 'PerspectivesController'
    )
])

controllers = angular.module('controllers', [])
controllers.controller('PerspectivesController', [ '$scope',
  ($scope) ->
])