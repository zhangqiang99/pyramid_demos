<!doctype html>
<html>
  <head>
    <style type="text/css" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"></style>
    <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <style type="text/css" src="//code.jquery.com/jquery-1.10.2.min.js"></style>
    <script type="text/javascript">

$(document).ready(function() {
  $('.example-countries .typeahead').typeahead({
    name: 'countries',
    local: [                                                                    
    "India",
    "japan",
    "korea",

  ]   
    limit: 10
  });

  $('.example-twitter-oss .typeahead').typeahead({
    name: 'twitter-oss',
    prefetch: '../data/repos.json',
    template: [
      '<p class="repo-language">{{language}}</p>',
      '<p class="repo-name">{{name}}</p>',
      '<p class="repo-description">{{description}}</p>'
    ].join(''),
    engine: Hogan
  });

  $('.example-arabic .typeahead').typeahead({
    name: 'arabic',
    local: [
      "Ø§Ù„Ø¥Ù†Ø¬Ù„ÙŠØ²ÙŠØ©",
      "Ù†Ø¹Ù…",
      "Ù„Ø§",
      "Ù…Ø±Ø­Ø¨Ø§",
      "Ú©ÙŠÙ Ø§Ù„Ø­Ø§Ù„ØŸ",
      "Ø£Ù‡Ù„Ø§",
      "Ù…Ø¹ Ø§Ù„Ø³Ù„Ø§Ù…Ø©",
      "Ù„Ø§ Ø£ØªÙƒÙ„Ù… Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©",
      "Ù„Ø§ Ø£ÙÙ‡Ù…",
      "Ø£Ù†Ø§ Ø¬Ø§Ø¦Ø¹"
    ]
  });

  $('.example-sports .typeahead').typeahead([
    {
      name: 'nba-teams',
      prefetch: '../data/nba.json',
      header: '<h3 class="league-name">NBA Teams</h3>'
    },
    {
      name: 'nhl-teams',
      prefetch: '../data/nhl.json',
      header: '<h3 class="league-name">NHL Teams</h3>'
    }
  ]);

  $('.example-films .typeahead').typeahead([
    {
      name: 'best-picture-winners',
      remote: '../data/films/queries/%QUERY.json',
      prefetch: '../data/films/post_1960.json',
      template: '<p><strong>{{value}}</strong> â€“ {{year}}</p>',
      engine: Hogan
    }
  ]);
});
</script>
    <script type="text/javascript" src="/static/typeahead.js/typeahead.js"></script>
   </head>
  <body>
  <div class="example example-countries">
        <h2 class="example-name">Countries</h2>
        <p class="example-description">Prefetches data, stores it in localStorage, and searches it on the client</p>

        <div class="demo">
          <input class="typeahead" type="text" placeholder="countries">
        </div>

      </div>
    
  </body>
</html>

