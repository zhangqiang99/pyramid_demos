from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
    DBSession,
    Base,
    )


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(settings=settings)
    config.include('pyramid_chameleon')
    config.include('pyramid_mako')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('mark1', '/mark1')
    config.add_route('version', '/version')
    config.add_route('ajax1', '/ajax1')
    config.add_route('zippy', '/zippy')
    config.add_route('zippy1', '/zippy1')
    config.add_route('angular_tags', '/angular_tags')
    config.add_route('angular', '/angular')
    config.add_route('reboot', '/reboot')
    config.add_route('test-angular', '/test-angular')
    config.add_route('angularresult', '/angularresult')
    config.add_route('list', '/list')
    config.add_route('edit', '/edit/{projectId}')
    config.add_route('new', '/new')
    config.add_route('ajax2', '/ajax2')
    config.add_route('ajax3', '/ajax3.json')
    config.add_route('updates', '/updates.json')
    config.add_route('servertime', '/servertime')
    config.add_route('ajaxtest', '/ajaxtest/{mine}')
    config.add_route('comment', '/comment/{mine}')
    config.add_route('single_file_upload', '/single_file_upload')
    config.add_route('multiple_file_upload', '/multiple_file_upload')
    config.add_route('follow', '/follow')
    config.add_route('form1', '/form1')
    config.add_route('todo', '/todo')
    config.add_route('project', '/project')
    config.add_route('form2', '/form2')
    config.add_route('search1', '/search1.json')
    config.add_route('check1', '/check1')
    config.scan()
    return config.make_wsgi_app()
