class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :body, type: String
  field :body_html, type: String
  field :tag, type: Array
  
  belongs_to :user
  
  def tag=(val)
    self[:tag] = val.split(" ")  
  end
end
