import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useMutation, gql } from '@apollo/client'
import axios from 'axios'

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

const VoteCounter = ({ quoteTopicId, points }) => {
const [voteQuoteTopic, { data }] = useMutation(VOTE_QUOTE_TOPIC)
const [loggedIn, setLoggedIn] = useState(false)
useEffect(() => { checkAdminUser() })
const checkAdminUser = () => {
  axios({
    url: '/home/check_admin_user',
    method: 'get',
  }).then((result) => {
    setLoggedIn(result.data.logged_in)
  })
}

const checkLoggedIn = (change) => {
  if (true) {
    voteQuoteTopic(
      {variables: {
        quoteTopicId: quoteTopicId,
        change: change
      }}
    )
  } else {
    return false
  }
}

  return (
    <div className="vote-counter">
      <span className={"fa fa-arrow-up " + (loggedIn ? 'show' : '')}
        onClick={() => { checkLoggedIn(1) }}>
      </span>
      <span className="points bg-light"> {points} </span>
      <span className={"fa fa-arrow-down " + (loggedIn ? 'show' : '')}
        onClick={() => { checkLoggedIn(-1) }}>
      </span>
      <span className="gotta-login">gotta login first</span>
    </div>
  )
}

VoteCounter.propTypes = {
  points: PropTypes.number
}

VoteCounter.defaultProps = {
  points: 0
}

export default VoteCounter
