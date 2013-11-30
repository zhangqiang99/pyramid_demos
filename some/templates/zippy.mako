<!doctype html>
<html ng-app="docsIsoFnBindExample">
  <head>
    <script src="http://code.angularjs.org/1.2.3/angular.min.js"></script>
    <script type="text/javascript">
  angular.module('docsIsoFnBindExample', [])
  .controller('Ctrl', function($scope, $timeout) {
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
      <my-dialog>
      </my-dialog>
    </div>
  </body>
</html>

