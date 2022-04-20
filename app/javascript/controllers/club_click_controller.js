import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['home', 'away', 'club', 'foo']

  connect() {
    this.fooValue = false
  }

  fill() {
    let teamOne = event.srcElement.id;
    if (this.fooValue == true) {
      this.awayTarget.value = teamOne;
      this.fooValue = false;
    } else {
      this.homeTarget.value = teamOne;
      this.fooValue = true;
    }
  }
}
