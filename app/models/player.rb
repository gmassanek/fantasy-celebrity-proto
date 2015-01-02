class Player < ActiveRecord::Base
  belongs_to :position, :required => true
  has_many :roster_slots
  has_many :teams, :through => :roster_slots
  has_many :point_submissions

  def full_name
    "#{first_name} #{last_name}"
  end

  def approved_points
    point_submissions.where(:status => 'approved').sum(:points)
  end
end
