// function onMouseOver(row) {
//   row.className = 'hover-row';
// }
//
// function onMouseOut(row) {
//   row.className = "";
// }

$(document).ready(function () {
  $("table > tbody > tr").hover(function(){
    $(this).addClass('hover-row')
  }, function() {
    $(this).removeClass('hover-row')
  });

  loadArticles();
});

function loadArticles() {
  var table = document.getElementById('jsarticles');
  table.appendChild(createLoadingElement());

  setTimeout(function() {
    $.get({
      url: 'http://localhost:3000/articles.json',
      complete: function(result) {
        clearElement('jsarticles');

        var articles = $.parseJSON(result.responseText);

        // create header
        var container = createContainer('table');

        articles.forEach(function(value) {

          var element = document.createElement('tr');
          var col = document.createElement('td');
          col.innerText = value.id;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.title;
          element.appendChild(col);

          container.appendChild(element);
        });

        $('#jsarticles')
          .append(container);
      }
    });
  }, 2000);
}

function createContainer(tagName) {
  var container = document.createElement(tagName);
  $(container).addClass('table');
  $(container).html("<tr><th>#</th><th>title</th></tr>");

  return container;
}

function clearElement(id) {
  var element = document.getElementById(id);
  element.innerText = "";
}

function createLoadingElement() {
  var element = document.createElement('div');

  element.innerText = "Loading...";

  return element;
}
