# This is the QA environment state tree for testing
# Anyone should eb able to run this state tree on any supported platform when
# it is complete

base:
  '*':
    - core
    - http
    - saltsrc
    - users
    - python
  'os:CentOS':
    - match: grain
    - redhat
  'kernel:Linux':
    - match: grain
    - kernel
