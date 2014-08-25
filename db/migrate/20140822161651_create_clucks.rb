class CreateClucks < ActiveRecord::Migration
  def change
    create_table :clucks do |t|
      t.belongs_to :user
      t.string :text
   
      t.timestamps
    end
  end
end
