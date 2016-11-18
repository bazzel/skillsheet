import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['language', 'discipline', 'level'],
  language: null,
  discipline: null,
  level: null,

  filteredSkills: Ember.computed('language', 'discipline', 'level', 'model', function() {
    var language = this.get('language');
    var discipline = this.get('discipline');
    var level = this.get('level');
    var skills = this.get('model.skills');

    if (language) {
      skills = skills.filter(function(skill) {
        return skill.get('languages').
          mapBy('name').
          includes(language);
      });
    }

    if (discipline) {
      skills = skills.filter(function(skill) {
        return skill.get('disciplines').
          mapBy('name').
          includes(discipline);
      });
    }

    if (level) {
      skills = skills.filter(function(skill) {
        return skill.get('experiences').
          mapBy('level').
          includes(level);;
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
    }
  }
});
