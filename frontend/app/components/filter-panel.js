import Ember from 'ember';

export default Ember.Component.extend({
  isExpanded: false,
  actions: {
    toggle: function() {
      this.toggleProperty('isExpanded');
    }
  },
  caretClass: Ember.computed('isExpanded', function() {
    if (this.get('isExpanded')) {
      return 'dropup';
    } else {
      return 'dropdown';
    }}
  )
});
