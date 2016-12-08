class CreateSidekicks < ActiveRecord::Migration
  def change
    create_table :sidekicks do |t|
      t.string :college
      t.string :year
      t.string :major
      t.string :first
      t.string :last
      t.string :email
      t.string :phone
    end
  end
end
