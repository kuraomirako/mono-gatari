document.addEventListener("turbo:load", () => {
  const menuIcon = document.querySelector(".menu-icon");
  const menuList = document.querySelector(".menu-lists");

  if (menuIcon && menuList) {
    menuIcon.addEventListener("click", () => {
      if (menuList.style.display === "none" || menuList.style.display === "") {
        menuList.style.display = "block";
      } else {
        menuList.style.display = "none";
      }
    });
  }
});