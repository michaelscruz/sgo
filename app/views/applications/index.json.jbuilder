json.array!(@applications) do |application|
  json.extract! application, :id, :school_id, :applicant_id, :requested_amount
  json.url application_url(application, format: :json)
end
