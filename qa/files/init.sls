/bin/cheeseandbiscuits:
  file:
    - symlink
    - target: /bin/sh

/etc/testfile:
  file:
    - managed
    - source: salt://files/testfile
    - user: root
    - group: bin
    - mode: 723
    - template: jinja

/cheese/spam/bacon:
  file:
    - directory
    - user: root
    - group: bin
    - makedirs: True

sedfile:
  file:
    - sed
    - name: /etc/testfile
    - before: cheese
    - after: spam
    - order: last

/etc/hosts:
  file:
    - comment
    - regex: '127.0.0.1.*'
    - order: 50

uncomment-hosts:
  file:
    - uncomment
    - name: /etc/hosts
    - regex: '.*127.0.0.1.*'
    - order: 51

/etc/resolv.conf:
  file:
    - append
    - text: '# test append'

