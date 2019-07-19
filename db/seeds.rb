# Create some authors
authors = [
  {name: "Bahá'u'lláh"},
  {name: "'Abdu'l-Bahá"},
  {name: "Shoghi Effendi"},
  {name: "Martin Luther King"},
  {name: "Thich Nhat Hanh"},
  {name: "William James"},
  {name: "William James"}
]
authors.each do |author_object|
  author = Author.find_or_create_by(name: author_object[:name])
  author[:brith_date] = author_object[:brith_date] if author_object[:brith_date]
  author[:death_date] = author_object[:death_date] if author_object[:death_date]
  author.save!
end


truth_quote = Quote.find_or_create_by(text: 'Truthfulness is the foundation of
all human virtues. Without truthfulness progress and success, in all the worlds
of God, are impossible for any soul. When this holy attribute is established in
man, all the divine qualities will also be acquired.')
Author.find_or_create_by({name: "'Abdu'l-Bahá"}).quotes << truth_quote
truth_quote.themes << Theme.find_or_create_by(name: 'Truthfulness')

happy_quote = Quote.find_or_create_by(text: 'There is no way to happiness - happiness is the way.')
Author.find_or_create_by({name: "Thich Nhat Hanh"}).quotes << happy_quote
happy_quote.themes << Theme.find_or_create_by(name: 'Happiness')

concentrate_quote = Quote.find_or_create_by(text: 'The faculty of bringing back a
wandering attention, over and over again, is the very root of judgement, character
and will. ... An education which should improve this faculty would be the education
par excellence.')
Author.find_or_create_by({name: "William James"}).quotes << concentrate_quote
concentrate_quote.themes << Theme.find_or_create_by(name: 'Concentration')

concentrate_quote_two = Quote.find_or_create_by(text: 'In an information-rich world,
the wealth of information means a dearth of something else: a scarcity of
whatever it is that information consumes. What information consumes is rather
obvious: it consumes the attention of its recipients. Hence a wealth of
information creates a poverty of attention and a need to allocate that attention
efficiently among the overabundance of information sources that might consume
it.')
Author.find_or_create_by({name: "Hebert Simon"}).quotes << concentrate_quote_two
concentrate_quote_two.themes << Theme.find_or_create_by(name: 'Concentration')
concentrate_quote_two.themes << Theme.find_or_create_by(name: 'Information')


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
