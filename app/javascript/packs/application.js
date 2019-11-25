import "bootstrap";
import $ from "jquery";

$(() => $(".modal").modal("show"));
$(() => $(".modal").modal("new"));

$(document).ready(function() {
  $(".restriction-choice").click(function() {
    $(this).toggleClass("active");
  });
});
