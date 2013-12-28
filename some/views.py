from pyramid.response import Response
from pyramid.view import view_config
from datetime import datetime
from sqlalchemy.exc import DBAPIError
import os
import shutil
import json
from pyramid.httpexceptions import HTTPFound

import some.merge_in_memory as mim_module

#str1 = """line 1
#line 2"""
#str2 = """line 1
#line 2 changed"""



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
    
    return {'one': "one", 'project': 'some'}

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

@view_config(route_name="single_file_upload", renderer='single_file_upload.mako')
def single_file_upload(request):
    """View for demonstrating single file upload
    """
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
        shutil.copyfileobj(my_file, perm_file)
        my_file.close()
        perm_file.close()
        url = request.route_url('mark1')
        return HTTPFound(location= url)
    return {}

@view_config(route_name="multiple_file_upload", renderer='multiple_file_upload.mako')
def multiple_file_upload(request):
    """View demonstrating multiple file uploads
    """
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


@view_config(route_name='mark1', renderer="mark1.mako")
def mark1(request):
    title = ""
    return {
        "title": title
        }

@view_config(route_name='zippy', renderer="zippy.mako")
def zippy(request):
    return {
        }

@view_config(route_name='zippy1', renderer="zippy1.mako")
def zippy1(request):
    return {
        }

@view_config(route_name='version', renderer="version.mako")
def version(request):
    ver1 = """<p>i love it</p>"""
    ver2 = """<p>i love me</p>"""
    ver3 = """<p>i love you jhsd</p>"""
    import some.diff_match_patch as diff_match_patch
    dmp = diff_match_patch.diff_match_patch()
    dmp.Diff_Timeout = 0
    diffs = dmp.diff_main(ver1, ver3)
    print(diffs)
    diff1 = dmp.diff_prettyHtml(diffs)
    print(diff1)
    diff2 = dmp.patch_make(ver1, ver2)
    diff3 = dmp.patch_make(ver2, ver3)
    diff5 = dmp.patch_make(ver3, ver2)
    print(diff5)
    print(diff2)
    patch_text = dmp.patch_toText(diff2)
    patch1 = dmp.patch_fromText(patch_text)
    print(patch_text)
    diff = dmp.patch_apply(patch1, ver1)
    diff4 = dmp.patch_apply(diff5, ver3)
    print(diff[0])
    return {
        "ver1": ver1,
        "ver2": ver2,
        "diff": diff,
        "diff1": diff1,
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

@view_config(route_name='angular_tags', renderer="angular_tags.mako")
def angular_tags(request):
    """View demonstrating angular way of addition and deletion
    of tags using ajax techniques
    """
    return {
        }

@view_config(route_name='test-angular', renderer="test-angular.mako")
def test_angular(request):
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

@view_config(route_name='reboot', renderer="reboot.mako")
def reboot(request):
    return {
        }

@view_config(route_name='angular', renderer="angular.mako")
def angular(request):
    result = 20
    return {
            'result': json.dumps(result)
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

z = 0
@view_config(route_name='angularresult',  renderer="json")
def angularresult(request):
    global z
    result = z
    if request.method == "POST":
        t = request.json_body
        print(t)
        print(t['result'])
        print(result)
        result = int(t['result'])
        print(result)
        z = result
    return {
        'result': json.dumps(result)
        }

@view_config(route_name='ajax3', renderer="json")
def ajax3(request):
    print("Mahesh")
    return [
        "maheshlll"
        ]

@view_config(route_name='updates',renderer="json")
def updates(request):
    return ["Bachelor of Science","Bachelor of Science in Accounting","Bachelor of Science in Business","Bachelor of Science in Business\/Accounting","Bachelor of Science in Business\/Administration","Bachelor of Science in Business\/Communications","Bachelor of Science in Business\/e-Business","Bachelor of Science in Business\/Finance","Bachelor of Science in Business\/Global Business Management","Bachelor of Science in Business\/Green and Sustainable","Bachelor of Science in Business\/Green and Sustainable Enterprise Management","Bachelor of Science in Business\/Hospitality Management","Bachelor of Science in Business\/Human Resource Management"]
    

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
    """Function returning the time
    """
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

