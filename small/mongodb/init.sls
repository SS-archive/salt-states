# This setup for mongodb assumes that the replica set can be determined from
# the id of the minion
include:
  - python.pymongo

mongodb:
  pkg:
    - installed
  service:
    - running
    - require:
      - file: mongo-data
      - file: /usr/libexec/mongo/repset_init.js
      - file: /etc/mongodb.conf
      - file: /var/log/mongodb
  user:
    - present
    - uid: 70002
    - gid: 70002
    - require:
      - group: mongodb
  group:
    - present
    - gid: 70002

mongo-dirs:
  file:
    - directory
    - user: mongodb
    - group: mongodb
    - mode: 755
    - makedirs: True
    - names:
      - /var/log/mongodb
      - /usr/libexec/mongo
    - require:
      - user: mongodb
      - group: mongodb

/etc/mongodb.conf:
  file:
    - managed
    - user: mongodb
    - group: mongodb
    - mode: 644
    - source: salt://mongodb/mongodb.conf
    - template: jinja
    - require:
      - pkg: mongodb

/usr/libexec/mongo/repset_init.js:
  file:
    - managed
    - source: salt://mongodb/repset.js
    - template: jinja
    - require:
      - file: mongo-dirs

/usr/libexec/mongo/check_mongo_status.sh:
  file:
    - managed
    - source: salt://mongodb/check_mongo_status.sh
    - mode: 755
    - require:
      - file: mongo-dirs

mongo --quiet /usr/libexec/mongo/repset_init.js:
  cmd:
    - run
    - unless: /usr/libexec/mongo/check_mongo_status.sh
    - user: root
    - group: root
    - require:
      - service: mongodb
      - file: /usr/libexec/mongo/check_mongo_status.sh

