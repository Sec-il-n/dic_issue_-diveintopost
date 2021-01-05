module LayoutHelper
  def owner_or_author?(agenda)
    # binding.pry
    agenda.team.owner_id == current_user.id or agenda.user_id == current_user.id
  end
end
