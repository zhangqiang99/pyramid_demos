<!doctype html>
<html ng-app="">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular.min.js"></script>
     <script src="http://code.angularjs.org/1.2.1/angular-sanitize.min.js"></script>
<script>

function Ctrl($scope) {
  $scope.templates =
    [ { name: 'template1.html', url: '/form1'}
    , { name: 'template2.html', url: '/ajax1'} ];
  $scope.template = $scope.templates[0];
}
function Ctrl1($scope) {
  $scope.load = function(){
       $scope.template = '/form1'
  };
 
}

</script>
<style>
.slide-animate-container {
  position:relative;
  background:white;
  border:1px solid black;
  height:100px;
  overflow:hidden;
}
 
.slide-animate {
  padding:10px;
}
 
.slide-animate.ng-enter, .slide-animate.ng-leave {
  -webkit-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
  transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
 
  position:absolute;
  top:0;
  left:0;
  right:0;
  bottom:0;
  display:block;
  padding:10px;
}
 
.slide-animate.ng-enter {
  top:-50px;
}
.slide-animate.ng-enter.ng-enter-active {
  top:0;
}
 
.slide-animate.ng-leave {
  top:0;
}
.slide-animate.ng-leave.ng-leave-active {
  top:50px;
}
</style>
  </head>
  <body>
<div ng-controller="Ctrl">
      <select ng-model="template" ng-options="t.name for t in templates">
       <option value="">(blank)</option>
      </select>
      url of the template: <tt>{{template.url}}</tt>
      <hr/>
      <div class="slide-animate-container">
        <div class="slide-animate" ng-include="template.url"></div>
      </div>
    </div>
<script type="text/ng-template" id="template1.html">
    <div>loaded home</div>
</script>
  <script type="text/ng-template" id="template2.html">
    <div>loaded home 2</div>
</script>
<div ng-controller="Ctrl1">
<button ng-click="load()">CLick here</button>
<div>
     <div ng-include="template"></div>
</div>
</div>
<div ng-controller="Ctrl1">
<button ng-click="load()">CLick here</button>
<div>
     <div ng-include="template"></div>
</div>
</div>
  </body>
</html>
