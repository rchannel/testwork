#!/usr/bin/env ruby
# frozen_string_literal: true
require 'rubygems'
require 'bundler'
require 'sinatra'
require 'mysql2'
set :bind, '0.0.0.0'
Bundler.require

require 'English'


get '/' do
  Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(IO.read('README.md'))
end

tmpfile_path ||= File.join('/tmp', "ibotta_#{SecureRandom.urlsafe_base64}") # Changes on application restart
puts #{tmpfile_path}
get '/tmpfile' do
  File.open(tmpfile_path, 'a') { |f| f.write("#{Time.now}\n") }
  body = "#Temporary File (#{tmpfile_path.gsub('_', '\_')})\n"
  body += IO.read(tmpfile_path).split("\n").map { |obj| "- #{obj}" }.join("\n")
  Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
end

get '/fortune' do
  fortune_cmd = '/usr/games/fortune 2>&1'
  fortune_output = `#{fortune_cmd}`
  body = "# Fortune\n#{fortune_output}"
  status $CHILD_STATUS.to_i.zero? ? 200 : 500
  Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
end

get '/mysql' do
  host = ENV['MYSQL_HOST'] || '127.0.0.1'
  port = ENV['MYSQL_PORT'] || '3306'
  username = ENV['MYSQL_USERNAME'] || 'root'
  mysql = Mysql2::Client.new(:host => 'localhost', :port => '3306', :username => 'root', connect_timeout: 3)  
  body = "# MySQL Status\n"
  body += mysql.query('show status').map do |obj|
    "- #{obj['Variable_name'].downcase.gsub('_', '\_')}: #{obj['Value']}"
  end.join("\n")
  Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
end
run Sinatra::Application
