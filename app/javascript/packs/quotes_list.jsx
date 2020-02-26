import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'

const GET_QUOTES = gql`
  {
    quotes {
      id
      text
      author {
        id
        name
      }
    }
  }
`

const TopicShowCounter = props => {
  const { loading, error, data } = useQuery(GET_QUOTES)
  let quote_list = []

  if (data != undefined) {
    quote_list = data.quotes.map((quote) =>
      <p key={quote.id}>
        <a href={`/quotes/${quote.id}`} className="quote-text">
          {quote.text}
        </a>
        <span className="author d-flex justify-content-end">
          {
            quote.author != undefined ? (
              <a href={`/authors/${quote.author.id}`}>
                {quote.author.name}
              </a>
            ) : (
              null
            )
          }
        </span>
      </p>
    )
  }

  return (
    <div>
    { quote_list }
    </div>
  )
}

export default TopicShowCounter
