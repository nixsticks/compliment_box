class Compliment < ActiveRecord::Base
  belongs_to :sender,
    :class_name => 'User'
  belongs_to :recipient,
    :class_name => 'User'
  validates :content, presence: true, length: {maximum: 100}
end
