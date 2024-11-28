import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["track", "card"]; // Define targets for the track and cards

  connect() {
    this.position = 0;
    this.direction = 1; // 1 for forward, -1 for backward

    this.carouselWidth = this.element.offsetWidth; // Width of the carousel container
    this.trackWidth = this.trackTarget.scrollWidth; // Total width of the track

    if (this.trackWidth > this.carouselWidth) {
      this.startScrolling();
    }
  }

  startScrolling() {
    this.animationFrame = requestAnimationFrame(this.scroll.bind(this));
  }

  scroll() {
    this.position += this.direction * 2; // Adjust the speed here (e.g., 2 for normal speed)
    this.trackTarget.style.transform = `translateX(-${this.position}px)`;

    // Reverse direction if we reach the ends
    if (this.position + this.carouselWidth >= this.trackWidth || this.position <= 0) {
      this.direction *= -1;
    }

    this.animationFrame = requestAnimationFrame(this.scroll.bind(this));
  }

  disconnect() {
    // Clean up when the controller is disconnected
    if (this.animationFrame) {
      cancelAnimationFrame(this.animationFrame);
    }
  }
}
