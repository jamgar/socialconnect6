import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  initialize() {
    this.hide = this.hide.bind(this)
  }

  connect() {
    this.show()
  }

  show() {
    setTimeout(this.hide, 3000)
  }

  hide() {
    this.element.remove()
  }
}
