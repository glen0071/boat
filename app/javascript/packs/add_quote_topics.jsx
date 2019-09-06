import React, { useEffect } from 'react'
import ReactDOM from 'react-dom'

const AddQuoteTopics = () => {
  useEffect(() => {
    fetch('/api/topics')
      .then(response => response.json())
      .then(data => console.log(data))
    }, [])

    return (
      <div>
        <ul>
          <li></li>
        </ul>
      </div>
    )

}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <AddQuoteTopics />,
    document.body.appendChild(document.createElement('div')),
  )
})
