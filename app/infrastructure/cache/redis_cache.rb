# frozen_string_literal: true

require 'redis'

module CryptoExpert
  module Cache
    # Redis client utility
    class MinipairCache
      def initialize(config)
        @redis = Redis.new(url: config.REDISCLOUD_URL)
      end

      def keys
        @redis.keys
      end

      def wipe
        keys.each { |key| @redis.del(key) }
      end

      def delete(key)
        @redis.del(key)
      end

      def get_minipair_list
        keys.map do |key|
          JSON.parse(@redis.get(key))
        end
      end

      def save_minipair(minipair_hash)
        puts minipair_hash.to_json
        @redis.set(minipair_hash[:symbol], minipair_hash.to_json)
      end   
    end
  end
end