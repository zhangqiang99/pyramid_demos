<!doctype html>
<html ng-app="docsIsoFnBindExample">
  <head>
    <script src="http://code.angularjs.org/1.2.3/angular.min.js"></script>
    <script type="text/javascript">
      angular.module('docsIsoFnBindExample', [])
  .controller('Ctrl', function($scope, $timeout) {
    $scope.name = 'Tobias';
    $scope.hideDialog = function () {
      $scope.dialogIsHidden = true;
      $timeout(function () {
        $scope.dialogIsHidden = false;
      }, None);
    };
  })
  .directive('myDialog', function() {
    return {
      restrict: 'E',
      transclude: true,
      scope: {
        'close': '&onClose'
      },
      templateUrl: 'my-dialog-close.html'
    };
  });
    </script>
    <script type="text/ng-template" id="my-dialog-close.html">
    <div class="alert">
  <a href class="close" ng-click="close()">&times;</a>
  <div ng-transclude></div>
</div>
  </script>
  </head>
  <body>
    <div ng-controller="Ctrl">
      <my-dialog ng-hide="dialogIsHidden" on-close="hideDialog()">
        Check out the contents, {{name}}!
      </my-dialog>
    </div>
  </body>
</html>

