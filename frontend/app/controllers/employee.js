import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['language', 'discipline', 'level', 'years'],
  language: null,
  discipline: null,
  level: null,
  years: null,

  filteredSkills: Ember.computed('language', 'discipline', 'level', 'years', 'model', function() {
    let language = this.get('language');
    let discipline = this.get('discipline');
    let level = this.get('level');
    let years = this.get('years');
    let skills = this.get('model.skills');

    if (language) {
      skills = skills.filter(function(skill) {
        return skill.get('languageNames')
          .includes(language);
      });
    }

    if (discipline) {
      skills = skills.filter(function(skill) {
        return skill.get('disciplineNames').
          includes(discipline);
      });
    }

    if (level) {
      skills = skills.filter(function(skill) {
        return skill.get('experienceLevels').
          includes(level);
      });
    }

    if (years) {
      skills = skills.filter(function(skill) {
        let max = skill.get('maxExperienceYear');

        switch (years) {
          case 'less-than-a-year':
            return max < 1;
            break;
          case 'between-1-and-5-years':
            return (max >= 1 && max <= 5);
            break;
          case 'more-than-5-years':
            return max > 5;
            break;
        }
      });
    }

    return skills;
  }),
  actions: {
    reset: function(property) {
      this.set(property, null);
    },
    resetAll: function() {
      let filterKeys = ["language", "discipline", "level", "years"];

      filterKeys.forEach((key) => {
        this.send('reset', key);
      })
    }
  }
});
