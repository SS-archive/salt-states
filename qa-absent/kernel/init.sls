wp512:
  kmod:
    - absent

vm.swappiness:
  sysctl:
    - present
    - value: 60
