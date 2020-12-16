docker build -t shiv -f Dockerfile-py3-win64 .
docker tag 0e5574283393 delijati/shiv64:2.0
docker push delijati/shiv64:2.0
docker login
