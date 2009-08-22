class Project < ActiveRecord::Base
  belongs_to :contract
  belongs_to :manager, :class_name => 'User'
  has_and_belongs_to_many :users
  validates_presence_of :name, :contract

  has_many :entries do
    def between(starting_date, ending_date)
      all(:conditions => {:date => (starting_date..ending_date)}, :order => :date)
    end
    def for_week_and_user(reference_date, user)
      starting_date, ending_date = [reference_date.monday, reference_date.sunday]
      result = []
      self.with_scope(:find => {:conditions => {:user_id => user}}) do
        result = between(starting_date, ending_date)
      end
      if (result.length < 7)
        result = (starting_date..ending_date).map do |date|
          proxy_owner.entries.create(:user => user, :date => date, :hours => 0)
        end
      end
      result
    end
  end
end
