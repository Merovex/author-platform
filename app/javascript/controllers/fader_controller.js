import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fader"
export default class extends Controller {
  static targets = ["element"]
  connect() {
    // console.log("Fader connected")
    setTimeout(() => this.element.remove(), 4000)
  }
}