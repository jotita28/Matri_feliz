class AddPurveyorToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :purveyor, foreign_key: true
  end
end
