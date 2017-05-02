docker:
  pkg.installed:
    - pkgs:
      - docker

docker-service:
  service.running:
    - name: docker
    - enable: True
    - watch:
      - pkg: docker
