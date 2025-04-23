

import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()

import "routes"

document.addEventListener("turbo:load", () => {
  const menuBtn = document.getElementById("menu-button");
  const mobileMenu = document.getElementById("mobile-menu");

  if (menuBtn && mobileMenu) {
    menuBtn.addEventListener("click", () => {
      mobileMenu.classList.toggle("hidden");
    });
  }
});
