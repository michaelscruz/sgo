json.array!(@disbursements) do |disbursement|
  json.extract! disbursement, :id, :disburse_date, :amount, :type, :awards, :status
  json.url disbursement_url(disbursement, format: :json)
end
