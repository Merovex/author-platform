import { Controller } from '@hotwired/stimulus'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ['status']
  static values = {
    delay: Number
  }

  connect() {
    this.timeout = null
    this.duration = this.delayValue || 1000
  }
  savenow() {
    this.statusTarget.textContent = 'Saving...'
    console.log('saving')
    Rails.fire(this.element, 'submit')
  }
  save() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.statusTarget.textContent = 'Saving...'
      console.log('saving')
      Rails.fire(this.element, 'submit')
    }, this.duration)
  }

  success() {
    this.setStatus('Saved!')
  }

  error() {
    this.setStatus('Unable to save!')
  }

  setStatus(message) {
    this.statusTarget.textContent = message

    this.timeout = setTimeout(() => {
      this.statusTarget.textContent = ''
    }, 2000)
  }
}