import DS from 'ember-data';
import Ember from 'ember';

const { Model, attr, hasMany } = DS;

export default Model.extend({
  name:         attr('string'),
  languages:    hasMany('language'),
  disciplines:  hasMany('discipline')
});
