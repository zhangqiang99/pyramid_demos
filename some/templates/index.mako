<!doctype html>
<html ng-app="project" ng-init="users=${users};;">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular-resource.min.js">
    </script>
    
  </head>
  <body>
    <div >
      <div data-ng-repeat="user in users">
	<h2>{{user}}</h2>
      </div>
    </div>
  </body>
</html>
