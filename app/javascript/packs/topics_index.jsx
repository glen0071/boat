import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { gql } from "apollo-boost"
import { useQuery } from '@apollo/react-hooks'

const GET_TOPICS = gql`
  {
    topics {
      id
      name
    }
  }
`

const TopicShowCounter = props => {
  const { loading, error, data } = useQuery(GET_TOPICS)
  console.log(data)
  let topics_list = []

  if (data != undefined) {
    topics_list = data.topics.map((topic) =>
      <div key={topic.id} className="topic-card">
        <a href={`/topics/${topic.id}`} className="topic-index">
          {topic.name}
        </a>
      </div>
    )
  }

  return (
    <div className="topics-index-container">
    { topics_list }
    </div>
  )
}

export default TopicShowCounter
