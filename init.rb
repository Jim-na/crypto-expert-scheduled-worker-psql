# frozen_string_literal: true

require 'ostruct'

%w[config app]
  .reduce([]) { |files, folder| files << Dir.glob("#{folder}/**/*.rb") }
  .flatten
  .sort
  .each { |file| require_relative file }