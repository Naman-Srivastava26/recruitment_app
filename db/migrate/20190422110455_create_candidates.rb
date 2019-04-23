class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
