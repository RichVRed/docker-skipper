## Skipper
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/skipper.svg)](https://hub.docker.com/r/rvannauker/skipper/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/skipper.svg)](https://hub.docker.com/r/rvannauker/skipper/) [![](https://images.microbadger.com/badges/image/rvannauker/skipper:latest.svg)](https://microbadger.com/images/rvannauker/skipper:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-skipper.svg)](https://github.com/RichVRed/docker-skipper) [![license](https://img.shields.io/github/license/RichVRed/docker-skipper.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run skipper

### Installation / Usage
1. Install the rvannauker/skipper container:
```bash
docker pull rvannauker/skipper
```
2. Run skipper through the skipper container:
```bash
docker run --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume $(pwd):/workspace --name="skipper" "rvannauker/skipper"
```

### Download the source:
To run, test and develop the Skipper Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-skipper.git
```
2. Build the container:
```bash
docker build --force-rm --tag "rvannauker/skipper" --file skipper.dockerfile .
```
3. Test running the container:
```bash
docker run --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume $(pwd):/workspace --name="skipper" "rvannauker/skipper"
```
