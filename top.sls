# This is the QA environment state tree for testing
# Anyone should be able to run this state tree on any supported platform when
# it is complete

base:
  '*':
    - core
    - http
    - saltsrc
    - users
    - python
    - files
    - ldap
    - files.ext-files-second
  'os:CentOS':
    - match: grain
    - redhat
    - iptables
  'kernel:Linux':
    - match: grain
    - kernel


dev:
  'minion1':
    - python
    - files
    - ldap
    - files.ext-files-second
