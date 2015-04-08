class Application < ActiveRecord::Base
  belongs_to :school
  belongs_to :applicant
end
