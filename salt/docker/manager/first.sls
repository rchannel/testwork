include:
  - docker
  - docker.mine
  - docker.manager.drain

init new swarm cluster:
  cmd.run:
    - name: 'docker swarm init --advertise-addr '
    - require:
      - pkg: docker-engine
    - require_in:
      - cmd: drain manager
