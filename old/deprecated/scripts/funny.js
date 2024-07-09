if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
} else {
    document.getElementById('location-info').innerText = "Geolocation is not supported by this browser.";
}

function showPosition(position) {
    var locationInfo = "Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude;
    document.getElementById('location-info').innerHTML = locationInfo;
}
