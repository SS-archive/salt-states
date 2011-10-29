/srv/linux:
  file:
    - recurse
    - source: salt://recurse/linux
/srv/linux/linker:
  file:
    - symlink
    - target: /etc/passwd
/srv/killme:
  file:
    - absent
echo foobar:
  cron:
    - present
    - user: root
    - minute: 7
    - hour: 4

