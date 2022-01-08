# frozen_string_literal: true

folders = %w[gateways cache]
folders.each do |folder|
  require_relative "#{folder}/init.rb"
end
