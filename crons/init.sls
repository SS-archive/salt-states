# include
include:
  - users

# cron.present
date > /tmp/croncheck:
  cron:
    - present
    - user: root
    - minute: '*/5'
    - hour: 4
    - daymonth: 2
    - month: 7

# cron.present
lspci > /tmp/lspcicron:
  cron:
    - present
    - user: root
    - minute: '*/5'
    - hour: 4
    - dayweek: 2
    - month: 7
