import DS from 'ember-data';

const { Model, attr, hasMany, belongsTo } = DS
const { computed } = Ember

export default DS.Model.extend({
  fullName: DS.attr('string'),
  alumni: DS.attr('boolean'),
  bio: DS.attr('string'),
  image: DS.attr('string'),
  skills: DS.hasMany('skill'),
  languageNames: computed('skills.[]', function() {
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
