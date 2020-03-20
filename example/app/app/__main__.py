import click
from waitress import serve

from app.server import create_app


@click.group()
def cli():
    pass


@cli.command()
def run():
    serve(create_app())
