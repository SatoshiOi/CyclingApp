import "leaflet";

document.addEventListener("turbo:load", () => {
  console.log("🌍 Turbo map script loaded");

  const mapElement = document.getElementById("map");
  if (!mapElement) return;

  const pageType = mapElement.dataset.page;
  console.log(`🔍 pageType: ${pageType}`);

  // すでにマップがあれば削除
  if (window.myMap && typeof window.myMap.remove === "function") {
    window.myMap.remove();
  }

  const map = L.map("map").setView([33.5597, 133.5311], 13); // 高知を中心
  window.myMap = map;

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution: "© OpenStreetMap contributors",
  }).addTo(map);

  console.log("🗺️ Leaflet map initialized!");
  // 🟩 showページ

  if (pageType === "show") {
    drawFromHiddenInput("waypointsInput");
  }

  // 🟦 new/edit ページ
  if (pageType === "new" || pageType === "edit") {
    let waypoints = [];

    // 編集ページの場合、既存のポイントを読み込み
    const hiddenInput = document.getElementById("waypoints");
    if (hiddenInput && hiddenInput.value) {
      try {
        const parsed = JSON.parse(hiddenInput.value);
        if (Array.isArray(parsed)) {
          waypoints = parsed;
          parsed.forEach((p, i) => {
            const latlng = [p.lat, p.lng];
            L.marker(latlng).addTo(map).bindPopup(`地点 ${i + 1}`);
          });
          drawPolyline();
          map.fitBounds(waypoints.map(p => [p.lat, p.lng]));
        }
      } catch (e) {
        console.warn("🛑 JSON parse error:", e);
      }
    }

    // マップクリックでマーカー追加
    map.on("click", function (e) {
      const latlng = [e.latlng.lat, e.latlng.lng];
      waypoints.push({ lat: latlng[0], lng: latlng[1] });

      L.marker(latlng).addTo(map).bindPopup(`地点 ${waypoints.length}`).openPopup();
      drawPolyline();

      // hiddenに反映
      if (hiddenInput) hiddenInput.value = JSON.stringify(waypoints);
    });

    // リセットボタン処理
    const resetButton = document.getElementById("resetRoute");
    if (resetButton) {
      resetButton.addEventListener("click", () => {
        waypoints = [];
        hiddenInput.value = "";
        map.eachLayer((layer) => {
          if (layer instanceof L.Marker || layer instanceof L.Polyline) {
            map.removeLayer(layer);
          }
        });
        L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
          maxZoom: 19,
          attribution: "© OpenStreetMap",
        }).addTo(map);
      });
    }

    function drawPolyline() {
      if (window.myPolyline) {
        map.removeLayer(window.myPolyline);
      }
      const latlngs = waypoints.map(p => [p.lat, p.lng]);
      if (latlngs.length >= 2) {
        window.myPolyline = L.polyline(latlngs, { color: "blue" }).addTo(map);
      }
    }
  }

  function drawFromHiddenInput(inputId) {
    const hiddenInput = document.getElementById(inputId);
    if (!hiddenInput || !hiddenInput.value) return;

    let waypoints = [];

    try {
      const parsed = JSON.parse(hiddenInput.value);
      if (Array.isArray(parsed)) {
        waypoints = parsed;
      }
    } catch (e) {
      console.warn("🛑 JSON parse error:", e);
    }

    const latlngs = waypoints
      .map(p => [parseFloat(p.lat), parseFloat(p.lng)])
      .filter(p => !isNaN(p[0]) && !isNaN(p[1]));

    latlngs.forEach((coords, i) => {
      L.marker(coords).addTo(map).bindPopup(`地点 ${i + 1}`);
    });

    if (latlngs.length >= 2) {
      const polyline = L.polyline(latlngs, { color: "blue" }).addTo(map);
      map.fitBounds(polyline.getBounds());
    } else if (latlngs.length === 1) {
      map.setView(latlngs[0], 13);
    }
  }
});
