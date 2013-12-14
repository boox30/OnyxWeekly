class Weekly
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :body, type: String
  field :body_html, type: String
  
  belongs_to :user
end
