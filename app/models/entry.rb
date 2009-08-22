class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :user, :project, :date
  validates_uniqueness_of :date, :scope => [:user_id, :project_id]
  
  def self.cost_by_contract(id, opts)
    sum(:hours, :joins => :project, 
        :conditions => {:projects => {:contract_id => id}, :date => (opts[:from]..opts[:to]) })
  end
  
  def self.cost_by_project(id, opts)
    sum(:hours, :conditions => {:project_id => id, :date => (opts[:from]..opts[:to])})
  end
  
  def self.cost_by_user(id, opts)
    sum(:hours, :conditions => {:user_id => id, :date => (opts[:from]..opts[:to])})
  end
end
