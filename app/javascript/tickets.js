window.initMap = function initMap(coordinates){
  var ticketCoordinates = coordinates.map(coordinates => {
    return new google.maps.LatLng(+coordinates[0], +coordinates[1])
  })
  var map = new google.maps.Map(document.getElementById('map'), {
    center: ticketCoordinates[0],
    zoom: 8
  });
  
  var ticketPath = new google.maps.Polyline({
    path: ticketCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  ticketPath.setMap(map);
}