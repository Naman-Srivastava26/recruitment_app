# frozen_string_literal: true

json.array! @job_applications, partial: 'job_applications/job_application', as: :job_application
