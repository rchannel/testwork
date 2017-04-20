# frozen_string_literal: true
require 'serverspec'

set :backend, :exec

ENV['TARGET_HOST'] = 'localhost' unless ENV['TARGET_HOST']
#ENV['TARGET_PORT'] = '4567' unless ENV['TARGET_PORT']
ENV['TARGET_PORT'] = '80' unless ENV['TARGET_PORT']
