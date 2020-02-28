import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import BlankableWord from './BlankableWord'
import Slider from 'rc-slider'
import PropTypes from 'prop-types'

const FillBlanks = props => {
  const [difficulty, setDifficulty] = useState(10)
  const [quoteArray, setQuoteArray] = useState(props.quote.split(' '))

  const setBlank = (index) => {
    if (index % 5 === 0) {
      return true
    } else {
      false
    }
  }

  const adjustDifficulty = (value) => {
    setDifficulty(value)
  }

  const style = { width: 400, margin: 50 };
const marks = {
  1: 'Hard',
  5: 'Medium',
  14: 'Easy'
}

  return (
    <div style={quoteDiv}>
      <div style={{padding: '.4em 0'}}>
        <em>Fill in the blanks</em>
      </div>
      <Slider reverse min={1} max={15} marks={marks} step={1} onChange={adjustDifficulty} defaultValue={15}
      style={{margin: '2em'}}
      />
      <div style={quoteDiv}>
        {
          quoteArray.map((word, index) =>
            <BlankableWord
              word={word}
              key={index}
              blank={setBlank(index)}/>
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

FillBlanks.propTypes = {
  quote: PropTypes.string
}

export default FillBlanks
