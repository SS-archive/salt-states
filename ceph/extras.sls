# these extra packages are not required to run ceph
#
# ceph-fuse: FUSE-based client for the Ceph distributed file system
# gceph: Graphical ceph cluster status utility
# python-ceph: Python libraries for interacting with RADOS and RBD

ceph-extras:
  pkg.installed:
    - names:
     {% if grains['os'] == 'Ubuntu' %}
      - python-ceph
      - ceph-fuse
      - gceph
     {% endif %}
    - require:
      - pkg: ceph
