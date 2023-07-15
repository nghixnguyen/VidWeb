var container = document.getElementById('main-content');
var url = "https://jsonplaceholder.typicode.com/albums/2/photos";
var photoCountContainer = document.getElementById('photo-count-container');

function fadeOut(ev) {
    const divElement = ev.currentTarget;
    divElement.style.opacity = 1;
    var counter = 1;
    var timer = setInterval(function () {
        counter -= 0.05;
        divElement.style.opacity = counter;
        if (counter < 0) {
            clearInterval(timer);
            container.removeChild(divElement);
            photoCountContainer.textContent = "There are " + container.childElementCount + " photo(s) being shown";
        }
    }, 10);
}

function buildCardDOMAPI(data) {
    var cardDiv = document.createElement('div');
    cardDiv.setAttribute('class', "photo-card");
    var imgTag = document.createElement('img');
    imgTag.src = data.thumbnailUrl;
    imgTag.alt = "some photo";
    var titleTag = document.createElement('p');
    titleTag.appendChild(document.createTextNode(data.title));
    cardDiv.appendChild(imgTag);
    cardDiv.appendChild(titleTag);
    cardDiv.addEventListener('click', fadeOut);
    return cardDiv;
}

fetch(url)
    .then(function (resp) {
        return resp.json();
    })
    .then(function (data) {
        var cards = data.map(function (photo) {
            return buildCardDOMAPI(photo);
        });
        container.append(...cards);
        photoCountContainer.textContent = "There are " + container.childElementCount + " photo(s) being shown";
    });
