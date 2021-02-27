class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project

  attribute :email, :string
  #attr_accessor :email
  def set_user_id
    existing_user = User.find_by(email: email)
    self.user = if existing_user.present?
                  existing_user
                else
                  User.invite!(email: email)
                end
  end
end
