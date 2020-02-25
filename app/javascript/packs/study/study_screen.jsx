import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'
import HideWords from './hide_words.jsx'
import CompleteQuote from './complete_quote.jsx'
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import 'react-tabs/style/react-tabs.css';

const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
const GET_QUOTE = gql`
query Quote{
  quote(id: ${quoteId}){
   	id
  	text
    bestTitle
  }
}
`

const HideWord = props => {
  const { loading, error, data } = useQuery(GET_QUOTE)

  return (
    <div style={quoteDiv}>
      {
        data != undefined ?
        <Tabs style={{width: '100%'}}>
          <TabList>
            <Tab>Practice</Tab>
            <Tab>Test</Tab>
          </TabList>
          <TabPanel>
          <HideWords quote={data.quote.text} />
          </TabPanel>
          <hr/>
          <TabPanel>
          <CompleteQuote quote={data.quote.text} />
          </TabPanel>
        </Tabs>
        :
        null
      }
    </div>
  )
}

const quoteDiv = {
  display: 'flex',
  flexWrap: 'wrap',
}

export default HideWord
