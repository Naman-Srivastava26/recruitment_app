# frozen_string_literal: true

namespace :file do
  task :import_csv do
    ActiveRecord::Base.transaction do
      require 'csv'

      csv_text = File.read(Rails.root.join('lib', 'seeds', 'notes.csv'))
      csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
      csv.each do |row|
        candidate = Candidate.find_or_create_by(name: row['Name'])
        note = Note.new
        candidate.email = row['Email']
        note.content = row['Note']
        candidate.save
        note.save
      end
    end
  end
end
