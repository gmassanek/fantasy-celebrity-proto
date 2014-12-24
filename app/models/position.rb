class Position < ActiveRecord::Base
  has_many :players

  def self.flex
    @flex ||= Position.find_by_abbreviation('FLEX')
  end

  def self.bench
    @bench ||= Position.find_by_abbreviation('BNCH')
  end
end
