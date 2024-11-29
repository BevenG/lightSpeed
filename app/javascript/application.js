import "@hotwired/turbo-rails";
import "controllers"; // Automatically loads Stimulus controllers in app/javascript/controllers
import "@popperjs/core"; // Required for Bootstrap dropdowns, tooltips, etc.
import "bootstrap";
import { Application } from "@hotwired/stimulus";

// If you want to manually register controllers:
import DatepickerController from "./controllers/datepicker_controller";
import GlowController from "./controllers/glow_controller";
import HoverController from "./controllers/hover_controller";
import MapController from "./controllers/map_controller";
import ReloadController from "./controllers/reload_controller";

// Initialize Stimulus application
const application = Application.start();

// Register controllers manually (only if "controllers" does not autoload them)
application.register("datepicker", DatepickerController);
application.register("glow", GlowController);
application.register("hover", HoverController);
application.register("map", MapController);
application.register("reload", ReloadController);

