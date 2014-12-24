class Player < ActiveRecord::Base
  belongs_to :position
  has_many :roster_slots
  has_many :teams, :through => :roster_slots

  def full_name
    "#{first_name} #{last_name}"
  end
end
