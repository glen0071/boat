import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'
import Word from './word'

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
  let quoteArray = []

  if (data != undefined) {
    quoteArray = data.quote.text.split(' ')
  }

  return (
    <div style={quoteDiv}>
      {
        quoteArray.map((word, index) =>
          <Word word={word} key={index}/>
        )
      }
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

export default HideWord
