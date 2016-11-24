import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['skill-list'],
  didInsertElement() {
    this._super(...arguments);

    this.totalWidth = this.$().width();
    this.offset     = this.$('.skill-item-title').outerWidth(true);
    this.width      = this.totalWidth - this.offset;
    this.dateFrom   = this.get('from');
    this.dateTo     = new Date();

    let yearCurrent = this.dateFrom.getFullYear();
    let yearTo      = this.dateTo.getFullYear();

    do {
      yearCurrent += 1;
      this.drawYearMarker(new Date(yearCurrent, 1, 1));
    } while (yearCurrent < yearTo);

  },
  drawYearMarker(dateCurrent) {
    let relativePosition = (dateCurrent - this.dateFrom)/(this.dateTo - this.dateFrom);
    let relativeWidth    = this.offset + this.width*relativePosition;
    let left             = 100 * relativeWidth / this.totalWidth;
    let yearCurrent      = dateCurrent.getFullYear();

    this.$().append(this.marker(left, yearCurrent));
  },
  marker(left, year) {
    let $el = $('<div>', {
      class: 'year-marker'
    });
    $el.append(`<span class="year">${year}</span>`);
    return $el.css('left', `${left}%`);
  }
});
