class CreateRoadworks < ActiveRecord::Migration
  def change
    create_table :roadworks do |t|
      t.text :description
      t.string :startdate
      t.string :enddate
      t.float :latitude
      t.float :longitude
      t.string :tags
      t.string :submitteddate

      t.timestamps null: false
    end
  end
end
