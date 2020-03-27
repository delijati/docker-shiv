# Example app

## Build for linux
```
$ pip install shiv
$ shiv . -e app.__main__:cli -o app.pyz
$ python app.pyz  run
$ # or app.pyz run
```

## Build for windows

```
$ ./build.sh
```

Test on linux with wine:

```
$ wine installer.exe
$ wine cmd /c ~/.wine/drive_c/app/start.bat
```
