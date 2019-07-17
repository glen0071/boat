# Create some authors
authors = [
  {name: "Bahá'u'lláh"},
  {name: "Martin Luther King"},
  {name: "Thich Nhat Hanh"}
]
authors.each do |author_object|
  author = Author.find_or_create_by(name: author_object[:name])
  author[:brith_date] = author_object[:brith_date] if author_object[:brith_date]
  author[:death_date] = author_object[:death_date] if author_object[:death_date]
  author.save!
end


truth_quote = Quote.find_or_create_by(text: 'Truthfulness is the foundation of all human virtue')
truth_quote.themes << Theme.find_or_create_by(name: 'Truthfulness')

truth_quote = Quote.find_or_create_by(text: 'There is no way to happiness - happiness is the way.')
truth_quote.themes << Theme.find_or_create_by(name: 'Happiness')


themes = [
  {name: 'Truthfulness'},
  {name: 'Life after death'},
  {name: 'Source of inspiration'},
  {name: 'Love'},
  {name: 'God'},
  {name: 'Diversity and Inclusion'}
]

themes.each do |theme|
  Theme.find_or_create_by(theme)
end
