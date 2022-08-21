import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  delete(event) {
    let confirmed = confirm('Are you sure you want to delete?')

    if (!confirmed) {
      event.preventDefault()
    }
  }
}
