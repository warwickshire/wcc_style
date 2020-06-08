Seeder = Dibber::Seeder

Seeder.monitor Keyword
Keyword.delete_all
JSON.parse(open("#{Rails.root}/db/seeds/keywords.json").read).each do |stuff|
  keyword = Keyword.new
  keyword.assign_attributes(stuff)
  keyword.save(:validate => false)
end

Seeder.monitor Resource
Resource.delete_all
JSON.parse(open("#{Rails.root}/db/seeds/resources.json").read).each do |stuff|
  resource = Resource.new
  resource.assign_attributes(stuff)
  resource.save(:validate => false)
end

puts Seeder.report