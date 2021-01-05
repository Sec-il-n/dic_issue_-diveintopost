module AssignHelper
  def owner?(team)
    team.owner_id == current_user.id
  end
  def owner_or_current_user?(assign, assigned_user)
    assigned_user.id == assign.team.owner_id or assigned_user.id == current_user.id
  end
end
