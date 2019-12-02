const priceSlider = function() {
  const price = document.getElementById('price');
  const priceSlider = document.getElementById('priceRange');

  if(price){
    priceSlider.addEventListener('change', (event) => {
      price.innerHTML = priceSlider.value
    })
  }
}

export { priceSlider }
