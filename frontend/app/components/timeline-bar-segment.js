import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'span',
  classNames: ['timeline-bar-segment'],
  classNameBindings: ['beginner', 'intermediate', 'expert'],
  beginner: Ember.computed('experience.level', function() {
    return this.get('experience.level') === 'Beginner';
  }),
  intermediate: Ember.computed('experience.level', function() {
    return this.get('experience.level') === 'Intermediate';
  }),
  expert: Ember.computed('experience.level', function() {
    return this.get('experience.level') === 'Expert';
  }),
  attributeBindings: ['style'],
  style: Ember.computed(function() {
    let left = this.get('left');

    return Ember.String.htmlSafe(`${left}`);
  }),
  left: Ember.computed('experience.startedOn', function() {
    let start = this.get('from');
    let finish = new Date();
    let range = finish - start;
    let startedOn = this.get('experience.startedOn');

    let value = (1 - (finish - startedOn)/range);
    return `left: ${value*100}%;`;
  })
});
