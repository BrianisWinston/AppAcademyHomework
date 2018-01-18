document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  let handleSubmit = (ele) => {
    ele.preventDefault();
    let favoriteInput = document.querySelector(".favorite-input");

    let favorite = favoriteInput.value;
    favoriteInput.value = "";

    let newItem = document.createElement("li");
    newItem.textContent = favorite;
    let list = document.getElementById("sf-places");
    list.appendChild(newItem);
  };
  let listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleSubmit);



  // adding new photos

  let inputPhoto = (photo) => {
      let photoForm = document.querySelector(".photo-form-container");
      if (photoForm.className === "photo-form-container") {
        photoForm.className = "photo-form-container hidden";
      } else {
        photoForm.className = "photo-form-container";
      }
    };

    let showButton = document.querySelector(".photo-show-button");
    showButton.addEventListener("click", inputPhoto);
});
