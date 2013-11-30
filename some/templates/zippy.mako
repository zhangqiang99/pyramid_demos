<!doctype html>
<html ng-app="docsIsoFnBindExample">
  <head>
    <script src="http://code.angularjs.org/1.2.3/angular.min.js"></script>
    <script type="text/javascript">
  angular.module('docsIsoFnBindExample', [])
  .controller('Ctrl', function($scope) {
           $scope.open = function(){
                 return {
                 restrict: 'E',
                 transclude: true,
                 templateUrl: '/form1'
    };
  }
  })
  .directive('myDialog', function() {
    return {
      restrict: 'E',
      transclude: true,
      templateUrl: '/form1'
    };
  });
    </script>
  </head>
  <body>
    <div ng-controller="Ctrl">
      <button ng-click="open()">Open</button>
      <div >{{temple}}</div>
      <my-dialog>
      </my-dialog>
    </div>
  </body>
</html>

