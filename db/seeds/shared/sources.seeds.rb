baha_sources = [
  {
    name: "Gleanings from the writings of Baha'u'llah",
    pub_date: '1935'
  }
]

baha = Author.find_by("name like ?", "Bah%")

baha_sources.each do |source|
  baha.sources << Source.create(source)
end
