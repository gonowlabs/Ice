class ProjectsController < InheritedResources::Base
  respond_to :html
  belongs_to :contract
  before_filter :require_admin
end
