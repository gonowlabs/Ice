class Project < ActiveRecord::Base
  belongs_to :contract
  belongs_to :manager, :class_name => 'User'
  has_and_belongs_to_many :users
  validates_presence_of :name, :contract

  has_many :entries do
    def for_week_and_user(reference_date, user)
      (reference_date.monday..reference_date.sunday).map do |date|
        proxy_owner.entries.find_or_create_by_user_id_and_date(:user_id => user.id, :date => date, :hours => 0.0)
      end
    end
  end
end
