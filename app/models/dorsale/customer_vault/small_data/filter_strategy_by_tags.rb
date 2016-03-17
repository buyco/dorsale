module Dorsale
  module CustomerVault
    module SmallData
      class FilterStrategyByTags < ::Dorsale::SmallData::FilterStrategy
        def apply(query, value)
          value = [*value].flatten.select{ |v| v.present? }

          if value.any?
            query.tagged_with(value)
          else
            query
          end
        end
      end
    end
  end
end
