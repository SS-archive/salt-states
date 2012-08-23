# pkg.install
vim:
  pkg:
    {% if grains['os'] == 'CentOS' or grains['os'] == 'Fedora' %}
    - name: vim-enhanced
    {% endif %}
    - installed

{% if grains['os'] == 'Arch'%}
/etc/vimrc:
  file:
    - managed
    - source: salt://edit/vimrc
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: vim
{% endif %}
