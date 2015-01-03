class PointSubmission < ActiveRecord::Base
  belongs_to :player
  belongs_to :scoring_statistic

  before_save :default_points

  def default_points
    self.points ||= scoring_statistic.suggested_points
  end

  def scoring_description
    self.scoring_statistic_override || scoring_statistic.description
  end
end
