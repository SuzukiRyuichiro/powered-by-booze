import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "results" ]

  connect() {
    this.resultsTarget.insertAdjacentHTML('beforeend', '<h1>Hello</h1>');
  }
}
