class RosterSlot < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :slot, :class => Position
end
