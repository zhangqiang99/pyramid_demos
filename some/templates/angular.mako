<!doctype html>
<html ng-app>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
<script>
function StartUpController($scope) {
	 $scope.upvotes = 0;
	 $scope.increase = function(){
	 	$scope.upvotes = $scope.upvotes + 1;
	 };
}
</script>
  </head>
  <body>
    <div ng-controller="StartUpController" >
      <label>Name:</label>
      <input type="text" ng-model="yourName" placeholder="Enter a name here">
      <button ng-click="increase()">Upvote</button>
      <hr>
      <h1>Hello {{yourName}}!</h1>
      <h2>{{upvotes}}</h2>
    </div>
  </body>
</html>