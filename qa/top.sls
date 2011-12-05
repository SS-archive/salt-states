# This is the QA environment state tree for testing
# Anyone should eb able to run this state tree on any supported platform when
# it is complete

base:
  '*':
    - core
    - http
    - saltsrc
    - users
  'os:RedHat':
    - match: grain
    - redhat
  'os:Debian':
    - match: grain
    - debian
  'os:Fedora':
    - match: grain
    - fedora
  'os:FreeBSD':
    - match: grain
    - freebsd
  'kernel:Linux':
    - match: grain
