class RosterSlot < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :slot, :class => Position

  after_save :record_change

  def record_change
    if self.changed.include?('slot_id')
      PlayerTransaction.create!(
        :action => self.changes['slot_id'].first.present? ? 'update' : 'add',
        :player_id => self.player_id,
        :team => self.team,
        :old_position_id => self.changes['slot_id'].first,
        :new_position_id => self.changes['slot_id'].last
      )
    end
  end
end
