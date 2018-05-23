module UsersHelper
  def default_avatar
    image_tag 'https://i.pinimg.com/originals/fb/27/f4/fb27f41e8f71ebd91412d3fc922547d8.jpg', size: '70x70', class: 'gravatar'
  end
end
