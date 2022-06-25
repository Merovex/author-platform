// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
// const getMethods = (obj) => {
//   let properties = new Set()
//   let currentObj = obj
//   do {
//     Object.getOwnPropertyNames(currentObj).map(item => properties.add(item))
//   } while ((currentObj = Object.getPrototypeOf(currentObj)))
//   return [...properties.keys()].filter(item => typeof obj[item] === 'function')
// }
import LocalTime from "local-time"
LocalTime.start()
// console.log(getMethods(LocalTime))
