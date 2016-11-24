import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['skill-list'],
  didInsertElement() {
    this._super(...arguments);
    let totalWidth = this.$().width();
    let offset = this.$('.skill-item-title').outerWidth(true);
    let width = totalWidth - offset;

    let dateFrom = this.get('from');
    let yearFrom = dateFrom.getFullYear();
    let dateTo = new Date();
    let yearTo = dateTo.getFullYear();
    let yearCurrent = yearFrom;

    do {
      yearCurrent += 1;
      let dateCurrent = new Date(yearCurrent, 1, 1);
      let left = 100*(offset + width*(dateCurrent - dateFrom)/(dateTo - dateFrom))/totalWidth;
      this.drawYearMarker(left);
    } while (yearCurrent < yearTo);

  },
  drawYearMarker(left) {
    this.$().append(this.yearMarker(left));
  },
  yearMarker(left) {
    let $year = $('<div>', {
      class: 'year-marker'
    });
    return $year.css('left', `${left}%`);
  }
});
