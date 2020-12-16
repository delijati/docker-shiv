#!/bin/bash
PYTHON_VERSION=3.8.6

rm app.pyz
rm installer.exe
docker run -v "$(pwd):/src/" delijati/shiv64 "shiv . -e app.__main__:cli -o app.pyz && chown -R --reference=. app.pyz"
if [ ! -f "python-$PYTHON_VERSION-embed-amd64.zip" ]; then
   wget https://www.python.org/ftp/python/$PYTHON_VERSION/python-$PYTHON_VERSION-embed-amd64.zip
   unzip python-$PYTHON_VERSION-embed-amd64.zip -d python
fi
docker run -v "$(pwd):/src/" delijati/shiv64 "makensis installer.nsh && chown -R --reference=. installer.exe"
