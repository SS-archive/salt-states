Ceph with Salt in 5 Minutes
===========================

These `Salt States`__ will deploy Ceph according to the `5-Minute Quickstart`__
from the Ceph docs.

.. __: http://github.com/saltstack/salt-states
.. __: http://ceph.com/docs/master/start/quick-start/

Running a self-contained evaluation version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Applying the ceph.eval state should:

- install Ceph from repositories
- setup a standalone evaluation config

Future objectives
=================

A ceph.deploy state or ceph module capable of:

- setup a cluster config
- deploy monitors (mon), storage nodes (osd), and metadata servers (mds)
- manage filesystems and volumes for Ceph storage
- deploy Rados Block Device (rbd) and gateway (radosgw) daemons
