class ChangeDataTypeForCoords < ActiveRecord::Migration
    def self.up
      change_column :roadworks, :latitude, :string
      change_column :roadworks, :longitude, :string
  end
  def self.down
	  change_column :roadworks, :latitude, :float
      change_column :roadworks, :longitude, :float
  end
end

