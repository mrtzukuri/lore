const toggleLevelSkills = function() {
  const junior = document.getElementById('junior');
  const mid = document.getElementById('mid');
  const senior = document.getElementById('senior');

  const junior_skills = document.querySelectorAll('.Junior');
  const mid_skills = document.querySelectorAll('.Mid-Level');
  const senior_skills = document.querySelectorAll('.Senior');


  junior.addEventListener('click', (event) => {
    junior_skills.forEach(row => row.classList.remove("hidden"));
    mid_skills.forEach(row => row.classList.add("hidden"));
    senior_skills.forEach(row => row.classList.add("hidden"));

  })

  mid.addEventListener('click', (event) => {
    mid_skills.forEach(row => row.classList.remove("hidden"));
    senior_skills.forEach(row => row.classList.add("hidden"));

  })

  senior.addEventListener('click', (event) => {
    mid_skills.forEach(row => row.classList.remove("hidden"));
    senior_skills.forEach(row => row.classList.remove("hidden"));
  })

}
export { toggleLevelSkills }
