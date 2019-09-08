import React, { useEffect } from 'react'
import ReactDOM from 'react-dom'

function topicButtonClass (state) {
  if (state === 'active') {
    return "btn btn-outline-info active"
  } else {
    return "btn btn-outline-info"
  }
}

const TopicButton = (props) => {
  const [active, setActive] = React.useState(null);

  function toggleActive () {
    if (active == 'active') {
      setActive(null)
    } else {
      setActive('active')
    }
  }

  return (
    <label
      htmlFor={`quote_topic_ids_${props.topic.id}`}
      onClick={() => toggleActive() }
      style={TopicButtonStyles.topicLabel}
      className={topicButtonClass(active)}
      key={props.topic.id}>{props.topic.name}</label>
  )
}

const TopicButtonStyles = {
  topicLabel: {
    margin: '5px'
  }
}

const sortByName = (a,b) => {
  if ( a.name < b.name ){
  return -1;
}
if ( a.name > b.name ){
  return 1;
}
  return 0;
}

const TopicsArray = () => {
  const [topicsArray, setTopicsArray] = React.useState([]);

  useEffect(() => {
    fetch('/api/topics')
      .then(response => response.json())
      .then(data => {
        console.log(data);
        // setTopicsArray(data)
      })
    }, []) // maybe remove square brackets so component did update?

    return (
      <ol>
        {topicsArray.sort((a,b) => sortByName(a,b)).map((topic) =>
          <TopicButton topic={topic} />
        )}
      </ol>
    )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TopicsArray />,
    document.body.appendChild(document.createElement('div')),
  )
})

const Styles = {
  topicLabel: {
    margin: '5px'
  }
}
