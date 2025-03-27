// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/javascript/application.js
import "@hotwired/turbo-rails"   // ← Turbo を読み込む
// import "controllers"         // Stimulusを使うなら
// 他にも必要なライブラリを import 可能
document.addEventListener("turbo:load", () => {
  console.log("Turbo is working!");
});
// document.addEventListener("turbo:load", function() {
//   const mapElement = document.getElementById('map');
//   if (!mapElement) {
//     // このページには #map がないので、処理をスキップ
//     return;
//   }

//   // 既にあるマップを削除
//   if (window.myMap) {
//     window.myMap.remove();
//   }
//   // 地図の初期化処理
//    window.myMap = L.map('map').setView([35.681236, 139.767125], 13);
// });
