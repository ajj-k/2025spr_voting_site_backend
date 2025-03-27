class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.integer :voting, default: 0
      t. timestamps
    end
  end
end
