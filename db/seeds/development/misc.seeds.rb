# frozen_string_literal: true

BlogPost.create(
  title: 'First External Post',
  body: 'Here is a long post. Here is a long post. Here is a long post. Here is a long post.',
  url: 'https://www.nytimes.com/2022/12/28/us/politics/covid-requirements-china-us-travel.html',
  header: 'Here is a titalizing header. It should have a few more words.',
  display_date: Date.today - 200,
  source: 'New York Times'
)

BlogPost.create(
  title: 'Second External Post',
  body: 'Here are some serious words about a thing that I wrote on another website.',
  url: 'https://minnesotareformer.com/2022/12/28/child-poverty-rates-highest-in-states-that-havent-raised-minimum-wage/',
  header: 'If you read this, it will make you want to click and read more.',
  display_date: Date.today - 100,
  source: 'Minnesota Reformer'
)

mn_doc_data = [
  {
    publish_date: Date.parse('July 2000'),
    total: 6276,
    male: 5894,
    female: 382,
    white: 2933,
    black: 2264
  },
  {
    publish_date: Date.parse('July 2010'),
    total: 7276,
    male: 6894,
    female: 382,
    white: 2933,
    black: 2264
  }
]

mn_doc_data.each do |data|
  MnDocData.find_or_create_by( data )
end

