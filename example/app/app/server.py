from pyramid.config import Configurator
from pyramid.response import Response
import pandas as pd
import numpy as np


def hello_world(request):
    df = pd.DataFrame({'a': np.arange(10), 'b': np.random.randn(10)})
    return Response(df.to_html())


def create_app():
    with Configurator() as config:
        config.add_route('hello', '/')
        config.add_view(hello_world, route_name='hello')
        app = config.make_wsgi_app()
    return app
