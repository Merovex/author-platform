# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
# pin "@rails/activestorage", to: "activestorage.esm.js"

# Use node modules from a JavaScript CDN by running ./bin/importmap
pin "application"
pin "helpers/local-time"
pin "@hotwired/turbo-rails", to: "turbo.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/stimulus-importmap-autoloader", to: "stimulus-importmap-autoloader.js"
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"
pin "stimulus-flatpickr", to: "https://ga.jspm.io/npm:stimulus-flatpickr@3.0.0-0/dist/index.m.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"

pin "date-fns", to: "https://ga.jspm.io/npm:date-fns@2.25.0/esm/index.js"
