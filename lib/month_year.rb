module Lib
  class MonthYear
    attr_accessor :month, :year

    def initialize(date)
      self.month = date.month
      self.year = date.year
    end

    def equal?(other)
      (self <=> other) == 0
    end
    alias eql? equal?
    alias == equal?
    alias === equal?

    def <=>(other)
      result = self.year - other.year
      result == 0 ? self.month - other.month : result
    end

    def to_s
      "#{I18n.t('date.month_names')[self.month]} #{self.year}"
    end
    def hash
      "#{self.year}#{'%02d' % self.month}".to_i
    end
    alias to_param hash
  end
end
