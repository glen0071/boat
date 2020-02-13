import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache, ApolloProvider } from '@apollo/client'
import TopicsList from './topics_index_container.jsx'

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: '/graphql',
  })
})

const TopicsApp = props => (
  <div>
   <TopicsList />
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ApolloProvider client={client}>
      <TopicsApp />
    </ApolloProvider>,
    document.getElementById('root'),
  )
})
