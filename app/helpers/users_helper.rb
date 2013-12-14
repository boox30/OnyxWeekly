# coding: utf-8
require "digest/md5"
module UsersHelper
   def user_avatar_width_for_size(size)
    case size
      when :normal then 48
      when :small then 24
      when :large then 64
      when :big then 120
      else size
    end
  end
  
  def user_avatar_size_name_for_2x(size)
    case size
    when :normal then :large
    when :small then :normal
    when :large then :big
    when :big then :big
    else size
    end
  end

  def user_avatar_tag(user, size = :normal, opts = {})
    link = opts[:link]

    width = user_avatar_width_for_size(size)

    if user.blank?
      return image_tag("avatar/#{size}.png")
    end

    if user[:avatar].blank?
      default_url = asset_path("avatar/#{size}.png")
      img_src = "http://gravatar.com/avatar/#{user.email_md5}.png?s=#{width * 2}&d=404"
      img = image_tag(img_src, :class => "uface", :style => "width:#{width}px;height:#{width}px;")
    else
      img = image_tag(user.avatar.url(user_avatar_size_name_for_2x(size)), :style => "width:#{width}px;height:#{width}px;")
    end

    if link
      raw %(<a href="">#{img}</a>)
    else
      raw img
    end
  end
end