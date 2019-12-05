const filterRefresh = function() {
  const form = document.getElementById("filter-form");
  const buttonEl = document.querySelector(".js-filter-submit")
  const priceSlider = document.getElementById('rs-range-line');
  const locationEl = document.getElementById('location');
  const meetupEL = document.getElementById('meetup');
  const onlineEL = document.getElementById('online');
  const eventEL = document.getElementById('event');
  const sortAscEL = document.getElementById('asc');
  const sortDescEL = document.getElementById('desc');
  const sortLinkEl = document.getElementById('sort-by-price');


  if(form){
    priceSlider.addEventListener('change', (event) => {
      buttonEl.click();
    })
    locationEl.addEventListener('keyup', (event) => {
      buttonEl.click();
    })
    onlineEL.addEventListener('change', (event) => {
      buttonEl.click();
    })
    meetupEL.addEventListener('change', (event) => {
      buttonEl.click();
    })
    eventEL.addEventListener('change', (event) => {
      buttonEl.click();
    })
    sortLinkEl.addEventListener('click', (event) => {
      if(sortAscEL.checked == true){
        sortDescEL.checked = true;
      } else {
        sortAscEL.checked = true;
      }
      buttonEl.click();
    });
  }
}

export { filterRefresh }
