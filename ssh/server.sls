include:
  - ssh

sshd:
  service:
    - running
  require:
    - pkg: openssh
