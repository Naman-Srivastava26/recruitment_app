class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.references :job_application, foreign_key: true

      t.timestamps
    end
  end
end
