const filterRefresh = function() {
  const form = document.getElementById("filter-form");
  const buttonEl = document.querySelector(".js-filter-submit")
  const priceSlider = document.getElementById('priceRange');
  const locationEl = document.getElementById('location');
  const meetupEL = document.getElementById('meetup');
  const onlineEL = document.getElementById('online');

  if(form){
    priceSlider.addEventListener('change', (event) => {
      buttonEl.click();
    })
    locationEl.addEventListener('blur', (event) => {
      buttonEl.click();
    })
    onlineEL.addEventListener('change', (event) => {
      buttonEl.click();
    })
    meetupEL.addEventListener('change', (event) => {
      buttonEl.click();
    })
  }
}

export { filterRefresh }
