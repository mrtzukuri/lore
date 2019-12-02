import "bootstrap";
import { toggleLevelSkills } from '../components/frontend';
import { priceSlider } from '../components/priceslider';
import { filterRefresh } from '../components/filter';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

toggleLevelSkills();
initMapbox();
priceSlider();
filterRefresh();
