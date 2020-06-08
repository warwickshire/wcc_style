class Resource < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :keyword


  def self.search(search_term)
    if search_term
      resources = Resource.all
      search_term.split.each do |word|
        resources = resources.where("title LIKE ?", "%#{word}%")
      end
    else
    resources = []
    end
    return resources
  end
end
