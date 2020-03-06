import React from 'react'
import ReactDOM from 'react-dom'
import HideableWord from './HideableWord'
import PropTypes from 'prop-types'

const HideWords = props => {
  let quoteArray = props.quote.split(' ')

  return (
    <div style={quoteDiv}>
      <div style={{padding: '.4em 0'}}>
        <em>Click a word to hide it</em>
      </div>
      <div style={quoteDiv}>
        {
          quoteArray.map((word, index) =>
            <HideableWord word={word} key={index}/>
          )
        }
      </div>
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

HideWords.propTypes = {
  quote: PropTypes.string
}

export default HideWords