class CurriculumLabel
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label, type: String
  field :catalogue, type: String


end