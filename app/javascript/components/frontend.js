const toggleLevelSkills = function() {
  const gridEl = document.querySelector('.grid');

  let skillLevel = 'Junior';

  const grid = new Isotope(gridEl, {
    // options...
    itemSelector: '.grid-item',
    masonry: {
      columnWidth: 20
    },
    filter: function(itemElem) {
      let isMatched = false;

      const itemSkillLevel = itemElem.dataset.skillLevel;

      switch (skillLevel) {
        case 'Junior':
          isMatched = itemSkillLevel === 'Junior';
        break;
        case 'Mid-Level':
          isMatched = itemSkillLevel === 'Junior' || itemSkillLevel === 'Mid-Level';
        break;
        case 'Senior':
          isMatched = itemSkillLevel === 'Junior' || itemSkillLevel === 'Mid-Level' || itemSkillLevel === 'Senior';
        break;
      }

      return isMatched;
    },
  });

  const junior = document.getElementById('junior');
  const mid = document.getElementById('mid');
  const senior = document.getElementById('senior');

  const changeSkillLevel = (newSkillLevel) => {
    skillLevel = newSkillLevel;
    grid.arrange();
  };

  if(junior){
    junior.addEventListener('click', (event) => {
      changeSkillLevel('Junior');
    })

    mid.addEventListener('click', (event) => {
      changeSkillLevel('Mid-Level');
    })

    senior.addEventListener('click', (event) => {
      changeSkillLevel('Senior');
    })
  }
}
export { toggleLevelSkills }
