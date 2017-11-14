const button = document.querySelectorAll('#invoice_search_button')[0];

button.addEventListener('click', (e) => {
  e.preventDefault();
  const elements = document.querySelectorAll('tbody tr');
  const query = document.querySelectorAll('#invoice_search_input')[0].value.toLowerCase();
  console.log(query);
  console.log(elements);

  elements.forEach(function(row) {
    const text = row.innerText.toLowerCase();
    console.log(text);
    console.log(query);
      row.hidden = true
    if (text.includes(query)) {
      row.hidden = false
    }
  });
});
