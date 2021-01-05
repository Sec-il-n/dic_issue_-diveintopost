module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end
  def owner?(team)
    team.owner_id = current_user.id
  end
end
