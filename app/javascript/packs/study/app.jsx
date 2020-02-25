import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache, ApolloProvider } from '@apollo/client'
import StudyScreen from './study_screen.jsx'

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: '/graphql',
  })
})

const App = props =>  {
  return (
  <div>
    <StudyScreen />
  </div>
)}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('user_id')

  ReactDOM.render(
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>,
    document.getElementById('study'),
  )
})
