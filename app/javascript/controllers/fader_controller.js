import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fader"
export default class extends Controller {
  static targets = ["element"]
  connect() {
    setTimeout(() => this.element.remove(), 4000)
  }
}