import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('learning_opportunity_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
