const toggleLevelSkills = function() {
  const junior = document.getElementById('junior');
  const mid = document.getElementById('mid');
  const senior = document.getElementById('senior');

  const junior_skills = document.querySelectorAll('.Junior');
  const mid_skills = document.querySelectorAll('.Mid-Level');
  const senior_skills = document.querySelectorAll('.Senior');

  if(junior){
    junior.addEventListener('click', (event) => {
      mid.classList.remove("selected");
      junior.classList.add("selected");
      senior.classList.remove("selected");
      junior_skills.forEach(row => row.classList.remove("hidden"));
      mid_skills.forEach(row => row.classList.add("hidden"));
      senior_skills.forEach(row => row.classList.add("hidden"));

    })

    mid.addEventListener('click', (event) => {
      mid.classList.add("selected");
      junior.classList.remove("selected");
      senior.classList.remove("selected");
      mid_skills.forEach(row => row.classList.remove("hidden"));
      senior_skills.forEach(row => row.classList.add("hidden"));

    })

    senior.addEventListener('click', (event) => {
      mid.classList.remove("selected");
      junior.classList.remove("selected");
      senior.classList.add("selected");
      mid_skills.forEach(row => row.classList.remove("hidden"));
      senior_skills.forEach(row => row.classList.remove("hidden"));
    })
  }
}
export { toggleLevelSkills }
