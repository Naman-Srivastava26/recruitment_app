class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :job_title
      t.datetime :date
      t.text :note_content

      t.timestamps
    end
  end
end
