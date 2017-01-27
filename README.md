Kubernetes Filebeat Container
------------------------------------------------------------------------------

This is a simple container which just runs bash and has a bunch of useful
shell tools.

Configuration
==============================================================================

Two environment variables are required:

* LOGSTASH_HOST
* LOGSTASH_PORT (defaults to 5044)


Running the Container
==============================================================================

### Processing container logs

By default, with no arguments, the config file `config/containers.yml` will be
used, and the logs for all containers running on the host will be sent to your
Logstash service.

You should mount these volumes into this container:

* /var/log
* /var/lib/docker/containers

A sample Kubernetes DaemonSet configuration is included in the `examples/kubernetes`
directory.  Run this the usual way:
`kubectl create -f examples/kubernetes/filebeat.yml`.


### Processing CoreOS journald logs

The second way to run this container is with command-line arugments to activate
the `config/stdin.yml` config file, and pipe data into it.  This was designed
to run as a CoreOS unit, and take input from **journald**.

A sample unit file is included in the `examples/coreos` directory.


Related Projects
==============================================================================

For filtering the output from this plugin, you probably want the
[Kubernetes Logstash filter](https://github.com/vaijab/logstash-filter-kubernetes)
