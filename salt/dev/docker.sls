docker:
  pkg.installed:
    - from: docker-ce-edge
    - pkgs:
      - docker

docker-service:
  service.running:
    - name: docker
    - enable: True
    - watch:
      - pkg: docker
