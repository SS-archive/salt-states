# Example Configurations for Munin Node
# Originally for Ubuntu 10.04, package
# name may be different for your dist

munin-node:
    pkg:
        - installed
    service:
        - running
        - watch:
            - file: core-munin-conf
            - pkg: munin-node-dependancies

# Dependancies for Several Custom Munin Plugins
munin-node-dependancies:
    pkg:
        - installed
        - names:
            - libwww-perl

# Configuration Files & Scripts
munin-node-conf:
    file:
        - recurse
        - source: salt://munin/files/node
        - name: /etc/munin

# Check Permissions of Plugins to Ensure They Are Executible
chmod -R 755 /etc/munin/plugins/:
    cmd:
        - run
        - unless: bash /etc/munin/checkPermissions.sh
        - require:
            - file: core-munin-conf