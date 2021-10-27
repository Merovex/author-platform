// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

import flatpickr from "flatpickr";
// import "flatpickr/dist/themes/dark.css";
document.onreadystatechange = () => {
  flatpickr(".flatpickr-input", {
    dateFormat: "Y-m-d H:i",
    enableTime: true,
  });
};