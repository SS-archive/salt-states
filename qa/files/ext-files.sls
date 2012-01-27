include:
  - files

extend:
  /etc/testfile:
    file:
      - managed
      - source: salt://files/testfile2

/etc/test-file3:
  file:
    - managed
    - source: salt://files/test-file3
