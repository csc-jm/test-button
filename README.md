## Test Button

A test web application built with [aiohttp](http://aiohttp.readthedocs.io/) on Python 3.8.

### Install and Run

Installation can be done:
* Github - without cloning
```
$ pip install git+url
```
* cloning repository:
```
$ git clone git@ssh_url
$ cd test-button
$ pip install .
```

After install the application can be started like: `$ test-button`

#### Tests and Documentation

In order to run the tests: `$ tox` in the root directory of the git project.

### Build and Deployment

build and run using `docker`:
```
docker build -t test-button .
docker run -p 5430:5430 test-button
```
