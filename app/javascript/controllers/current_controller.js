import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current"
export default class extends Controller {
    static values = {
      user: String,
      message: String
  }
  static targets = [ "message" ]

  messageTargetConnected(element) {
    this.setClasses(element)

  }

  setClasses(element) {
    const conversationBox = document.querySelector('#conversation-box')
    const messages = conversationBox.querySelector("#messages-list")

    let user_id = element.getAttribute('data-current-message-value')
    if (this.userValue == user_id) {
      element.classList.add("text-right")
      element.getElementsByTagName("span")[0].classList.add("bg-gray-200")
    } else {
      element.classList.add("text-left")
      element.getElementsByTagName("span")[0].classList.add("bg-accent")
    }

    const messages_height = messages.scrollHeight;
    messages.scrollTop = messages_height;
  }
}
