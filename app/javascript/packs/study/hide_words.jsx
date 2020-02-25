import React from 'react'
import ReactDOM from 'react-dom'
import Word from './word'

const HideWords = props => {
  let quoteArray = props.quote.split(' ')

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

export default HideWords
