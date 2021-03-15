import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "results", "input" ]

  connect() {

  }

  fetchResults() {
    if (this.inputTarget.value === ""){
      this.resultsTarget.innerHTML = "";
    } else {
      fetch(`/api/v1/search/${this.inputTarget.value}`)
      .then(response => response.json())
      .then((data) => {
        if (data.length === 0){
          this.resultsTarget.innerHTML = "";
        } else {
          this.resultsTarget.innerHTML = "";
          data.forEach((cocktail) => {
            const list = `<a href="/cocktails/${cocktail.id}" class="list-group-item list-group-item-action-active">${cocktail.name}</a>`;
            this.resultsTarget.insertAdjacentHTML("beforeend", list);
        })
        }
      })
    }
  }
}
