class Genre < ApplicationRecord

  has_many :result

    validate :method_presence_for_admin, if: :admin?

  def admin?
    member.admin?
  end

  private

  def method_presence_for_admin
    if method.blank?
      errors.add(:method, "can't be blank")
    end
  end
end