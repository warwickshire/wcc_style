class Keyword < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :resource_keyword_links
  has_many :resources, through: :resource_keyword_links
end
