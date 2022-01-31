var topicButtons = document.getElementsByClassName('topic-button')
for (let i = 0; i < topicButtons.length; i++) {
  topicButtons[i].addEventListener('click', function() {
    if (topicButtons[i].nextSibling.checked == true) {
      topicButtons[i].classList.remove('active')  
    } else {
      topicButtons[i].classList.add('active')  
    }
  });
  if (topicButtons[i].nextSibling.checked == true) {
    topicButtons[i].classList.add('active')
  }
}

// new source
var sourceSelect = document.getElementById('quote_source_id')
var newSourceInput = document.getElementById('quote_new_source')

newSourceInput.style.display = "none";
sourceSelect.addEventListener('change', function() {
  if (sourceSelect.value === '') {
    newSourceInput.style.display = "block";
  } else {
    newSourceInput.style.display = "none";
  }
})

// Topic filter
const filterTopics = function () {
  const inputValue = document.getElementById('topicFilterInput').value
  const topics = document.getElementsByClassName('topic-button')

  for (let i = 0; i < topics.length; i++) {
    let topicLabel = topics[i].textContent.toLowerCase()
    if (topicLabel.includes(inputValue)) {
      topics[i].style.display = "inline-block";
    } else {
      topics[i].style.display = "none";
    }
  }
}


