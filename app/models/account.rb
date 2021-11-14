class Account < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
