import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['language', 'discipline', 'level', 'years'],
  language: null,
  discipline: null,
  level: null,
  years: null,

  filteredSkills: Ember.computed('language', 'discipline', 'level', 'years', 'model', function() {
    var language = this.get('language');
    var discipline = this.get('discipline');
    var level = this.get('level');
    var years = this.get('years');
    var skills = this.get('model.skills');

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
    resetLanguage: function() {
      this.set('language', null);
    },
    resetDiscipline: function() {
      this.set('discipline', null);
    },
    resetLevel: function() {
      this.set('level', null);
    },
    resetYears: function() {
      this.set('years', null);
    }
  }
});
