munin-nginx-plugins:
    file:
        - recurse
        - source: salt://munin/files/nginx/plugins
        - name: /etc/munin/plugins
        - mode: 755

munin-nginx-plugin-conf:
    file:
        - recurse
        - source: salt://munin/files/nginx/plugin-conf.d
        - name: /etc/munin/plugin-conf.d
        - mode: 755