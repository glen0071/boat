import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'
import TopicsIndexPresenter from './topics_index'

const GET_TOPICS = gql`
  {
    topics {
      id
      name
    }
  }
`

const Loading = () => (
  <div>Loading</div>
)

const TopicsIndexContainer = props => {
  const { loading, error, data } = useQuery(GET_TOPICS)

  return (
    <div>
      {
        data != undefined ? (
          <TopicsIndexPresenter topics={data.topics} />
        ) : (
          < Loading />
        )
      }
    </div>
  )
}

export default TopicsIndexContainer
