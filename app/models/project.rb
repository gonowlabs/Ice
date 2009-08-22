class Project < ActiveRecord::Base
  belongs_to :contract
  has_and_belongs_to_many :users
  validates_presence_of :name, :contract

  has_many :entries do
    def between(starting_date, ending_date)
      all(:conditions => {:date => (starting_date..ending_date)}, :order => :date)
    end
    def for_week(reference_date, user = nil)
      starting_date, ending_date = [reference_date.monday, reference_date.monday + 6]
      result = between(starting_date, ending_date)
      if result.empty? && user
        result = (starting_date..ending_date).map do |date|
          proxy_owner.entries.create!(:user => user, :date => date, :hours => 0)
        end
      end
      result
    end
  end
end
