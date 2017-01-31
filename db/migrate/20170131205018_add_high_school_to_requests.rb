class AddHighSchoolToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :high_school, :string
  end
end
