import React from 'react'
import ReactDOM from 'react-dom'
import HideableWord from './hideable_word'

const HideWords = props => {
  let quoteArray = props.quote.split(' ')

  return (
    <div style={quoteDiv}>
      {
        quoteArray.map((word, index) =>
          <HideableWord word={word} key={index}/>
        )
      }
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

export default HideWords
