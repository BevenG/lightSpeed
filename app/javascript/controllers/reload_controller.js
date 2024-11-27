import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["starships", "approve", "decline"];

  connect() {
    console.log("Reload controller connected");
    console.log("Starships target:", this.starshipsTarget);
    console.log("Approve target:", this.approveTarget);
    console.log("Decline target:", this.declineTarget);
  }

  accept(event) {
    prevent default
    
    this.approveTarget.innerHTML = '<p>Approved</p>';
  }

  reject(event) {
    prevent default

    this.declineTarget.innerHTML = '<p>Declined</p>';
  }
}
