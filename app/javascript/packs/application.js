import "bootstrap";
import { toggleLevelSkills } from '../components/frontend';
import { priceSlider } from '../components/priceslider';
import { filterRefresh } from '../components/filter';
import { addDatePicker } from '../components/datepicker';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';


toggleLevelSkills();
initMapbox();
priceSlider();
filterRefresh();
initAutocomplete();
addDatePicker();
