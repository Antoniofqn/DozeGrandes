import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['home', 'away']

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  fill() {
    console.log(event);
    this.homeTarget.value = '<%= '
  }
}
