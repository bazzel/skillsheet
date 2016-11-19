import DS from 'ember-data';

const {Model, attr, hasMany} = DS
const {computed} = Ember

export default Model.extend({
  technology:         attr('string'),
  languages:          hasMany('language'),
  disciplines:        hasMany('discipline'),
  experiences:        hasMany('experience'),
  languageNames:      computed.mapBy('languages', 'name'),
  disciplineNames:    computed.mapBy('disciplines', 'name'),
  experienceLevels:   computed.mapBy('experiences', 'level'),
  experienceYears:    computed.mapBy('experiences', 'years'),
  maxExperienceYear:  computed.max('experienceYears')
});
