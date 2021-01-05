module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end
  def owner?(assign)
    assign.user.id == current_user.id
  end
  def team_owner?(team)
    team.owner_id == current_user.id
  end
end
