import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()

document.addEventListener("turbo:load", () => {
  console.log("Turbo is working!");
  // 地図初期化コードをここに！
});
