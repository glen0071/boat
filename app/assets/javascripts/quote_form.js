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

// Topic filter
const filterTopics = function () {
  const inputValue = document.getElementById('topicFilterInput').value
  const topics = document.getElementsByClassName('topic-button')

  for (let i = 0; i < topics.length; i++) {
    let topicLabel = topics[i].textContent.toLowerCase()
    if (topicLabel.includes(inputValue.toLowerCase())) {
      topics[i].parentElement.style.display = "inline-block";
    } else {
      topics[i].parentElement.style.display = "none";
    }
  }
}
