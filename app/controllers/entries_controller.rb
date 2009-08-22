class EntriesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index
end
