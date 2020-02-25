import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache, ApolloProvider } from '@apollo/client'
import HideText from './hide_text.jsx'

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: '/graphql',
  })
})

const App = props =>  {
  return (
  <div>
    <HideText />
  </div>
)}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('user_id')

  ReactDOM.render(
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>,
    document.getElementById('hide-word'),
  )
})
