<!DOCTYPE>
<html ng-app="project">
<head>
  <title>The Pyramid Web Framework</title>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular-resource.min.js">
    </script>
    <script>
	function DeathrayMenuController($scope) {
		 $scope.menuState = true;
		 $scope.toggleMenu = function() {
		 $scope.menuState = !$scope.menuState;
	};
   	}
	
    </script>
</head>
<body>
<div ng-controller='DeathrayMenuController'>
     <button ng-click='toggleMenu()'>Toggle Menu</button>
     <ul ng-show='menuState'>
     	 <li ng-click=''>Stun</li>
	 <li ng-click=''>Disintegrate</li>
	 <li ng-click=''>Erase from history</li>
     </ul>
<div/>
</body>
</html>
