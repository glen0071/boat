authors = [
  {name: `Bahá'u'lláh`},
  {name: `Martin Luther King`}
]

authors.each do |author_object|
  author = Author.find_or_create_by(name: author_object[:name])
  author[:brith_date] = author_object[:brith_date] if author_object[:brith_date]
  author[:death_date] = author_object[:death_date] if author_object[:death_date]
  author.save!
end


quote = Quote.find_or_create_by(text: 'Truthfulness is the foundation of all human virtue')
quote.subjects << Subject.find_or_create_by(name: 'Truth')
