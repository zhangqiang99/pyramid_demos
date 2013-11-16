<!doctype html>
<html ng-app="project" ng-init="users=${users};">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular-resource.min.js">
    </script>
    <script>
var app = angular.module('project', ['ngResource']);

app.controller('MainCtrl', function($scope, $resource) {
  $scope.data = $resource('users','friends').get(function() {
    $scope.loaded = true;
    //now it's safe to access $scope.data's properties:
  });
});
app.controller('FirstCtrl', function($scope, $resource) {
  $scope.data = $resource('friends').get(function() {
    $scope.loaded = true;
    //now it's safe to access $scope.data's properties:
  });
});

    </script>
  </head>
    <body ng-controller="MainCtrl">
        <div data-ng-repeat="user in users">
        <h2>{{user.name}}</h2>
	 <h2>{{user.phone}}</h2>
	 
      </div>
	Search: <input ng-model="searchText">
    <table id="searchTextResults">
      <tr><th>Name</th><th>Phone</th></tr>
      <tr ng-repeat="user in users | filter:searchText">
        <td>{{user.name}}</td>
        <td>{{user.phone}}</td>
      </tr>
    </table>
    <hr>
<div ng-controller="FirstCtrl">    
    Search: <input ng-model="searchText">
    <table id="searchTextResults">
      <tr><th>Name</th><th>Phone</th></tr>
      <tr ng-repeat="user in users | filter:searchText">
        <td>{{user.name}}</td>
        <td>{{user.phone}}</td>
      </tr>
    </table>
    <hr>
</div>
  </body>
</html>
