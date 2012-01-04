wp512:
  kmod:
    - present

vm.swappiness:
  sysctl:
    - present
    - value: 14
