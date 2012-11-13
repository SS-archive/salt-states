# pkg.install
vim:
  pkg:
    {% if grains['os'] == 'CentOS' or grains['os'] == 'Fedora' %}
    - name: vim-enhanced
    {% elif grains['os'] == 'Debian' %}
    - name: vim-runtime
    {% endif %}
    - purged

{% if grains['os'] == 'Arch'%}
/etc/vimrc:
  file:
    - absent
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: vim
{% endif %}
