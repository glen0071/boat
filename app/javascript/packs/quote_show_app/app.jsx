import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache, ApolloProvider } from '@apollo/client'
import Star from './star.jsx'

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: '/graphql',
  })
})

const App = props =>  {
  return (
  <div>
    <Star userId={props.userId} />
  </div>
)}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('user_id')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(
    <ApolloProvider client={client}>
      <App userId={data} />
    </ApolloProvider>,
    document.getElementById('fave-btn'),
  )
})
