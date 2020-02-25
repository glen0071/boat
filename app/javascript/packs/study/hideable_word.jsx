import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const HideableWord = props => {
  const [visibility, setVisibility] = useState(true);

  return (
    <span
      onClick={() => {setVisibility(!visibility)}}
      className={visibility ? 'show' : 'hide'}
      style={{padding: '.1em', fontSize: '1.2rem'}}>
      {props.word}
    </span>
  )
}

export default HideableWord
