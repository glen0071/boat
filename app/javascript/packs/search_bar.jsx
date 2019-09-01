import React from 'react'
import ReactDOM from 'react-dom'

const inputChange = (e) => {
  var value = e.target.value
}

const SearchBar = () => (
  <form
    className='form-inline main-search-form'
    >
    <input
      className='form-control mr-sm-2 main-search-bar'
      placeholder='Search by Text or Topic'
      id='main-search-input'
      autoComplete='off'
      onChange={inputChange}
      >
    </input>
    <input
      type='submit'
      className='btn btn-outline-success my-2 my-sm-0' >
    </input>
  </form>

)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SearchBar />,
    document.getElementById('search-bar-mount'),
  )
})
