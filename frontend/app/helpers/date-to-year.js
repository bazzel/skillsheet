import Ember from 'ember';

export function dateToYear(params/*, hash*/) {
  let [date] = params;
  return date.getFullYear();
}

export default Ember.Helper.helper(dateToYear);
