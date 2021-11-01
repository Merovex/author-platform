import { Controller } from "@hotwired/stimulus"
import { format, formatDistanceToNow } from 'date-fns'

// https://date-fns.org/v2.25.0/docs/formatDistanceToNowStrict
export default class extends Controller {
  connect() {
    const fmt = this.element.getAttribute('data-format');
    const date = new Date(this.element.dateTime);

    if (fmt == 'relative') {
      this.element.textContent = formatDistanceToNow(date, { addSuffix: true });
      this.refreshTimer = setInterval(() => {
        this.connect()
      }, 60000)
    }
    else { this.element.textContent = format(date, fmt); }
  }
}
