import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { useQuery, gql } from '@apollo/client'
import HideWords from './hide_words.jsx'
import CompleteQuote from './complete_quote.jsx'
import FillBlanks from './fill_blanks.jsx'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom"

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
  const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
  const studyPath = `/quotes/${quoteId}/study`
  const guessQuotePath = `/quotes/${quoteId}/guess_quote`
  const fillBlanksPath = `/quotes/${quoteId}/fill_blanks`

  return (
    <div style={studyScreenStyle}>
      <Router>
        <nav style={{width: '100%'}}>
          <Link
            className="btn btn-secondary"
            style={{margin: '.2rem'}}
            to={studyPath}>Study</Link>
          <Link
            className="btn btn-secondary"
            style={{margin: '.2rem'}}
            to={guessQuotePath}>Guess Quote</Link>
          <Link
            className="btn btn-secondary"
            style={{margin: '.2rem'}}
            to={fillBlanksPath}>Fill in Blanks</Link>
        </nav>
      {
        data != undefined ?
          <div style={{width: '100%'}}>
          <Switch>
          <Route path={studyPath}>
            <HideWords quote={data.quote.text} />
          </Route >
          <Route path={guessQuotePath}>
            <CompleteQuote quote={data.quote.text} />
          </Route>
          <Route path={fillBlanksPath}>
            <FillBlanks quote={data.quote.text} />
          </Route>
          </Switch>
          </div>
        :
        null
      }
      </Router>

    </div>
  )
}

const studyScreenStyle = {
  display: 'flex',
  flexWrap: 'wrap',
}

export default HideWord
