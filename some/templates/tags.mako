<!doctype html>
<html ng-app="myApp">
  <head>
    <style type="text/css" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"></style>
    <style type="text/css">
    .tags {
    margin: 10px 0;
}
.tags .tag {
    border-radius: 6px;
    background-color: #EFEFEF;
    border: 1px solid #DDD;
    padding: 5px;
    margin-right: 10px;
}
.tags .tag:hover {
    color: red;
    text-decoration: none;
}

input { 
    margin-bottom: 0px !important;
}

    </style>
    <script src="http://code.angularjs.org/1.0.3/angular.js"></script>
    <script type="text/javascript">
    var app = angular.module('myApp',[]);

app.directive('tagManager', function() {
    return {
        restrict: 'E',
        scope: { tags: '=' },
        template:
            '<div class="tags">' +
                '<span ng-repeat="(idx, tag) in tags" class="tag" >{{tag}}<a ng-click="remove(idx)"> X</a></span>' +
            '</div>' +
            '<input type="text" placeholder="Add a tag..." ng-model="new_value"></input> ' +
            '<a class="btn" ng-click="add()">Add</a>',
        link: function ( $scope, $element ) {
            // FIXME: this is lazy and error-prone
            var input = angular.element( $element.children()[1] );
            
            // This adds the new tag to the tags array
            $scope.add = function() {
                $scope.tags.push( $scope.new_value );
                $scope.new_value = "";
            };
            
            // This is the ng-click handler to remove an item
            $scope.remove = function ( idx ) {
                $scope.tags.splice( idx, 1 );
            };
            
            // Capture all keypresses
            input.bind( 'keypress', function ( event ) {
                // But we only care when Enter was pressed
                if ( event.keyCode == 13 ) {
                    // There's probably a better way to handle this...
                    $scope.$apply( $scope.add );
                }
            });
        }
    };
});

app.controller('MainCtrl', function ( $scope ) {
    $scope.tags = [ 'cool', 'awesome', 'angular', 'directive', 'javascript', 'html' ];
});
    </script>
  </head>
  <body>
    <div ng-controller="MainCtrl">
    <tag-manager tags="tags"></tag-manager>

    <h3>Current Tags</h3>    
    <ul>
        <li ng-repeat="tag in tags">{{tag}}</li>
    </ul>
</div>
  </body>
</html>
