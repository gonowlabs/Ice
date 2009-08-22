class Project < ActiveRecord::Base
  belongs_to :contract
  belongs_to :manager, :class_name => 'User'
  has_and_belongs_to_many :users
  validates_presence_of :name, :contract

  has_many :entries do
    def between(starting_date, ending_date, user = nil)
      conditions = {:date => (starting_date..ending_date)}
      conditions[:user_id] = user if user
      all(:conditions => conditions, :order => :date)
    end
    def for_week_and_user(reference_date, user)
      starting_date, ending_date = [reference_date.monday, reference_date.sunday]
      result = between(starting_date, ending_date, user)
      if (result.length < 7)
        result = (starting_date..ending_date).map do |date|
          proxy_owner.entries.find_or_create_by_user_id_and_date(:user_id => user.to_param, :date => date, :hours => 0.0)
        end
      end
      result
    end
  end
end
