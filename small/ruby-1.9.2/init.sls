# Get it

ruby-1.9.2:
  file.managed:
    - name: /tmp/ruby-1.9.2.tar.gz
    - source: http://ftp.ruby-lang.org/pub/ruby/ruby-1.9.2-p320.tar.gz
    - source_hash: md5=5ef5d9c07af207710bd9c2ad1cef4b42

# Extract it

extract-ruby:
  cmd:
    - cwd: /tmp
    - names:
      - tar xvf ruby-1.9.2.tar.gz
    - run
    - require:
      - file: ruby-1.9.2

# Configure it

configure-ruby:
  cmd:
    - cwd: /tmp/ruby-1.9.2-p320
    - names:
      - ./configure
      - make
      - make install
    - run
    - require:
      - cmd: extract-ruby


