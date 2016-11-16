import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['chip'],
  actions: {
    close: function() {
      this.get('action')();
    }
  }
});
