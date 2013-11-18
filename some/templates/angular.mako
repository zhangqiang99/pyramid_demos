<!doctype html>
<html ng-app="posting">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
 
    </script>
<script>
var app = angular.module('posting',[]);

app.controller('StartUpController', function($scope) {
         $scope.upvotes = 0;
	 $scope.serverupvotes = 0;
	 $scope.increase = function(){
	 	$scope.upvotes = $scope.upvotes + 1;
	 };
});

</script>
  </head>
  <body>
    <div ng-controller="StartUpController" >
      <label>Name:</label>
      <input type="text" ng-model="yourName" placeholder="Enter a name here">
      <button ng-click="increase()">Upvote</button>
      <hr>
      <h1>Hello {{yourName}}!</h1>
      <h2>{{upvotes}}</h2><h2>{{serverupvotes}}</h2>	
    </div>
  </body>
</html>
