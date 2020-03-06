import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Word = props => {
  const [visibility, setVisibility] = useState(true);

  return (
    <span
      style={{padding: '.1em', fontSize: '1.2rem'}}>
      {props.word}
    </span>
  )
}

Word.propTypes = {
  word: PropTypes.string
}

export default Word
