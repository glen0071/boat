function fade(element) {
    var opacity = 1;
    var timer = setInterval(function () {
        if (opacity <= 0.1){
            clearInterval(timer);
            element.style.visibility = 'hidden';
        }
        element.style.opacity = opacity;
        element.style.filter = 'alpha(opacity=' + opacity * 100 + ")";
        opacity -= opacity * 0.1;
    }, 30);
}

var notice = document.getElementById("notice");
if (notice != null) {
  setTimeout(function(){ fade(notice); }, 1000);
}
