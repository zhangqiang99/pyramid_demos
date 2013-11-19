<!doctype html>
<html ng-app="posting">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular.min.js"></script>
       <script src="http://code.angularjs.org/1.2.1/angular-sanitize.min.js"></script>
<script>
var app = angular.module('posting',['ngSanitize']);

app.controller('StartUpController', function($scope, $http, myService, mypostService) {

});

</script>
  </head>
  <body>
    <div ng-controller="StartUpController" >
    </div> 
      
  </body>
</html>
