module Nitride
  class Filter
    include Enumerable

    def initialize(source)
      @source = source
      @select_blocks = []
      @reject_blocks = []
    end

    def source
      @source
    end

    def to_a
      entries = []
      source.each do |entry|
        catch(:next) do
          @select_blocks.each do |select_block|
            throw :next, false unless entry.instance_eval(&select_block)
          end
          @reject_blocks.each do |reject_block|
            throw :next, false if entry.instance_eval(&select_block)
          end
          entries << entry
        end
      end
      entries
    end

    def inspect
      entries = to_a.take(11).map!(&:inspect)
      entries[10] = '...' if entries.size == 11

      "#<#{self.class.name} [#{entries.join(', ')}]>"
    end

    def each(&block)
      to_a.each(&block)
    end

    def select(&block)
      dup.select!(&block)
    end

    def select!(&block)
      @select_blocks << block
      self
    end

    def reject(&block)
      dup.reject!(&block)
    end

    def reject!(&block)
      @reject_blocks << block
      self
    end
  end
end
