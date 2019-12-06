import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ markers.lng, markers.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      interactive: false
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .setPopup(popup)
      .addTo(map);

    fitMapToMarkers(map, markers);
  }
};


export { initMapbox };

