import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { gql } from "apollo-boost"
import { useQuery } from '@apollo/react-hooks'

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
        <a href={'/quotes/' + quote.id} className="quote-text">
          {quote.text}
        </a>
        <span className="author d-flex justify-content-end">
          <a href={'/authors/' + quote.author.id}>
            {quote.author.name}
          </a>
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
