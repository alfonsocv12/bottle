#!/usr/bin/env bash
set -e
set -x

# Test utilities
pip install -U pip pytest coverage

# Test dependencies (Server back-ends and template engines)
sudo apt-get install -y libev-dev
pip install mako jinja2

for name in waitress "cherrypy<9" cheroot paste tornado twisted diesel meinheld\
            gunicorn eventlet flup fapws3 rocket bjoern gevent uvloop; do
    pip install $name || echo "Failed to install $name with $(python -V)" 1>&2
done
