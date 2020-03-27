# Shiv Windows Docker Images

Shiv is a wrapper around zipapp to package applications for easier
distribution.

- zippapp https://docs.python.org/3/library/zipapp.html
- shiv https://github.com/linkedin/shiv

With this docker image it is now possible to create a zippapp for windows on
linux by using wine. There is no compiler currently included so we depend on
wheels or pure python applications.

## Usage

Build for linux:

```
$ cd example/app
$ pip install shiv
$ shiv . -e app.__main__:cli -o app.pyz
$ ./app.pyz
```

Build for windows:

```
$ cd example/app
$ docker run -v "$(pwd):/src/" delijati/shiv64 "shiv . -e app.__main__:cli -o app.pyz"
```

This will create a `app.pyz` that has all dependencies added in a zip.

To run it 

```
# copy to windows
# you need to specify the interpreter the version should be the same
$ python app.pyz
```

### Add python interpreter

To have all in one place it is also possible to add the python interpreter.

```
$ PYTHON_VERSION=3.6.8
$ wget https://www.python.org/ftp/python/$PYTHON_VERSION/python-$PYTHON_VERSION-embed-amd64.zip
$ unzip python-$PYTHON_VERSION-embed-amd64.zip -d python
$ rm python-$PYTHON_VERSION-embed-amd64.zip
$ vim run.bat
ECHO Starting app.pyz
ECHO To stop press CTRL+PAUSE
python\python.exe app.pyz run
```

Have a look into the `example` app.

### Is it possible to use a package mirror?

Yes, by supplying the `PYPI_URL` and `PYPI_INDEX_URL` environment variables that point to your PyPi mirror.

## Known Issues

Some packages seam to not work well in zippapp pandas==1.0.3 has import errors
but pandas==1.0.1 work.

## History

#### [1.1] - 2020-03-27
- Added NSIS installer
- Added NSIS installer to example app

#### [1.0] - 2020-03-14
- Initial release


## License

MIT

## Thanks

Thanks to https://github.com/cdrx/docker-pyinstaller that i used as template.
