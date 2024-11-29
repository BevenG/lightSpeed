import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["track"]; // Define the track as a target to control its behavior

  connect() {
    this.scrollSpeed = 1; // Default scroll speed
    this.defaultDuration = 15; // Default animation duration in seconds
    this.updateAnimationDuration();
  }

  updateAnimationDuration() {
    // Adjust the animation speed based on scrollSpeed
    this.trackTarget.style.animationDuration = `${this.defaultDuration / this.scrollSpeed}s`;
  }

  onWheel(event) {
    event.preventDefault();
    const delta = Math.sign(event.deltaY);
    this.scrollSpeed += delta * 0.1; // Adjust speed incrementally
    this.scrollSpeed = Math.max(0.5, Math.min(this.scrollSpeed, 5)); // Clamp speed to a range
    this.updateAnimationDuration();
  }

  pauseAnimation() {
    this.trackTarget.style.animationPlayState = "paused";
  }

  resumeAnimation() {
    this.trackTarget.style.animationPlayState = "running";
  }
}
