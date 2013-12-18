class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :body, type: String
  field :body_html, type: String
  field :tag, type: Array
  
  belongs_to :user
  
  def tags_list=(arg)
    self.tag = arg.split(' ').map { |v| v.strip }
  end

  def tags_list
    self.tag.join(' ')
  end
end
