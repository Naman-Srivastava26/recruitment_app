json.extract! candidate, :id, :name, :email, :phone, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
