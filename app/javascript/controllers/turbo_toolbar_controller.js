import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toolbar"]
  connect() {
    console.log("click2hide controller connected")
  }

  // hide toolbar
  // action: "turbo-toolbar#hidetoolbar"
  hideToolbar() {

    this.element.parentElement.removeAttribute("src")
    // Remove src reference from parent frame element
    // Without this, turbo won't re-open the toolbar on subsequent click
    this.toolbarTurboFrame.src = null
    this.toolbarTarget.remove()
  }

  // hide toolbar on successful form submission
  // action: "turbo:submit-end->turbo-toolbar#submitEnd"
  submitEnd(e) {
    if (e.detail.success) {
      this.hidetoolbar()
    }
  }

  // hide toolbar when clicking ESC
  // action: "keyup@window->turbo-toolbar#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hidetoolbar()
    }
  }

  // hide toolbar when clicking outside of toolbar
  // action: "click@window->turbo-toolbar#closeBackground"
  closeBackground(e) {
    if (e && this.toolbarTarget.contains(e.target)) {
      return;
    }
    this.hidetoolbar()
  }
  get toolbarTurboFrame() {
    return document.querySelector("turbo-frame[id='toolbar']")
  }
}