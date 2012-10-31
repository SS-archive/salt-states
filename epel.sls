epel:
    cmd:
        - run
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-7.noarch.rpm
        - unless: test -e /etc/yum.repos.d/epel-testing.repo

