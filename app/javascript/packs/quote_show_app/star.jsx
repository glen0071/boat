import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import { useMutation, gql } from '@apollo/client'
import style from 'react'

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
  const [favoriteId, setFavoriteId] = useState(0)
  const [favorited, setFavorited] = useState(false)
  useEffect(() => { getAxios() })

  const quoteId = parseInt(window.location.pathname.match(/\d+/)[0])
  const userId = props.userId

  const GET_FAVORITE = `
    query GetFavorite{
      favorite(klass:"Quote", id: ${quoteId}, userId: ${userId}){
        id
      }
    }
  `

  const [favoriteInstance, { data: favoriteData }] = useMutation(FAVORITE_INSTANCE)
  const [unfavoriteInstance, { data: unfavoriteData }] = useMutation(UNFAVORITE_INSTANCE)

  const getAxios = () => {
    axios({
      url: '/graphql',
      method: 'post',
      data: {
        query: GET_FAVORITE,
      }
    }).then((result) => {
      if (result.data.data.favorite != null) {
        setFavoriteId(result.data.data.favorite.id)
        setFavorited(true)
      } else {
        setFavorited(false)
      }
    })
  }

  const sharedVariables = { klass: 'Quote', id: quoteId, userId: userId, }
  const unfaveVariables = { ...sharedVariables, favoriteId: favoriteId }

  return (
    <div
      className={favorited ? "fa fa-star" : "fa fa-star-o"}
      style={{ margin: '1em', color: 'gold' }}
      onClick={() => { favorited ?
        unfavoriteInstance( {variables: unfaveVariables} )
        :
        favoriteInstance( {variables: sharedVariables} )
      }}>
    </div>
  )
}

export default Star
