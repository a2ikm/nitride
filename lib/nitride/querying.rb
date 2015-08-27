module Nitride
  module Querying
    def nitride
      Nitride::Filter.new(self)
    end

    def select(&block)
      nitride.select(&block)
    end

    def reject(&block)
      nitride.reject(&block)
    end
  end
end
