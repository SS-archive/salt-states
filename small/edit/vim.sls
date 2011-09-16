vim:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: vim-enhanced
    {% endif %}
    - installed

/etc/vimrc:
  file:
    - managed
    - source: salt://edit/vimrc
  require:
    - pkg: vim
