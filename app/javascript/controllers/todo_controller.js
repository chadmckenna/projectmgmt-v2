import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle() {
    this.element.requestSubmit()
  }
}
