// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

// using CDN Version
// import flatpickr from "flatpickr";
// document.onreadystatechange = () => {
//   flatpickr(".flatpickr-input", {
//     dateFormat: "Y-m-d H:i",
//     enableTime: true,
//     time_24hr: true
//   });
// };


// import "helpers/local-time"
// import LocalTime from "helpers/local-time"
// window.onload = () => {
// LocalTime.start()
// alert("LOADING")
console.log(Intl.DateTimeFormat().resolvedOptions().timeZone)
tz_offset = new Date().getTimezoneOffset()
console.log(tz_offset)
// }

