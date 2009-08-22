# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def projects_from(contract)
    contract.map { |contract| contract.projects }.flatten
  end
  
  def workers(users)
    users.select { |user| ![User::ADMIN, User::MANAGER].include? user.role }
  end
end
