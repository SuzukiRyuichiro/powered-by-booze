const searchBox = document.querySelector('#search');
const results = document.querySelector('.list-group');
// add the event listener
searchBox.addEventListener('keyup', (event) => {
  event.preventDefault();
  const httpRequest = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${searchBox.value}`;
  fetch(httpRequest)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = "";
      const topFive = data.drinks.slice(0, 4);
      topFive.forEach((drink) => {
        results.insertAdjacentHTML("beforeend", `<a href="https://makemeacocktail.com/recipes/s/?s=${drink.strDrink}" class="list-group-item list-group-item-action">${drink.strDrink}</a>`);
      });
    });
});
