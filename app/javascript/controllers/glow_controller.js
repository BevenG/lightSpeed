import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Glow controller connected to:", this.element);
    this.setupLightning();
  }


  setupLightning() {
    const button = this.element.querySelector(".lightning-button");
    if (!button) {
      console.warn("No .lightning-button found in the scope of this controller.");
      return;
    }

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
      lightning.style.width = `2px`; // Always thin
      lightning.style.height = `${Math.random() * 120 + 80}px`; // Random height
      lightning.style.left = `${Math.random() * 100 - 50}%`; // Random horizontal position
      lightning.style.bottom = "0"; // Start from the bottom of the button
      lightning.style.transform = `rotate(${Math.random() * 45 - 22.5}deg)`; // Random angle

      // Append to the container
      container.appendChild(lightning);

      // Remove after animation
      setTimeout(() => lightning.remove(), 200);
    }
  }
}
