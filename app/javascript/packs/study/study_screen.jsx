import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'
import Word from './word'
import HideWords from './hide_words.jsx'

const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
const GET_QUOTE = gql`
query Quote{
  quote(id: ${quoteId}){
   	id
  	text
    bestTitle
  }
}
`

const HideWord = props => {
  const { loading, error, data } = useQuery(GET_QUOTE)

  return (
    <div style={quoteDiv}>
      {
        data != undefined ?
        <HideWords quote={data.quote.text} />
        :
        null
      }
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

export default HideWord
