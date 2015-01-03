class PlayerTransaction < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :new_position, :class => Position
  belongs_to :old_position, :class => Position
end
