import { Controller } from "@hotwired/stimulus"
import { format, formatDistanceToNow } from 'date-fns'

// https://date-fns.org/v2.25.0/docs/formatDistanceToNowStrict
export default class extends Controller {
  connect() {
    var thyme = this.element.dateTime
    var fmt = this.element.getAttribute('data-format');
    var date = new Date(thyme);

    if (fmt == 'relative') { this.element.textContent = formatDistanceToNow(date, { addSuffix: true }); }
    else { this.element.textContent = format(date, fmt); }
  }
}
