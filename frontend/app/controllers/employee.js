import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['language'],
  language: null,

  filteredSkills: Ember.computed('language', 'model', function() {
    var language = this.get('language');
    var skills = this.get('model.skills');

    if (language) {
      return skills.filter(function(skill) {
        return skill.get('languages').
          mapBy('name').
          includes(language);
      });
    } else {
      return skills;
    }
  }),
  actions: {
    resetLanguage: function() {
      this.set('language', null);
    }
  }
});
