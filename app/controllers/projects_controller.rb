class ProjectsController < InheritedResources::Base
  respond_to :xml, :json
  belongs_to :contract
end
