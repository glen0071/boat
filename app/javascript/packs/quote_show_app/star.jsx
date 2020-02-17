import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import { useQuery, gql } from '@apollo/client'

import style from 'react'

const GET_FAVORITE = gql`
  query Favorite($klass: String!, $userId: ID!, $id: ID!){
    favorite(klass: $klass, userId: $userId, id: $id) {
      id
    }
  }
`

const FavedStar = () => (
  <div
    className="fa fa-star"
    style={{ margin: '1em', color: 'gold' }}
    onClick={() => {setFave(true)}}>
  </div>
)
const EmptyStar = () => (
  <div
    className="fa fa-star-o"
    style={{ margin: '1em', color: 'gold' }}
    onClick={() => {setFave(true)}}>
  </div>
)

const Star = props => {
  const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
  const userId = props.userId
  const { loading, error, data } = useQuery(
    GET_FAVORITE, { variables: {
      klass: 'Quote',
      id: quoteId,
      userId: userId
    } }
  )

  return (
    <div>
      {
        data != undefined && data.favorite != null ? (
          <FavedStar />
        ) : (
          <EmptyStar />
        )
      }
    </div>
  )
}

export default Star
