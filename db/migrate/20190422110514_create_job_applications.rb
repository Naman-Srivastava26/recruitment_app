# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.datetime :time
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
