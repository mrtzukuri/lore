import flatpickr from "flatpickr";

const addDatePicker = function() {
  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');
  const form = document.getElementById("filter-form");
  const submitButton = document.querySelector(".js-filter-submit");
  if(form){
    flatpickr(startDateInput, {
      minDate: 'today',
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
      onChange: function() {
        submitButton.click();
      }
    });
  }
}

export { addDatePicker }
