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
$ pip install shiv
$ shiv . -e app.__main__:cli -o app.pyz
$ ./app.pyz
```

Build for windows:

```
$ docker run -v "$(pwd):/src/" shiv "shiv . -e app.__main__:cli -o app.pyz"
```

This will create a `app.pyz` that has all dependencies added in a zip.

To run it 

```
# copy to windows
# you need to specify the interpreter the version should be the same
$ python app.pyz
```

### Is it possible to use a package mirror?

Yes, by supplying the `PYPI_URL` and `PYPI_INDEX_URL` environment variables that point to your PyPi mirror.

## Known Issues

Some packages seam to not work well in zippapp pandas==1.0.3 has import errors
but pandas==1.0.1 work.

## History

#### [1.0] - 2020-03-14
Initial release


## License

MIT

## Thanks

Thanks to https://github.com/cdrx/docker-pyinstaller that i used as template.
