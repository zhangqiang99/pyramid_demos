<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Projector</title>
    <link rel="stylesheet" href="/deform_static/css/form.css"
          type="text/css"
            />
    <script type="text/javascript"
            src="/deform_static/scripts/jquery-2.0.3.min.js"></script>
    <script type="text/javascript"
            src="/deform_static/scripts/deform.js"></script>
</head>
<body>
<h2>Hello Form</h2>

% for field in form:
        ${field.serialize()}
% endfor


</body>
</html>
