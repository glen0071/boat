import React, { useEffect } from 'react'
import ReactDOM from 'react-dom'

const TopicsArray = () => {
  const [topicsArray, setTopicsArray] = React.useState([]);

  useEffect(() => {
    fetch('/api/topics')
      .then(response => response.json())
      .then(data => {
        setTopicsArray(data)
      })
    }, []) // maybe remove square brackets so component did update?

    return (
      <ol>
        {topicsArray.map((topic) =>
          <li key={topic.id}>{topic.name}</li>
        )}
      </ol>
    )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TopicsArray />,
    document.body.appendChild(document.createElement('div')),
  )
})
