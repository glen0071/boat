import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const HideableWord = props => {
  const [blank, setBlank] = useState(props.blank);

  const guess = (event) => {
    if (simplerWord() === event.target.value.replace(/\s/g, '').toLowerCase()) {
      setBlank(false)
    }
  }

  const simplerWord = () => {
    return stripPunctiation(props.word.toLowerCase())
  }

  const stripPunctiation = (str) => {
    return str.replace(/(~|`|!|@|#|$|%|^|&|\*|\(|\)|{|}|\[|\]|;|:|\"|'|<|,|\.|>|\?|\/|\\|\||_|\+|=)/g,"")
  }

  return (
    <span
      style={{padding: '.1em', fontSize: '1.2rem'}}>
      {
        blank ?
        <input
          style={{width: "150px"}}
          onChange={guess}>
        </input>
        :
        <span>{props.word}</span>
      }
    </span>
  )
}

export default HideableWord
