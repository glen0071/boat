// DOM elements
const authorsData = $('#author_choices').data('authors')
const typeaheadWrapper = document.getElementById('typeahead-wrapper')
const quoteNameInput = document.getElementById('quote_author_name')
const quoteIdInput = document.getElementById('quote_author_id')

// Functions
function removeAllChildNodes() {
  while (typeaheadWrapper.firstChild) {
    typeaheadWrapper.removeChild(typeaheadWrapper.firstChild);
  }
}

function selectName(authorObject) {
  quoteIdInput.value = authorObject.id
  quoteNameInput.value = authorObject.name
  removeAllChildNodes()
}

quoteNameInput.addEventListener('input',
  () => {
    
    removeAllChildNodes()
    let inputValue = document.getElementById('quote_author_name').value

    const filteredAuthorNames = authorsData.filter(authorObject => authorObject.name.toLowerCase().includes(inputValue.toLowerCase()))
    
    filteredAuthorNames.forEach(authorObject => {
      const div = document.createElement('li')
      div.className = 'btn btn-light m-1 typeahead-button d-block' 
      div.id = authorObject.id 
      const textnode = document.createTextNode(authorObject.name);
      div.appendChild(textnode);
      div.addEventListener('click', () => selectName(authorObject));
      typeaheadWrapper.append(div)
    })

    if (inputValue === '') {
      removeAllChildNodes()
    }
  }
)

