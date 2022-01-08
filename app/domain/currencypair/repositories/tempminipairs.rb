# frozen_string_literal: true

module CryptoExpert
  module Repository
    # Repository for MiniPairs
    class TempMiniPairs
      def self.all
        list = Cache::MinipairCache.new(CryptoExpert::UpdateMinipairWorker.config).get_minipair_list
        puts list[0]
        rebuild_entity list[0]
      end

      def self.find_symbol(symbol)
        rebuild_entity Cache::MinipairCache.new(CryptoExpert::UpdateMinipairWorker.config).get_minipair_list
      end

      def self.rebuild_entity(db_record)
        return nil unless db_record

        Entity::TempMiniPair.new(
          symbol: db_record[:symbol],
          spot_volume: db_record[:spot_volume],
          funding_rate: db_record[:funding_rate],
          open_interest: db_record[:open_interest],
          future_volume: db_record[:future_volume],
          longshort_ratio: db_record[:longshort_ratio],
          time: db_record[:time],
          spot_closeprice: db_record[:spot_closeprice]
        )
      end

      def self.save_symbol(entity)
        Cache::MinipairCache.new(CryptoExpert::UpdateMinipairWorker.config).save_minipair(entity.to_attr_hash)
      end
    end
  end
end
