# frozen_string_literal: true

namespace :file do
  task import_csv: :environment do
    require 'csv'
    require 'rails/all'

    ActiveRecord::Base.transaction do
      csv_text = File.read(Rails.root.join('lib', 'seeds', 'notes.csv'))
      csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
      csv.each do |row|
        candidate = Candidate.find_or_create_by(email: row['Email'])
        Note.create(content: row['Note'], candidate: candidate)
      end

      csv_text = File.read(Rails.root.join('lib', 'seeds', 'candidates.csv'))
      csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
      csv.each do |row|
        candidate = Candidate.find_or_create_by(email: row['Email'])
        candidate.name = row['Name']
        candidate.phone = row['Phone']
        candidate.save
        Job.find_or_create_by(job_title: row['Job'])
        JobApplication.create(time: row['Created at'], candidate: candidate)
      end
    end
  end
end
