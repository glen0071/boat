import React from 'react'
import ReactDOM from 'react-dom'

const SearchBar = () => (
  <h1>
    Test
  </h1>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SearchBar />,
    document.body.appendChild(document.createElement('div')),
  )
})
