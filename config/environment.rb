# frozen_string_literal: true

require 'figaro'
require 'roda'
require 'sequel'

module CryptoExpert
  # Configuration for the App
  class App < Roda
    plugin :environments

    # rubocop:disable Lint/ConstantDefinitionInBlock
    configure do
      # Environment variables setup
      Figaro.application = Figaro::Application.new(
        environment: environment,
        path: File.expand_path('config/secrets.yml')
      )
      Figaro.load
      def self.config() = Figaro.env

      configure :development, :test do
        require 'pry'; # for breakpoints
        puts "Get into configure..."
        ENV['DATABASE_URL'] = "sqlite://#{config.DB_FILENAME}"
      end

      # Database Setup
      DB = Sequel.connect(ENV['DATABASE_URL'])
      puts "Linke to ..."
      puts ENV['DATABASE_URL']
      def self.DB() = DB # rubocop:disable Naming/MethodName
    end
  end
end