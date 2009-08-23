class ContractsController < InheritedResources::Base
  respond_to :html
  before_filter :require_admin
end
