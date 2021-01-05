module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end
  def owner?(team)
    current_user.id == team.owner_id
  end
end
