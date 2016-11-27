import DS from 'ember-data';
import Ember from 'ember';

const { Model, attr, hasMany } = DS;
const { computed } = Ember;

export default Model.extend({
  fullName      : attr('string'),
  alumni        : attr('boolean'),
  bio           : attr('string'),
  image         : attr('string'),
  skills        : hasMany('skill'),
  languageNames : computed('skills.[]', function() {
    let fn = (acc, skill) => acc.concat(skill.get('languageNames'));
    return this.uniqItems(fn);
  }),
  disciplineNames: computed('skills.[]', function() {
    let fn = (acc, skill) => acc.concat(skill.get('disciplineNames'));
    return this.uniqItems(fn);
  }),
  uniqItems(fn) {
    return this.get('skills').reduce(fn, []).uniq();
  },
  startedFrom: computed('skills.[]', function() {
    return this.get('skills').
      sortBy('startedOn').
      get('firstObject.startedOn');
  })
});
