var map = L.map('map').setView([13.406680626904713, 123.3751482856709], 18); // Initial location at CSPC

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    minZoom: 17,
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

// Custom icon
var eateryIcon = L.icon({
    iconUrl: '../static/img/location2.png',
    iconSize: [45, 42], // size of the icon
    iconAnchor: [19, 38], // point of the icon which will correspond to marker's location
    popupAnchor: [0, -38] // point from which the popup should open relative to the iconAnchor
});

// eateries variable declared in "base.html"
// Add markers for each eatery with permanent labels
eateries.forEach(eatery => {
    var marker = L.marker([eatery.lat, eatery.lng], {
        icon: eateryIcon,
        alt: eatery.name,
        className: 'eatery-marker',
        title: eatery.name
    }).addTo(map);

    // Create a label for each marker
    var label = L.tooltip({
        permanent: true,
        direction: 'top',
        className: 'eatery-label'
    })
    .setContent(eatery.name)
    .setLatLng([eatery.lat + 0.0001, eatery.lng + 0.00002]);

    label.addTo(map);

    // Add click event to submit form
    marker.on('click', function() {
        document.getElementById('selected-eatery').value = eatery.name;
        document.getElementById('eatery-selection-form').submit();
    });
});