import "bootstrap";
import { toggleLevelSkills } from '../components/frontend';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

toggleLevelSkills();
initMapbox();
initAutocomplete();
