class Curriculum
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :content, type: String
  field :path, type: String

end