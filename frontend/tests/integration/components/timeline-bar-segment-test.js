import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('time-line-bar-segment', 'Integration | Component | time line bar segment', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{time-line-bar-segment}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#time-line-bar-segment}}
      template block text
    {{/time-line-bar-segment}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
