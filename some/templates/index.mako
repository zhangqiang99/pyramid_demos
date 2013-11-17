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
function StartUpController($scope) {
   $scope.computeNeeded = function() {
   $scope.needed = $scope.startingEstimate * 10;
};
   $scope.requestFunding = function() {
   window.alert("Sorry, please get more customers first.");
};
}

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
<div ng-controller="StartUpController">
  <form ng-submit="requestFunding()">
Starting: <input ng-change="computeNeeded()" ng-model="startingEstimate">
Recommendation: {{needed}}
<button>Fund my startup!</button>
</form>
</div>
  </body>
</html>
