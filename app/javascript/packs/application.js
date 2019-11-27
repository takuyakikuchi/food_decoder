import "bootstrap";
import $ from "jquery";

$(() => $(".modal").modal("show"));
$(() => $(".modal").modal("new"));

$(document).ready(function() {
  $(".restriction-choice").click(function() {
    $(this).toggleClass("active");
  });
});

const button = document.querySelector(".user_avatar");
const profile = document.querySelector("#profile");
const logout = document.querySelector("#logout");
button.addEventListener("click", () => {
  profile.classList.toggle("profile-click");
  logout.classList.toggle("logout-click");
  });
