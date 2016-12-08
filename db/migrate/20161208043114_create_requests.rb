class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :colleges
      t.string :first
      t.string :last
      t.string :email
      t.string :phone
    end
  end
end
