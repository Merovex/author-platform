import { Controller } from "@hotwired/stimulus"
import { format } from 'date-fns'

export default class extends Controller {
  connect() {
    // var thyme = this.element.getAttribute('datetime');
    // // var fmt = this.element.getAttribute('data-format');
    // var date = new Date(thyme);
    // // console.log(new Intl.RelativeTimeFormat("en", { numeric: 'always' }).format(0, 'day'));
    // // Output: today
    // // console.log(new Intl.RelativeTimeFormat("en", { numeric: 'auto' }).format(0, 'day'));
    // var output = format(Date.new, 'MM/dd/yyyy');
    // // var output = date.toString();
    // // var output = format(date)
    // output = format(new Date(2014, 1, 11), 'MM/dd/yyyy')
    // console.log(date, output)

    this.element.textContent = "FIX LOCAL TIME"
  }
}
