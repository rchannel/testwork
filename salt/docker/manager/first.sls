include:
  - docker
  - docker.mine

init new swarm cluster:
  cmd.run:
{% if grains['rack'] == 'dev' %} 
    - name: 'docker swarm init --listen-addr eth0:2377'
{% elif grains['rack'] == 'prod' %}
    - name: 'docker swarm init --listen-addr eth0:2378'
{% endif %}
    - require:
      - pkg: docker
