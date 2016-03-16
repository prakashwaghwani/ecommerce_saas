class Profile < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :phone_number, presence: true
  validates :contact_email, presence: true

  belongs_to :user

  def build_profile

  end
end
