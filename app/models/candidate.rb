# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :notes
  has_many :job_applications
end
