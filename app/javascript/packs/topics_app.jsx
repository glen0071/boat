import React from 'react'
import ReactDOM from 'react-dom'
import ApolloClient from 'apollo-boost'
import { ApolloProvider } from '@apollo/react-hooks';
import TopicsList from './topics_index.jsx'

const client = new ApolloClient({
  uri: '/graphql',
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
