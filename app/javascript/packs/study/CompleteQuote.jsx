import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'
import Word from './Word'
import PropTypes from 'prop-types'

const CompleteQuote = props => {
  const [allWords, setAllWords] = useState(props.quote.split(' '))
  const [displayWords, setDisplayWords] = useState([])
  const [wordIndex, setWordIndex] = useState(1)
  const [inputValue, setInputValue] = useState('')

  const revealNextWord = () => {
    setWordIndex(wordIndex + 1)
    setDisplayWords(allWords.slice(0, wordIndex))
  }

  const checkWord = (event) => {
    setInputValue(event.target.value.replace(/\s/g, ''))

    if (currentWord()  === '.') {
      wordMatched()
    } else if (currentWord() === event.target.value.replace(/\s/g, '').toLowerCase()) {
      wordMatched()
    }
  }

  const stripPunctiation = (str) => {
    return str.replace(/(~|`|!|@|#|$|%|^|&|\*|\(|\)|{|}|\[|\]|;|:|\"|'|<|,|\.|>|\?|\/|\\|\||_|\+|=)/g,"")
  }

  const currentWord = () => {
    return stripPunctiation(allWords[wordIndex - 1]).toLowerCase()
  }

  const wordMatched = () => {
    revealNextWord()
    setInputValue('')
  }

  return (
    <div
      style={quoteDiv}>
      {
        displayWords.map((word, index) =>
          <Word word={word}
            key={index}
            index={index}
          />
        )
      }
      <input
        placeholder={"Type Next Word"}
        onChange={checkWord}
        value={inputValue}
        className="form-control"
        style={{margin: '.4em 0'}}
        />
      <button
        style={{marginTop: '.4em'}}
        className="btn btn-secondary form-control"
        onClick={revealNextWord}>Next Word</button>
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

CompleteQuote.propTypes = {
  quote: PropTypes.string
}

export default CompleteQuote
