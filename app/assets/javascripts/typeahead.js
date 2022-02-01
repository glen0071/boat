//// Author
// DOM elements
const authorsData = $('#author_choices').data('authors')
const authorTypeaheadWrapper = document.getElementById('author-typeahead-wrapper')
const authorQuoteNameInput = document.getElementById('quote_author_name')
const authorIdInput = document.getElementById('quote_author_id')
let authorSelected = false

// Functions
const removeAllChildNodes = (wrapper) => {
  while (wrapper.firstChild) {
    wrapper.removeChild(wrapper.firstChild);
  }
}

const selectAuthorName = (authorObject) => {
  authorIdInput.value = authorObject.id
  authorQuoteNameInput.value = authorObject.name
  removeAllChildNodes(authorTypeaheadWrapper)
  authorSelected = true
}

// Event listeners
authorQuoteNameInput.addEventListener('input',
  // Typeahead
  () => {
    
    removeAllChildNodes(authorTypeaheadWrapper)
    let inputValue = document.getElementById('quote_author_name').value

    const filteredAuthorNames = authorsData.filter(authorObject => authorObject.name.toLowerCase().includes(inputValue.toLowerCase()))
    
    filteredAuthorNames.forEach(authorObject => {
      const div = document.createElement('li')
      div.className = 'btn btn-light m-1 typeahead-button d-block' 
      div.id = authorObject.id 
      const textnode = document.createTextNode(authorObject.name);
      div.appendChild(textnode);
      div.addEventListener('mousedown', () => selectAuthorName(authorObject));
      authorTypeaheadWrapper.append(div)
    })

    if (inputValue === '') {
      removeAllChildNodes(authorTypeaheadWrapper)
      authorSelected = false
      authorIdInput.value = null
    }
  }
)

// Clear on failure to select
authorQuoteNameInput.addEventListener('blur', () => {
  if (!authorSelected && sourceIdInput.value == '') {
    authorQuoteNameInput.value = ''
    removeAllChildNodes(authorTypeaheadWrapper)
  }
});


//// Source
// DOM elements
const sourcesData = $('#source_choices').data('sources')
const sourceTypeaheadWrapper = document.getElementById('source-typeahead-wrapper')
const sourceTitleInput = document.getElementById('quote_source_title')
const sourceIdInput = document.getElementById('quote_source_id')
let sourceSelected = false

// Functions
const selectTitle = (sourceObject) => {
  sourceIdInput.value = sourceObject.id
  sourceTitleInput.value = sourceObject.title
  removeAllChildNodes(sourceTypeaheadWrapper)
  sourceSelected = true
}

// Event listeners
sourceTitleInput.addEventListener('input',
  // Typeahead
  () => {
    
    removeAllChildNodes(sourceTypeaheadWrapper)
    let inputValue = document.getElementById('quote_source_title').value
    const filteredSourceTitles = sourcesData.filter(sourceObject => sourceObject.title.toLowerCase().includes(inputValue.toLowerCase()))
    
    filteredSourceTitles.forEach(sourceObject => {
      const div = document.createElement('li')
      div.className = 'btn btn-light m-1 typeahead-button d-block' 
      div.id = sourceObject.id 
      const textnode = document.createTextNode(sourceObject.title);
      div.appendChild(textnode);
      div.addEventListener('mousedown', () => selectTitle(sourceObject));
      sourceTypeaheadWrapper.append(div)
    })

    console.log(inputValue)
    if (inputValue === '') {
      removeAllChildNodes(sourceTypeaheadWrapper)
      sourceSelected = false
      sourceIdInput.value = null
    }
  }
)

// Clear on failure to select
sourceTitleInput.addEventListener('blur', () => {
  if (!sourceSelected && sourceIdInput.value == '') {
    sourceTitleInput.value = ''
    removeAllChildNodes(sourceTypeaheadWrapper)
  }
});
