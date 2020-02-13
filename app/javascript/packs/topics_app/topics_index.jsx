import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'

const TopicsIndex = props => {
  const [filterInput, setFilterInput] = useState('')
  const [topicsList, setTopicsList] = useState(props.topics)

  const abcOrder = (toipcs) => {
    return toipcs.slice().sort((a,b) =>
      a.name.localeCompare(b.name)
    )
  }

  const filterTopics = (topics) => {
    const string = event.target.value.toLowerCase()
    if (string === '') {
      setTopicsList(props.topics)
    } else {
      setTopicsList(props.topics.filter(topicObject => topicObject.name.toLowerCase().includes(string)))
    }
  }

  return (
    <div className="topics-index-container">
      <input
        placeholder="Topics Filter"
        onChange={() => filterTopics(event.target.value)}
        className="form-control topics-filter-input">
      </input>
      {
        abcOrder(topicsList).map((topic) =>
          <div key={topic.id} className="topic-card">
            <a href={`/topics/${topic.id}`} className="topic-index">
              {topic.name}
            </a>
          </div>
        )
      }
    </div>
  )
}

export default TopicsIndex
