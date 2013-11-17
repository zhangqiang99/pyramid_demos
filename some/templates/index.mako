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
app.controller('SimpleAjaxController', function($scope, $http) {
  // Hidden our previous section's content
  // construct our http request
  $scope.beers = "nothing yet"
  $http({
    method: 'JSONP',
    url: 'http://api.openbeerdatabase.com/v1/beers.json?callback=JSON_CALLBACK'
}).success(function(data, status, headers, config) {
  // data contains the response
  // status is the HTTP status
  // headers is the header getter function
  // config is the object that was used to create the HTTP request
  $scope.beers = data
}).error(function(data, status, headers, config) {
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
function StartUp1Controller($scope) {

   $scope.computeNeeded = function() {
       $scope.needed = $scope.startingEstimate * 10;
};

   $scope.requestFunding = function() {
       window.alert("Sorry, please get more customers first.");
};

}
function FullstackController($scope) {
   $scope.formShow.show = false;
   $scope.requestSubmit = function() {
      window.alert(
);
};
}
function DeathrayMenuController($scope) {
   $scope.menuState.show = false;
   $scope.toggleMenu = function() {
   $scope.menuState.show = !$scope.menuState.show;
};
// death ray functions left as exercise to reader
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
      <pre>{{users | json}}</pre>
    </table>
    <hr>
<div ng-controller="FirstCtrl">    
    Search: <input ng-model="searchText">
    <table id="searchTextResults">
      <tr><th>Name</th><th>Phone</th></tr>
      <tr ng-repeat="user in users | filter:searchText ">
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
<div ng-controller="StartUp1Controller">
<div>
  <form ng-submit="requestFunding()" >
Starting: <input ng-change="computeNeeded()" ng-model="startingEstimate">
Recommendation: {{needed}}
<button>Fund my startup!</button>
</form>
</div>
</div>
<div ng-controller="FullstackController">
<div ng-show="formShow1.show">
  <form>
    <input ng-model="myValue">
    <button ng-click="requestSubmit()">Submit</button>
  </form>
</div>
</div>
<form>
<button>Submit</button>
</form>
</div>
<div ng-controller="SimpleAjaxController">
  <button ng-click="makeRequest()">Make request</button>
  <pre style="overflow: hidden; height: 250px; border:1px solid #eee;">
    Request result: {{ beers }}
  </pre>
</div>
<div ng-controller='DeathrayMenuController'>
<button ng-click='toggleMenu()'>Toggle Menu</button>
<ul ng-show='menuState.show'>
<li ng-click='stun()'>Stun</li>
<li ng-click='disintegrate()'>Disintegrate</li>
<li ng-click='erase()'>Erase from history</li>
</ul>
<div/>
  </body>
</html>
