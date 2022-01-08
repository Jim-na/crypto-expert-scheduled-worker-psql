# frozen_string_literal: true

require_relative '../../init.rb'
require 'aws-sdk-sqs'

module CryptoExpert
  # Scheduled worker to report on recent cloning operations
  class UpdateMinipairWorker
    def initialize
      @config = UpdateMinipairWorker.config
    end

    def call
      puts "REPORT DateTime: #{Time.now}"

      @minipairs = Binance::SignalsListMapper.new.get_sortlist().signals
      
    end
  end
end