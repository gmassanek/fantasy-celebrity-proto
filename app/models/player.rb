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

  def self.with_point_submissions
    includes(:point_submissions)
  end

  def self.by_score
    with_point_submissions.sort_by { |ps| -1 * ps.approved_points }
  end
end
