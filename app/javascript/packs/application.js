import "bootstrap";
import $ from "jquery";

$(() => $(".modal").modal("show"));

$(document).ready(function() {
  $(".restriction-choice").click(function() {
    $(this).toggleClass("active");
  });
});
