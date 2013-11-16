<!doctype html>
<html ng-app="project" ng-init="users=${users};">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular-resource.min.js">
    </script>
    <script>
var app = angular.module('project', ['ngResource']);

app.controller('MainCtrl', function($scope, $resource) {
  $scope.data = $resource('users').get(function() {
    $scope.loaded = true;
    //now it's safe to access $scope.data's properties:
  });
});

    </script>
  </head>
    <body ng-controller="MainCtrl">
        <div data-ng-repeat="user in users">
        <h2>{{user}}</h2>
      </div>
  </body>
</html>
