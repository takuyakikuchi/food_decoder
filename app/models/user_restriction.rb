class UserRestriction < ApplicationRecord
  belongs_to :user
  belongs_to :restriction
end
