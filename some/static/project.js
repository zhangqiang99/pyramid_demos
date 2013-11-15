angular.module('project', ['ngRoute', 'firebase']).
  value('fbURL', 'https://angularjs-projects.firebaseio.com/').
  factory('Projects', function(angularFireCollection, fbURL) {
    return angularFireCollection(fbURL);
  }).
  config(function($routeProvider) {
    $routeProvider.
      when('/list', {controller:ListCtrl).
      when('/edit/:projectId', {controller:EditCtrl}).
      when('/new', {controller:CreateCtrl}).
      otherwise({redirectTo:'/'});
  });
 
function ListCtrl($scope, Projects) {
  $scope.projects = Projects;
}
 
function CreateCtrl($scope, $location, $timeout, Projects) {
  $scope.save = function() {
    Projects.add($scope.project, function() {
      $timeout(function() { $location.path('/list'); });
    });
  }
}
 
function EditCtrl($scope, $location, $routeParams, angularFire, fbURL) {
  angularFire(fbURL + $routeParams.projectId, $scope, 'remote', {}).
  then(function() {
    $scope.project = angular.copy($scope.remote);
    $scope.project.$id = $routeParams.projectId;
    $scope.isClean = function() {
      return angular.equals($scope.remote, $scope.project);
    }
    $scope.destroy = function() {
      $scope.remote = null;
      $location.path('/list');
    };
    $scope.save = function() {
      $scope.remote = angular.copy($scope.project);
      $location.path('/list');
    };
  });
}