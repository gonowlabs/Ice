class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :user, :project, :date
  validates_uniqueness_of :date, :scope => [:user_id, :project_id]
  
  def self.cost_by_contract(id, opts)
    all(:joins => "JOIN projects on projects.id = project_id", 
        :conditions => ['projects.contract_id = ? AND date BETWEEN ? AND ?', id, opts[:from], opts[:to]]).map do |entry|
      entry.hours
    end.sum
  end
  
  def self.cost_by_project(id, opts)
    find_all_by_project_id(id, :conditions => ['date BETWEEN ? AND ?', opts[:from], opts[:to]]).map do |entry|
      entry.hours
    end.sum
  end
  
  def self.cost_by_user(id, opts)
    find_all_by_user_id(id, :conditions => ['date BETWEEN ? AND ?', opts[:from], opts[:to]]).map do |entry|
      entry.hours
    end.sum
  end
end
