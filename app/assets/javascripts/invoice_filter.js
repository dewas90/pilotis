
const searchButton = document.querySelectorAll('#invoice_search_button')[0];
let tagArray = [];
let liArray = [];

function addRemoveListener(button) {
  button.addEventListener('click', (e) => {
    e.preventDefault();
      //  REMOVE TAG FROM ARRAY
      const tag = button.parentElement.innerText;
      const index = tagArray.indexOf(tag.replace(/[\W]+/g, ''));
      tagArray.splice(index, 1);
      // REMOVE HTML ELEMENT
      button.parentElement.remove();

      const elements = document.querySelectorAll('tbody tr');


      elements.forEach(function(row) {
        const tagElements = row.querySelector(".data-tags");
        console.log(tagElements);
        console.log(tagArray.length);
        if (tagArray.length == 0)  {
         row.hidden = false
        }
        console.log(tagElements);
        if (tagElements != null) {
          let tags = tagElements.innerText.split(" ").filter(function(entry) { return /\S/.test(entry); });;
          tagArray.forEach(function(tag){
            if (tags.includes(tag)) {
              const index = tags.indexOf(tag.replace(/[\W]+/g, ''));
              tags.splice(index, 1);
              console.log(tags)
              tagElements.value = tags
            }
            if (tagArray.toString() == tags.toString()) {
              row.hidden = false
            }
            else {
             row.hidden = true
            }
          });
        }
      });

});
};


// removeButton.addEventListener('click', (e) => {
//   e.preventDefault();

// });




searchButton.addEventListener('click', (e) => {
  e.preventDefault();
  const elements = document.querySelectorAll('tbody tr');
  const query = document.querySelectorAll('#invoice_search_input')[0].value.toLowerCase();
  const list = document.getElementById('tags-list');
  document.getElementById('invoice_search_input').value = "";

  // PUSH TAG INTO TAGS
  // COMPUTE ARRAY OF TAGS
  if (!(query == "")) {
    console.log("hi");
    list.insertAdjacentHTML("afterBegin", `<li id="tag"><p>${query}</p><a id="tag-button-${query}" href="#"><i class="fa fa-times-circle" aria-hidden="true"></i></a></li>`);

    tagArray.push(query.replace(/[\W]+/g, ''));
    let button = document.getElementById(`tag-button-${query}`)
    addRemoveListener(button);
  };

// "carmen test paid"
// on second iteration only check on rows where hidden is false

console.log(tagArray)
elements.forEach(function(row) {
  const tagElements = row.querySelector(".data-tags");
  if (!(tagElements == null)) {
    let tags = tagElements.innerText.split();
    const text = row.innerText.toLowerCase();
    tagArray.forEach(function(tag){
      if (text.includes(tag)) {
        if (!(tags.includes(tag))) {
          tagElements.insertAdjacentHTML("afterbegin", tag + " ")
        }
      }
      else {
        row.hidden = true
      }
    });
  }
});
});





