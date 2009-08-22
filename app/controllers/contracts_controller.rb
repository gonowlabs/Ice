class ContractsController < InheritedResources::Base
  respond_to :xml, :json
  before_filter :require_admin
end