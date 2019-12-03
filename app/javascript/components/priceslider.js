const priceSlider = function() {
  var rangeSlider = document.getElementById("rs-range-line");
  var rangeBullet = document.getElementById("rs-bullet");

  rangeSlider.addEventListener("input", showSliderValue, false);
  if(rangeSlider){
    function showSliderValue() {
      rangeBullet.innerHTML = rangeSlider.value;
      var bulletPosition = (rangeSlider.value / rangeSlider.max);
      rangeBullet.style.left = (bulletPosition * 200) + "px";
    }
  }
}

export { priceSlider }
