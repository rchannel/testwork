# Salt will not automatically install RVM dependencies 
rvm-deps: 
  pkg.installed: 
    - names: 
      - mysql-devel
      - bash 
      - bzip2 
      - coreutils 
      - curl 
      - gawk 
      - git 
      - gzip 
      - sed 
      - sudo 

# Salt will not automatically install MRI dependencies 
mri-deps: 
  pkg.installed: 
    - names: 
      - autoconf 
      - automake 
      - bison 
      - gcc-c++ 
      - glibc 
      - libffi-devel 
      - libtool 
      - libyaml-devel 
      - make 
      - openssl-devel 
      - patch 
      - readline 
      - readline-devel 
      - zlib 
      - zlib-devel 

install_rvm:
  cmd.run:
    - name: curl -sSL https://get.rvm.io | bash
    - user: rvm
    - unless: /home/rvm/.rvm/bin/rvm --version

ruby-2.3.1:
  rvm.installed:
    - default: True

bundle:
   gem.installed:
    - user: rvm

mysql:
   gem.installed:
    - user: rvm

mysql2:
   gem.installed:
    - user: rvm
    - version: 0.4.5
