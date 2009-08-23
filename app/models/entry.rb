class Entry < ActiveRecord::Base
  APPROVED = 1
  REJECTED = 0
  
  belongs_to :user
  belongs_to :project
  has_many :comments

  validates_presence_of :user, :project, :date
  validates_uniqueness_of :date, :scope => [:user_id, :project_id]
  validates_numericality_of :hours, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 24
  
  def self.cost_by_contract(id, opts)
    sum_hours(opts, {:projects => {:contract_id => id}}, :joins => :project)
  end
  
  def self.cost_by_project(id, opts)
    sum_hours(opts, :project_id => id)
  end
  
  def self.cost_by_user(id, opts)
    sum_hours(opts, :user_id => id)
  end
  
  def status_name
    return 'approved' if status == APPROVED
    return 'rejected' if status == REJECTED
    ''
  end
  
  private
  
  def self.sum_hours(opts, params, extras = {})
    sum(:hours, conditions_with(opts, params).merge(extras))
  end
  
  def self.conditions_with(opts, conditions)
    {:conditions => conditions.merge(:date => (opts[:from]..opts[:to]), :status => APPROVED)}
  end
end