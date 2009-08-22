class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.update_hour(user, project, date, hours)
    entry = user.entries.first :conditions => {:project_id => project, :date => date}
    entry = user.entries.build :project => project, :date => date unless entry
    entry.hours = hours
    entry.save!
  end
  
  def self.cost_by_contract(id, opts)
    all(:joins => "JOIN projects on projects.id = project_id", 
        :conditions => ['projects.contract_id = ? AND date BETWEEN ? AND ?', id, opts[:from], opts[:to]]).map do |entry|
      entry.hours
    end.reduce { |a, b| a + b }
  end
  
  def self.cost_by_project(id, opts)
    find_all_by_project_id(id, :conditions => ['date BETWEEN ? AND ?', opts[:from], opts[:to]]).map do |entry|
      entry.hours
    end.reduce { |a, b| a + b }
  end
end
