/var/ruby/rubywww/buildit.sh:
  file.managed:
    - source: salt://docker/files/var/ruby/rubywww/buildit.sh
    - user: root
    - mode: 744

/var/ruby/rubywww/app.rb:
  file.exists:
    - name: /var/ruby/rubywww/app.rb

cmd.wait:
  cmd: 
    - run
    - name: './var/ruby/rubywww/buildit.sh'
    - onchanges:  
      - file: /var/ruby/rubywww/app.rb 
