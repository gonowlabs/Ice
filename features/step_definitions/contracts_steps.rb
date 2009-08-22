Then /^I should have a "([^\"]*)" with "([^\"]*)" "([^\"]*)"$/ do |model, field_name, field_value|
  model.camelize.constantize.first( :conditions => {field_name.to_sym => field_value} )
end
