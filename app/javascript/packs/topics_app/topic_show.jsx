import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'

import VoteCounter from './vote_counter.jsx'

const GET_TOPIC = gql`
  query Topic($topic_id: ID!){
    topic(id: $topic_id) {
      id
      name
      description
      quoteTopics {
        id
        topicId
        points
        text
        quoteId
        author
          {
            id
            name
          }
      }
    }
  }
`

const TopicShow = props => {
  const topic_id = parseInt(window.location.pathname.match(/\d+/)[0])
  const { loading, error, data } = useQuery(
    GET_TOPIC, { variables: { topic_id: topic_id } }
  )

  const sortedQTs = (qts) => {
    return qts.slice().sort((a,b) => (b.points-a.points))
  }

  let quotes_list = []

  if (data != undefined) {
    quotes_list = sortedQTs(data.topic.quoteTopics).map((quoteTopic) =>
      <div key={quoteTopic.id} className="quote-topic-card">
        <VoteCounter
          quoteTopicId={parseInt(quoteTopic.id)}
          points={parseInt(quoteTopic.points)}
          className
          />
        <a href={`/quotes/${quoteTopic.quoteId}`} className="topic-index">
          {quoteTopic.text}
        </a>
        <div>
          {
            quoteTopic.author != undefined ? (
              <a href={`/authors/${quoteTopic.author.id}`}>
                {quoteTopic.author.name}
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
