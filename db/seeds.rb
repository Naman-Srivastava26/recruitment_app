# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

csv_text = File.read(Rails.root.join('lib', 'seeds', 'candidates.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  candidate = Candidate.find_or_create_by(name: row['Name'])
  candidate.email = row['E-mail']
  candidate.phone = row['Phone']
  job = Job.find_or_create_by(job_title: row['Job'])
  job_application = JobApplication.find_or_create_by(time: row[' Created_at'])
  candidate.save
  job.save
  job_application.save
end
