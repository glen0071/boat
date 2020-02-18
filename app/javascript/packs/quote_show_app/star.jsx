import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import { useMutation, useQuery, gql } from '@apollo/client'

import style from 'react'

const GET_FAVORITE = gql`
  query Favorite($klass: String!, $userId: ID!, $id: ID!){
    favorite(klass: $klass, userId: $userId, id: $id) {
      id
    }
  }
`

const FAVORITE_INSTANCE = gql`
  mutation FavoriteInstance($klass: String!, $id: Int!, $userId: Int!){
    favoriteInstance(input: {klass: $klass, id: $id, userId: $userId}) {
      favorite {
        id
      }
    }
  }
`

const UNFAVORITE_INSTANCE = gql`
  mutation UnfavoriteInstance(
    $klass: String!,
    $id: Int!,
    $userId: Int!,
    $favoriteId: ID!
  ){
    unfavoriteInstance(input: {klass: $klass, id: $id, userId: $userId, favoriteId: $favoriteId}) {
      errors
      messages
    }
  }
`

const Star = props => {
  const [favoriteId, setFavoriteId] = useState(0);
  const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
  const userId = props.userId
  const [favoriteInstance, { data: favoriteData }] = useMutation(FAVORITE_INSTANCE)
  const [unfavoriteInstance, { data: unfavoriteData }] = useMutation(UNFAVORITE_INSTANCE)
  const { loading, error, data: queryData } = useQuery(
    GET_FAVORITE, { variables: {
      klass: 'Quote',
      id: quoteId,
      userId: userId
    } }
  )


  return (
    <div>
      {
        queryData != undefined && queryData.favorite != null ? (
          <div
            className="fa fa-star"
            style={{ margin: '1em', color: 'gold' }}
            onClick={() => {
              unfavoriteInstance(
                {variables: {
                  klass: 'Quote',
                  id: quoteId,
                  userId: userId,
                  favoriteId: queryData.favorite.id
                }}
              )
            }}>
          </div>
        ) : (
          <div
            className="fa fa-star-o"
            style={{ margin: '1em', color: 'gold' }}
            onClick={() => {
              favoriteInstance(
                {variables: {
                  klass: 'Quote',
                  id: quoteId,
                  userId: userId
                }}
              )
            }}>
          </div>
        )
      }
    </div>
  )
}

export default Star
