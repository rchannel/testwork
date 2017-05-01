{% set join_token = salt['mine.get']('*', 'manager_token').items()[0][1] %}
{% set join_ip = salt['mine.get']('*', 'manager_ip').items()[0][1][0] %}

include:
  - docker
  - docker.mine
  - docker.manager.drain

join cluster:
  cmd.run:
    {% if grains['rack'] == 'dev' %}
    - name: 'docker swarm join --token {{ join_token }} {{ join_ip }}:2377'
    {% elif grains['rack'] == 'prod' %}
    - name: 'docker swarm join --token {{ join_token }} {{ join_ip }}:2378'
    {% endif %}     
    - require:
      - pkg: docker
    - require_in:
      - cmd: drain manager
