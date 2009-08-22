class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.update_hour(user, project, date, hours)
    entry = user.entries.first :conditions => {:project_id => project, :date => date}
    entry = user.entries.build :project => project, :date => date unless entry
    entry.hours = hours
    entry.save!
  end
end
