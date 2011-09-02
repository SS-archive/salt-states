vim:
  pkg:
    - installed

/etc/vimrc:
  file:
    - managed
    - source: salt://edit/vimrc
  require:
    - pkg: vim
