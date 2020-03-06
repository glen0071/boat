import React from 'react'
import renderer from 'react-test-renderer'

import Word from './word.jsx'

test('it renders a word', () => {
  const component = renderer.create(
    <Word word="wordup"></Word>
  )

  let tree = component.toJSON();
  expect(tree).toMatchSnapshot()
})
