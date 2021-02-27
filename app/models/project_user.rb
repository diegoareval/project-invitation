class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to  :user

  attribute :email, :string

  before_validation :set_user_id, if: :email?

  def set_user_id
    self.user = User.invite!(email: email)
  end
end