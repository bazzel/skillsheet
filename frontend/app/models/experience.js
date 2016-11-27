import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
  level     : DS.attr('string'),
  startedOn : DS.attr('date'),
  years     : Ember.computed('startedOn', function() {
    let msDiff = new Date() - this.get('startedOn');
    return msDiff/(1000*60*60*24*365.25);
  })
});
