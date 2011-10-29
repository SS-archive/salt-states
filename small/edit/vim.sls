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
    - user: root
    {% if grains['os'] == 'FreeBSD'%}
    - group: wheel
    {% else %}
    - group: root
    {% endif %}
    - mode: 644
    - makedirs: True
    - require:
      - pkg: vim
