#!/usr/bin/env puma

APP_ROOT = "/home/ivan_yakunin/shop"

# The directory to operate out of.
#
# The default is the current directory.
#
directory File.join(APP_ROOT, "current")

# Use an object or block as the rack application. This allows the
# config file to be the application itself.
#
# app do |env|
#   puts env
#
#   body = 'Hello, World!'
#
#   [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
# end

# Load “path” as a rackup file.
#
# The default is “config.ru”.
#
rackup DefaultRackup

# Set the environment in which the rack's app will run. The value must be a string.
#
# The default is “development”.
#
environment "production"

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
#
# The default is “false”.
#
# daemonize
# daemonize false

# Store the pid of the server in the file at “path”.
#
pidfile File.join(APP_ROOT, "shared/tmp/pids/puma.pid")

# Use “path” as the file to store the server info state. This is
# used by “pumactl” to query and control the server.
#
state_path File.join(APP_ROOT, "shared/tmp/pids/puma.state")

# Redirect STDOUT and STDERR to files specified. The 3rd parameter
# (“append”) specifies whether the output is appended, the default is
# “false”.
#
# stdout_redirect '/u/apps/lolcat/log/stdout', '/u/apps/lolcat/log/stderr'
stdout_redirect File.join(APP_ROOT, "shared/log/puma-stdout.log"),
                File.join(APP_ROOT, "shared/log/puma-stderr.log"),
                true

# Disable request logging.
#
# The default is “false”.
#
# quiet

# Configure “min” to be the minimum number of threads to use to answer
# requests and “max” the maximum.
#
# The default is “0, 16”.
#
threads 0, 8

# Bind the server to “url”. “tcp://”, “unix://” and “ssl://” are the only
# accepted protocols.
#
# The default is “tcp://0.0.0.0:9292”.
#
# bind 'tcp://0.0.0.0:9292'
bind "unix://#{APP_ROOT}/shared/tmp/sockets/puma.sock"
# bind 'unix:///var/run/puma.sock?umask=0111'
# bind 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'

# Instead of “bind 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'” you
# can also use the “ssl_bind” option.
#
# ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

# Code to run before doing a restart. This code should
# close log files, database connections, etc.
#
# This can be called multiple times to add code each time.
#
# on_restart do
#   puts 'On restart...'
# end

# Command to use to restart puma. This should be just how to
# load puma itself (ie. 'ruby -Ilib bin/puma'), not the arguments
# to puma, as those are the same as the original process.
#
# restart_command '/u/app/lolcat/bin/restart_puma'

# === Cluster mode ===

# How many worker processes to run.
#
# The default is “0”.
#
workers 2

# Code to run when a worker boots to setup the process before booting
# the app.
#
# This can be called multiple times to add hooks.
#
# on_worker_boot do
# end

# Code to run when a worker boots to setup the process after booting
# the app.
#
# This can be called multiple times to add hooks.
#
# after_worker_boot do
#   puts 'On worker boot...'
# end

# Code to run when a worker shutdown.
#
#
# on_worker_shutdown do
#   puts 'On worker boot...'
# end

# Allow workers to reload bundler context when master process is issued
# a USR1 signal. This allows proper reloading of gems while the master
# is preserved across a phased-restart. (incompatible with preload_app)
# (off by default)

prune_bundler

# Preload the application before starting the workers; this conflicts with
# phased restart feature. (off by default)

# preload_app!

# Additional text to display in process listing
#
tag "shop"

# Change the default timeout of workers
#
# worker_timeout 60

# === Puma control rack application ===
