import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache, ApolloProvider } from '@apollo/client'
import TopicShow from './topic_show.jsx'

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: '/graphql',
  })
})

const TopicsApp = props => (
  <div>
   <TopicShow />
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