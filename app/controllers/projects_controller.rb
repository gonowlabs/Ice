class ProjectsController < InheritedResources::Base
  respond_to :xml, :json
  belongs_to :contract
  before_filter :require_admin
end
