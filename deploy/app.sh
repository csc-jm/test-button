#!/bin/bash

THE_HOST=${HOST:="0.0.0.0"}
THE_PORT=${PORT:="5430"}

echo 'Start test-button Python API Web Server'
exec gunicorn test_button.server:init --bind $THE_HOST:$THE_PORT --worker-class aiohttp.GunicornUVLoopWebWorker --workers 4
