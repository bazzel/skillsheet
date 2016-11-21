import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'span',
  classNames: ['timeline-bar-segment'],
  attributeBindings: ['style'],
  style: Ember.computed(function() {
    let left = this.get('left');
    let backgroundColor = this.get('backgroundColor');

    return Ember.String.htmlSafe(`${left}${backgroundColor}`);
  }),
  left: Ember.computed('experience.startedOn', function() {
    let start = this.get('from');
    let finish = new Date();
    let range = finish - start;
    let startedOn = this.get('experience.startedOn');

    let value = (1 - (finish - startedOn)/range);
    return `left: ${value*100}%;`;
  }),
  backgroundColor: Ember.computed('experience.level', function() {
    let value;
    switch (this.get('experience.level')) {
      case 'Beginner':
        value = '#E0E6F6';
        break;
      case 'Intermediate':
        value = '#96B3D3';
        break;
      case 'Expert':
        value = '#37628F';
        break;
    }
    return `background-color: ${value};`;
  })
});
