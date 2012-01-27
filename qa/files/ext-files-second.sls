include:
  - files.ext-files
  - http

extend:
  /etc/test-file3:
    file:
      - managed
      - source: salt://files/testfile
      - watch:
        - file: /etc/testfile
