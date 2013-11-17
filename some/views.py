from pyramid.response import Response
from pyramid.view import view_config
from datetime import datetime
from sqlalchemy.exc import DBAPIError
import os
import shutil
import json
from pyramid.httpexceptions import HTTPFound

from .models import (
    DBSession,
    MyModel,
    )
from .diff_match_patch import diff_match_patch

import difflib
import cgi
form = cgi.FieldStorage()

@view_config(route_name='home', renderer='templates/mytemplate.pt')
def my_view(request):
    try:
        one = DBSession.query(MyModel).filter(MyModel.name == 'one').first()
    except DBAPIError:
        return Response(conn_err_msg, content_type='text/plain', status_int=500)
    return {'one': one, 'project': 'some'}

conn_err_msg = """\
Pyramid is having a problem using your SQL database.  The problem
might be caused by one of the following things:

1.  You may need to run the "initialize_some_db" script
    to initialize your database tables.  Check your virtual 
    environment's "bin" directory for this script and try to run it.

2.  Your database server may not be running.  Check that the
    database server referred to by the "sqlalchemy.url" setting in
    your "development.ini" file is running.

After you fix the problem, please restart the Pyramid application to
try it again.
"""

@view_config(route_name='mark1', renderer="mark1.mako")
def mark1(request):
    title = ""
    return {
        "title": title
        }

@view_config(route_name='ajax1', renderer="ajax1.mako")
def ajax1(request):
    title = ""
    return {
        'title' : title
        }

@view_config(route_name='list', renderer="list.mako")
def list(request):
    return {
        }

@view_config(route_name='new', renderer="detail.mako")
def new(request):
    return {
        }

@view_config(route_name='edit',renderer="detail.mako" )
def edit(request):
    projectId = request.matchdict['project_id']
    return {
        'projectId': projectId
        }


@view_config(route_name='todo', renderer="todo.mako")
def todo(request):
    return {
        }

@view_config(route_name='angular', renderer="angular.mako")
def angular(request):
    return {
        }

class Friends:
    def __init__(self,name,phone,tag):
        self.name = name
        self.phone = phone
        self.tag = tag

class MyEncoder(json.JSONEncoder):
    def default(self, obj):
        if not isinstance(obj, Friends):
            return super(MyEncoder, self).default(obj)

        return obj.__dict__

@view_config(route_name='project', renderer="index.mako")
def project(request):
    users = ["mahesh", "hari"]
    a = Friends(name='John', phone='555-1276', tag="Physics")
    b = Friends(name='Mahesh', phone='55', tag="Maths")
    friends = [a,b]
    return {
        'friends': json.dumps(users),
        'users': json.dumps(friends,cls=MyEncoder),
        }

x = 0
@view_config(route_name='ajax2', request_method="POST", renderer="json")
def ajax2(request):
    postContent = request.POST['post-form']
    print(postContent)
    x = postContent

@view_config(route_name='ajax3', renderer="json")
def ajax3(request):
    print("Mahesh")
    return [
        "maheshlll"
        ]

@view_config(route_name='updates',renderer="json")
def updates(request):
    return [
        "mahesh",
        "asoke",
        ]

@view_config(route_name='check1', renderer="check1.mako")
def check1(request):
    cases=[['afrykanerskojzyczni', 'nieafrykanerskojzyczni']]
    diffs = []
    for a,b in cases:
        print('{} => {}'.format(a,b))  
        for i,s in enumerate(difflib.ndiff(a, b)):
            if s[0]==' ': continue
            elif s[0]=='-':
                print(u'Delete "{}" from position {}'.format(s[-1],i))
            elif s[0]=='+':
                print(u'Add "{}" to position {}'.format(s[-1],i))    
        print()
    if request.method == "POST":
        t = request.POST.get('chk1', '')
        y = request.POST.get('chk2', '')
        if t == "on":
            print(3)
        if y == "on":
            print(4)
    return {
        'cases': cases,
        }

@view_config(route_name='form1', renderer="form1.mako")
def form1(request):
    title = ""
    some = ""
    items = ['a','b','b','c']
    if request.method == "POST":
        some = request.POST['some']
    return {
        'title': title,
        'items': items,
        'some': some,
        }

@view_config(route_name='form2', renderer="json")
def form2(request):
    c = request.POST['post-sub']
    return [
        c
        ]

@view_config(route_name='search1', renderer="json")
def search1(request):
    return [
        {
            'name': 'planets',
            'local': [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune" ]
            }
        ]
    
@view_config(name='updates.json', renderer="json")
def updates_view(request):
    title = ""
    return [1,2,3,4,5]

@view_config(route_name="servertime", renderer='string')
def serverTime(request):
    return datetime.now()

@view_config(route_name="ajaxtest", renderer='string')
def ajaxtest(request):
    t = request.matchdict['mine']
    t = t + "mahesh"
    return t

@view_config(route_name="comment", renderer='string')
def comment(request):
    t = request.matchdict['mine']
    return t

@view_config(route_name="filetest", renderer='mark2.mako')
def filetest(request):
    if request.method == "POST":
        here = os.path.dirname(os.path.abspath(__file__))
        upload_directory = os.path.join(here, 'uploads')
        print(upload_directory)
        my_filename = request.POST['fileupload'].filename
        my_file = request.POST['fileupload'].file
        f = my_file.read()
        print(len(f))
        if len(f)> 500:
            print("this is too big")
        print(my_file)
        saved_file = str(upload_directory) +'/'+ str(my_filename)
        print(saved_file)
        perm_file = open(saved_file, 'wb')
        print("me")
        shutil.copyfileobj(my_file, perm_file)
        print("me")
        my_file.close()
        print("me")
        perm_file.close()
        print("me")
        url = request.route_url('mark1')
        print("me")
        return HTTPFound(location= url)
    return {}

@view_config(route_name="filetest1", renderer='mark3.mako')
def filetest1(request):
    if request.method == "POST":
        here = os.path.dirname(os.path.abspath(__file__))
        upload_directory = os.path.join(here, 'uploads')
        uploaded_files = request.POST.getall("fileupload")
        print(uploaded_files)
        for item in uploaded_files:
            print(item.filename)
            my_file = item.file
            saved_file = str(upload_directory) +'/'+ str(item.filename)
            perm_file = open(saved_file, 'wb')
            shutil.copyfileobj(my_file, perm_file)
            my_file.close()
            perm_file.close()                    
        url = request.route_url('mark1')
        print("me")
        return HTTPFound(location= url)
    return {}

