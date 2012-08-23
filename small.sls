base:
  'webserv*':
    - apache
    - python.django
    - python.mako
    - pypy
    - core
    - recurse
    - redis
  'syndic*':
    - salt.syndic
    - salt.master
    - core
  'haproxy*':
    - haproxy
    - core
  'mongo*':
    - mongo
    - core
  'os:RedHat':
    - match: grain
    - apache
    - python.django
    - pypy
    - core
  'os:FreeBSD':
    - match: grain
    - sudo
    - edit.vim
    - edit.emacs
    - users
    - tags
    - hosts
    - salt.dirs

