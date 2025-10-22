class AddUserToEvent < ActiveRecord::Migration[8.0]
  def change
    add_reference :events, :user, foreign_key: true
  end
end
