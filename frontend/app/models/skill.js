import DS from 'ember-data';

export default DS.Model.extend({
  technology: DS.attr('string'),
  languages: DS.hasMany('language'),
  disciplines: DS.hasMany('discipline')
});
