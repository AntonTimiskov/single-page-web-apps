#coding: utf-8

import os, cherrypy, random, json
from functools import wraps
from cherrypy.lib.static import serve_file

statuses = ['New', 'In progress', 'Failed', 'Complete']

def as_json(func):
    @wraps(func)
    def wrapper(*args,**kwargs):
        return json.dumps(func(*args,**kwargs))
    return wrapper

class SampleServer(object):

    @cherrypy.expose
    def index(self, name='index'):
        return serve_file(
            os.path.join(current_dir, '%s.html' % name),
            content_type='text/html'
        )

    @cherrypy.expose
    @as_json
    def mailboxes(self):
        result = []
        i = 0
        for status in statuses:
            result.append({'id': i, 'status':status,'value':random.randint(0,100)})
            i += 1
        return result

if __name__ == '__main__':
    current_dir = os.path.dirname(os.path.abspath(__file__))

    cherrypy.config.update({'environment': 'production',
                            'log.error_file': 'debug.log',
                            'log.screen': True,
                            'server.socket_host': '10.30.35.153',
                            'server.socket_port': 8080
                          })

    conf = {'/static': {
                    'tools.staticdir.on': True,
                    'tools.staticdir.dir': os.path.join(current_dir, 'static'),
                 }
           }

    cherrypy.quickstart(SampleServer(), '/', config=conf)

