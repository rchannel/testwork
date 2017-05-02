/etc/salt/minion.d/swarm.conf:
  file.managed:
    - source: salt://docker/files/etc/salt/minion.d/swarm.conf
