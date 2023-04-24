// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:frame-render', (event) => {
  console.log("OLA");

  if (!event.target.matches('.scroll-to')) {
    return true;
  }
  event.target.scrollIntoView();
});