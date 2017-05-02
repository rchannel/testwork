include:
  - docker
  - docker.mine

init new swarm cluster:
  cmd.run:
    - name: 'docker swarm init'
    - require:
      - pkg: docker
