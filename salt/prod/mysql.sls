mysql-server:
  pkg.installed
mysqld:
  service.running:
    - watch:
      - pkg: mysql-server
