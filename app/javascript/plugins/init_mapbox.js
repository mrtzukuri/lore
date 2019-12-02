import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

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
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${markers.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

    const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

    new mapboxgl.Marker(element)
      .setLngLat([ markers.lng, markers.lat ])
      .setPopup(popup)
      .addTo(map);

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

    fitMapToMarkers(map, markers);
  }
};


export { initMapbox };

