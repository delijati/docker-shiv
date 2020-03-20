from setuptools import find_packages
from setuptools import setup


setup(
    entry_points="""
        [console_scripts]
        app=app.__main__:cli
    """,
    install_requires=["waitress", "pyramid", "click", "pandas==1.0.1"],
    name="app",
    packages=find_packages(),
    setup_requires="setuptools",
    version="0.1",
)
