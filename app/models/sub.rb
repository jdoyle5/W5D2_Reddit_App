class Sub < ApplicationRecord
  validates :title, :description, presence: true

  before_action :requre_login

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User


end
