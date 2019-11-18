$(function () {
  $('#dayMonthSelection').select2(Core.select2Options);
  $('#groupSelection').select2(Core.select2Options);
});

const App = new Vue({
  el: '#app',
  data: function () {
    return {
      variables: [],
      model: {
        variableId: null
      }
    }
  },
  created: function () {
    Core.populateVariableDropdown(this);
  }
});
