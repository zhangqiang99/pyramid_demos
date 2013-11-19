<!doctype html>
<html >
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular.min.js"></script>
       <script src="http://code.angularjs.org/1.2.1/angular-sanitize.min.js"></script>
<script>
var app = angular.module('myApp', []);

app.factory('items', function() {
    var items = [];
    var itemsService = {};
    
    itemsService.add = function(item) {
        items.push(item);
    };
    itemsService.list = function() {
        return items;
    };
    
    return itemsService;
});

function Ctrl1($scope,items) {
    $scope.list = items.list; 
}

function Ctrl2($scope, items) {
    $scope.add = items.add;
}
function Ctrl3($scope) {
}

</script>
  </head>
  <body ng-app="myApp">
   <div ng-controller="Ctrl1">
    <h2>Ctrl1 - List</h2>
    <ul>
        <li ng-repeat="item in list()">{{item}}</li>
    </ul>
</div>
<hr />
<div ng-controller="Ctrl2">
    <h2>Ctrl2 - Add</h2>
    <form ng-submit="add(newItem); newItem = '';">
        <input type="text" placeholder="new item..." ng-model="newItem">
        <br />
	<p>{{newItem}}</p>
        <input class="btn" type="submit">
    </form>
</div>
<div ng-controller="Ctrl2">
    <h2>Ctrl2 - Add</h2>
    <form ng-submit="add(newItem); newItem = '';">
        <input type="text" placeholder="new item..." ng-model="newItem">
        <br />
         <p>{{newItem}}</p>
        <input class="btn" type="submit">
    </form>
</div>
<div ng-controller="Ctrl3">
<input type="text" ng-model="data.message">
  <h1>{{data.message + " world"}}</h1>
</div>
<div ng-controller="Ctrl3">
<input type="text" ng-model="data.message">
  <h1>{{data.message + " world"}}</h1>
</div>

  </body>
</html>
