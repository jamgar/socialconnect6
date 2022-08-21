import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload"
export default class extends Controller {
  static targets = [ "name", "output" ]

  connect() {
    this.nameTarget.addEventListener('change', () => {
      console.log(this.element)
      this.outputTarget.textContent = this.nameTarget.files[0].name
    })
  }
}
