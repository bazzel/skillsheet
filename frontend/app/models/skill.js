import DS from 'ember-data';

const {Model, hasMany, belongsTo} = DS;
const {computed} = Ember;

export default Model.extend({
  technology:         belongsTo('technology'),
  experiences:        hasMany('experience'),
  languageNames:      computed.mapBy('technology.languages', 'name'),
  disciplineNames:    computed.mapBy('technology.disciplines', 'name'),
  experienceLevels:   computed.mapBy('experiences', 'level'),
  experienceYears:    computed.mapBy('experiences', 'years'),
  maxExperienceYear:  computed.max('experienceYears'),
  startedOn: computed('experiences.[]', function() {
    return this.get('experiences').
      sortBy('startedOn').
      get('firstObject.startedOn');
  })
});
