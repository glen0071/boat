import React, { useState } from "react"

function Quote(props) {
  const dynamicWords = props.text.split(' ').map((word, index) =>
    <Word text={word} key={word + index} />
  );
  return <div>{dynamicWords}</div>
}

function Word(props) {
  const [show, setShow] = useState(true);

  return (
    <button 
      style={{ margin: "2px", color: show ? 'black' : 'white' }}
      className="btn btn-outline-dark"
      onClick={() => setShow(show => !show)}
    >
        {props.text}
    </button>
  );
}

export default Quote
