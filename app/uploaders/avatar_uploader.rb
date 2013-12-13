# coding: utf-8

class AvatarUploader < BaseUploader
    
  def filename
      @name ||= "#{timestamp}-#{super}" if original_filename.present? and super.present?
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end