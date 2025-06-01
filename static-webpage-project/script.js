document.getElementById('nameForm').addEventListener('submit', function(e) {
  e.preventDefault(); // prevent form from reloading the page

  const name = document.getElementById('nameInput').value.trim();

  if (name !== "") {
    document.getElementById('greeting').innerText = `Hello, ${name}! Welcome to the site 🎉`;
  } else {
    document.getElementById('greeting').innerText = '';
  }
});
