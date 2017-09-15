Trestle.ready(function() {
  function init() {
    var fields = document.querySelectorAll(".active-storage__field");

    for (var i = 0; i < fields.length; i++) {
      attachEvents(fields[i]);
    }
  }

  function attachEvents(field) {
    var progressEl = field.parentNode.querySelectorAll(".progress")[0];
    var progressBarEl = field.parentNode.querySelectorAll(".progress-bar")[0];

    field.addEventListener("direct-upload:start", function(event) {
      var detail = event.detail;
      progressEl.style = "display: block";
    });

    field.addEventListener("direct-upload:progress", function(event) {
      var detail = event.detail;
      progressBarEl.style = "width: " + detail.progress + "%";
    });
  }

  init();
});
