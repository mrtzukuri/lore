import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    const markers = JSON.parse(mapElement.dataset.markers);
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 12,
      center: [markers.lng, markers.lat],
    });
    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .addTo(map);

    fitMapToMarkers(map, markers);
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ markers.lng, markers.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

export { initMapbox };

