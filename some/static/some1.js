$(document).ready(function() {
  $('.example-countries .typeahead').typeahead({
    name: 'countries',
    prefetch: '/static/zippy.json'
   });  
})