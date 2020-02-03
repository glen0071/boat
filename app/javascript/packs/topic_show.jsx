import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'

import FaveCounter from './fave_counter.jsx'

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

const findPoints = (topic_id, quoteTopics) => {
  let quoteTopic = quoteTopics.find(quoteTopic => parseInt(quoteTopic.topicId) === topic_id)
  const qt_data = {points: quoteTopic.points, qt_id: quoteTopic.id}
  return qt_data
}

const TopicShow = props => {
  const topic_id = parseInt(window.location.pathname.match(/\d+/)[0])
  const { loading, error, data } = useQuery(
    GET_TOPIC, { variables: { topic_id: topic_id } }
  )

  let quotes_list = []
  if (data != undefined) {
    quotes_list = data.topic.quotes.map((quote) =>
      <div key={quote.id} className="quote-card">
        <FaveCounter
        quoteTopicId={parseInt(findPoints(topic_id, quote.quoteTopics).qt_id)}
        points={findPoints(topic_id, quote.quoteTopics).points} />
        <a href={`/quotes/${quote.id}`} className="topic-index">
          {quote.text}
        </a>
        <div>
          {
            quote.author != undefined ? (
              <a href={`/authors/${quote.author.id}`}>
                {quote.author.name}
              </a>
            ) : (
              null
            )
          }

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

export default TopicShow
