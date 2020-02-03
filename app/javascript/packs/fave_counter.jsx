import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useMutation, gql } from '@apollo/client'

const VOTE_QUOTE_TOPIC = gql`
  mutation VoteQuoteTopic($quoteTopicId: ID!, $change: Int!){
    voteQuoteTopic(input: {quoteTopicId: $quoteTopicId, change: $change}) {
      quoteTopic {
        id
        points
      }
    }
  }
`

const FaveCounter = ({ quoteTopicId, points }) => {
const [voteQuoteTopic, { data }] = useMutation(VOTE_QUOTE_TOPIC)

  return (
    <div>
      <span className="fa fa-arrow-up"
        onClick={() => {
          voteQuoteTopic(
            {variables: {
              quoteTopicId: quoteTopicId,
              change: 1
            }}
          )
        }}></span>
      <span> {points} </span>
      <span className="fa fa-arrow-down"
        onClick={() => {
          voteQuoteTopic(
            {variables: {
              quoteTopicId: quoteTopicId,
              change: -1
            }}
          )
        }}></span>
    </div>
  )
}

FaveCounter.propTypes = {
  points: PropTypes.number
}

FaveCounter.defaultProps = {
  points: 0
}

export default FaveCounter
