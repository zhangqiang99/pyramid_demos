<!doctype html>
<html ng-app="posting">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
 
    </script>
<script>
var app = angular.module('posting',[]);
app.factory('myService', function($http) {
   return {
     getFooOldSchool: function(callback) {
       $http.get('angularresult').success(callback);
     }
   }
});
var postData = {'result': '27'};
app.factory('mypostService', function($http) {
   return {
     postFooOldSchool: function() {
       $http.post('/angularresult', JSON.stringify(postData)
       ).success(function(data, status, headers){

       }).error(function(data, status, headers){
 
       });
     }
   }
});
app.controller('StartUpController', function($scope, $http, myService, mypostService) {
         $scope.upvotes = 0;
	 $scope.serverupvotes = 0;
	 $scope.increase = function(){
	 	$scope.upvotes = $scope.upvotes + 1;
         };
          mypostService.postFooOldSchool(function(postData, data) {
                
         });
         myService.getFooOldSchool(function(data) {
                $scope.result = data;
         });
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
      <h2>{{result.result}}</h2>
    </div>
  </body>
</html>
