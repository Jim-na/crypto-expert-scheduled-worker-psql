# frozen_string_literal: true

require_relative '../../init.rb'
require 'aws-sdk-sqs'

module CryptoExpert
  # Scheduled worker to report on recent cloning operations
  class UpdateMinipairWorker
    def initialize
      @config = App.config
    end

    def call
      puts "REPORT DateTime: #{Time.now}"

      @minipairs = Binance::SignalsListMapper.new.get_sortlist().signals
      @minipairs.each do |minipair|
        Repository::Signals.create(minipair)
      end
    end

    def check
      val = Repository::Signals.all()
      puts val[0].to_attr_hash
    end
  end
end