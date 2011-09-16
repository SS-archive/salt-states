base:
  'webserv*':
    - apache
    - python.django
    - pypy
    - core
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
