import React from 'react'
import ReactDOM from 'react-dom'
import ApolloClient from 'apollo-boost'
import { ApolloProvider } from '@apollo/react-hooks';
import QuotesList from './quotes_list.jsx'

const client = new ApolloClient({
  uri: '/graphql',
})

const App = props => (
  <div>
    <QuotesList />
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>,
    document.getElementById('root'),
  )
})
