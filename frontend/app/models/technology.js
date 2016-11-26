import DS from 'ember-data';

const {Model, attr, hasMany, belongsTo} = DS
const {computed} = Ember

export default DS.Model.extend({
  name:         attr('string'),
  languages:    hasMany('language'),
  disciplines:  hasMany('discipline')
});
