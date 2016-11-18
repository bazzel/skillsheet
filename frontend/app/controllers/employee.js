import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['language', 'discipline'],
  language: null,
  discipline: null,

  filteredSkills: Ember.computed('language', 'discipline', 'model', function() {
    var language = this.get('language');
    var discipline = this.get('discipline');
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

    return skills;
  }),
  actions: {
    resetLanguage: function() {
      this.set('language', null);
    },
    resetDiscipline: function() {
      this.set('discipline', null);
    }
  }
});
