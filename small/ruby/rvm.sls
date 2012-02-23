# TODO: support more operating systems

# This should run on every OS that rvm supports, only the package
# names have to be changed accordingly.

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '10.04' %}

rvm:
  group:
    - present
  user:
    - present
    - gid: rvm
    - home: /home/rvm
    - require:
      - group: rvm

rvm-deps:
  pkg:
    - installed
    - names:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - subversion
      - sudo

mri-deps:
  pkg:
    - installed
    - names:
      - build-essential
      - openssl
      - libreadline6
      - libreadline6-dev
      - curl
      - git-core
      - zlib1g
      - zlib1g-dev
      - libssl-dev
      - libyaml-dev
      - libsqlite3-0
      - libsqlite3-dev
      - sqlite3
      - libxml2-dev
      - libxslt1-dev
      - autoconf
      - libc6-dev
      - libncurses5-dev
      - automake
      - libtool
      - bison
      - subversion
      - ruby

jruby-deps:
  pkg:
    - installed
    - names:
      - curl
      - g++
      - openjdk-6-jre-headless

ruby-1.9.2:
  rvm:
    - installed
    - default: True
    - runas: rvm
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps
      - user: rvm

jruby:
  rvm:
    - installed
    - runas: rvm
    - require:
      - pkg: rvm-deps
      - pkg: jruby-deps
      - user: rvm

jgemset:
  rvm:
    - gemset_present
    - ruby: jruby
    - runas: rvm
    - require:
      - rvm: jruby

mygemset:
  rvm:
    - gemset_present
    - ruby: ruby-1.9.2
    - runas: rvm
    - require:
      - rvm: ruby-1.9.2

addressable:
  gem:
    - installed
    - runas: rvm
    - ruby: jruby@jgemset
    - require:
      - rvm: jgemset

{% endif %}
