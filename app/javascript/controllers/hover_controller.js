// app/javascript/controllers/glow_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Glow controller connected!");
    this.setupLightning();
  }

  setupLightning() {
    const button = this.element.querySelector(".lightning-button");

    // Generate lightning bolts on hover
    button.addEventListener("mouseenter", () => this.generateLightning(button));
  }

  generateLightning(button) {
    const container = this.element;

    // Generate multiple bolts for an intense effect
    for (let i = 0; i < 6; i++) {
      const lightning = document.createElement("div");
      lightning.className = "lightning-effect";

      // Randomize bolt properties
      lightning.style.width = `${Math.random() * 3 + 1}px`; // Thin lightning
      lightning.style.height = `${Math.random() * 120 + 80}px`; // Random height
      lightning.style.left = `${Math.random() * 100 - 50}%`; // Position around button
      lightning.style.bottom = "0"; // Start from the button
      lightning.style.transform = `rotate(${Math.random() * 90 - 45}deg)`; // Random angle

      // Append to container and remove after animation
      container.appendChild(lightning);
      setTimeout(() => lightning.remove(), 200); // Remove after animation
    }
  }
}

