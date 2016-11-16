import DS from 'ember-data';

export default DS.Model.extend({
  fullName: DS.attr('string'),
  alumni: DS.attr('boolean'),
  bio: DS.attr('string'),
  image: DS.attr('string')
});