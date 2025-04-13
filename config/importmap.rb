# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "leaflet", to: "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
