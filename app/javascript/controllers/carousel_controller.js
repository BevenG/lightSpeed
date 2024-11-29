import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["track", "card"];

  connect() {
    this.index = 0;
    this.cardWidth = this.cardTargets[0]?.offsetWidth || 0;
    this.updatePosition();
  }

  prev() {
    this.index = Math.max(this.index - 1, 0);
    this.updatePosition();
  }

  next() {
    this.index = Math.min(this.index + 1, this.cardTargets.length - 1);
    this.updatePosition();
  }

  updatePosition() {
    const offset = -(this.index * (this.cardWidth + 20)); // 20px gap
    this.trackTarget.style.transform = `translateX(${offset}px)`;
  }
}

