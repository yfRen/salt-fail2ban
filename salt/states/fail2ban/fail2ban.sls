fail2ban-install:
  cmd.run:
    - name: yum -y install epel-release
    - unless: test -e /etc/yum.repos.d/epel.*
  pkg.installed:
    - names:
      - fail2ban

fail2ban-config:
  file.managed:
    - name: /etc/fail2ban/jail.local
    - source: salt://fail2ban/files/jail.local
    - unless: test -e /etc/fail2ban/jail.local

fail2ban-service:
  service.running:
    - name: fail2ban
    - enable: True
