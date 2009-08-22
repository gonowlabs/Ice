class User < ActiveRecord::Base
  ADMIN = 1
  MANAGER = 2
  
  has_and_belongs_to_many :projects
  has_many :entries do
    def for_week_and_project(date, project)
      (date.monday..date.sunday).map do |date|
        proxy_owner.entries.find_or_create_by_project_id_and_date(project.id, date)
      end
    end
  end
  has_many :comments, :foreign_key => 'author_id'

  acts_as_authentic
  
  def admin?
    role.eql? ADMIN
  end
  
  def manager?
    role.eql? MANAGER
  end
end
