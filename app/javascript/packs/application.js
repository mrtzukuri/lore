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


const reviewsContainerEl = document.querySelector('.js-reviews-container');
const grid = new Isotope(reviewsContainerEl, {
  // options...
  itemSelector: '.grid-item',
  masonry: {
    columnWidth: 10
  },
});



const addDatePickerForm = function() {
  const startDateInputForm = document.getElementById('learning_opportunity_start_date');
  const endDateInputForm = document.getElementById('learning_opportunity_end_date');
  const formAdd = document.getElementById("new_learning_opportunity");
  if(form){
    flatpickr(startDateInput, {
      minDate: 'today',
      altInput: true,
      altFormat: "F j, Y",
      onChange: function(selectedDates, selectedDate) {
        if (selectedDate === '') {
          endDateInput.disabled = true;
        }
        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate() + 1);
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
    const endDateCalendar = flatpickr(endDateInput, {
      altInput: true,
      altFormat: "F j, Y",
      onChange: function() {
        submitButton.click();
      }
    });
  }
}

