import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { gql } from "apollo-boost"
import { useQuery } from '@apollo/react-hooks'

const GET_TOPIC = gql`
  query Topic($topic_id: ID!){
    topic(id: $topic_id) {
      id
      name
      description
      quotes {
        id
        text
        author {
          id
          name
        }
        quoteTopics {
          id
          topicId
          points
        }
      }
    }
  }
`

const TopicShowCounter = props => {
  const topic_id = parseInt(window.location.pathname.match(/\d+/)[0])

  const { loading, error, data } = useQuery(
    GET_TOPIC,
    {
      variables: { topic_id: topic_id }
    }
  )

  let quotes_list = []
  if (data != undefined) {
    quotes_list = data.topic.quotes.map((quote) =>
      <div key={quote.id} className="quote-card">
        <div>
        <span className="fa fa-arrow-up">
        </span>
        <span>
          {quote.quoteTopics.find(quoteTopic => parseInt(quoteTopic.topicId) === topic_id).points}
        </span>
        <span className="fa fa-arrow-down"></span>
        </div>
        <a href={`/quotes/${quote.id}`} className="topic-index">
          {quote.text}
        </a>
        <div>
          <a href={`/authors/${quote.author.id}`}>
            {quote.author.name}
          </a>
        </div>
      </div>
    )
  }

  return (
    <div className="topics-index-container">
    { quotes_list }
    </div>
  )
}

export default TopicShowCounter
