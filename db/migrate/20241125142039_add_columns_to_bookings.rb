class AddColumnsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :starts_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :status, :integer
  end
end
