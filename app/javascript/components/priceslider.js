const priceSlider = function() {
  var rangeSlider = document.getElementById("rs-range-line");
  var rangeBullet = document.getElementById("rs-bullet");

  if(rangeSlider){
    rangeSlider.addEventListener("input", showSliderValue, false);
  }

  function showSliderValue() {
    rangeBullet.innerHTML = rangeSlider.value;
    var bulletPosition = (rangeSlider.value / rangeSlider.max);

    rangeBullet.style.left = (bulletPosition * 95) + "%";
  }
}

export { priceSlider }
