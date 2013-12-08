<!doctype html>
<html ng-app="posting">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular.min.js"></script>
       <script src="http://code.angularjs.org/1.2.1/angular-sanitize.min.js"></script>
<script>
var app = angular.module('posting',['ngSanitize']);
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
                var x = $scope.upvotes;
                var postObject = {'result': x};
                $http.post('/angularresult', JSON.stringify(postObject)).success(function(data){
                });
                $http.get('/angularresult').success(function(data){
                    $scope.result1 = data;
                });
                
                
         };
         $scope.addhtml = function(){
                $scope.customHtml = $scope.yourName;
	 
         };
         $scope.tabs = [
               {title:'Home', page: '/form1'},
               {title:'Profile', page: '/ajax1'},
         ];
         myService.getFooOldSchool(function(data) {
                $scope.result1 = data;
         });
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
      <button ng-click="increase()">{{upvotes}}Upvote</button>

      <button ng-click="addhtml()">Add</button>
      <hr>
      <h1>Hello {{yourName}}!</h1>
      <h2>{{upvotes}}</h2><h2>{{serverupvotes}}</h2>
      <h2>{{result.result}}</h2>
      <h2>{{result1.result}}</h2>
      <div ng-bind-html="customHtml">{{customHtml}}</div>
        <div ng-include src="tabs[tabs.activeTab].page"></div>

    </div>
  </body>
</html>
