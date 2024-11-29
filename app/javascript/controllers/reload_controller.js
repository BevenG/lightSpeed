import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["starships", "approve", "decline"]; // Define targets

  connect() {
    console.log("Reload controller connected");
    console.log("Starships target:", this.starshipsTarget);
    console.log("Approve target:", this.approveTarget);
    console.log("Decline target:", this.declineTarget);
  }

  async accept(event) {
    event.preventDefault();
    const response = await fetch(event.target.dataset.url, { method: "PATCH" });
    if (response.ok) {
      this.starshipsTarget.innerHTML = await response.text();
    }
  }

  async reject(event) {
    event.preventDefault();
    const response = await fetch(event.target.dataset.url, { method: "PATCH" });
    if (response.ok) {
      this.starshipsTarget.innerHTML = await response.text();
    }
  }
}
