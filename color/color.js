const colorSchemes = {
  "Tokyo Night Storm": {
    "Space Cadet": "24283b",
    "Delft Blue": "414868",
    "Ultra Violet": "565f89",
    "Periwinkle": "c0caf5",
    "Vista Blue": "7aa2f7",
    "Light Sky Blue": "7dcfff",
    "Seasalt": "f7f7f7",
    "Bright Pink (Crayola)": "f7768e",
    "Atomic Tangerine": "ff9e64",
    "Pistachio": "9ece6a",
    "Wisteria": "bb9af7"
  },
  "Black Purple": {
    "Night": "151616",
    "Raisin black": "202330",
    "Glaucous": "6078bb",
    "Vista Blue": "7a90d3",
    "YInMn Blue": "405289",
    "Savoy blue": "5166ab"
  }
};

const container = document.getElementById("schemes");

Object.entries(colorSchemes).forEach(([schemeName, colors]) => {
  // Title
  const title = document.createElement("h2");
  title.textContent = schemeName;
  container.appendChild(title);

  // Color boxes
  Object.entries(colors).forEach(([name, hex]) => {
    const colorCode = "#" + hex; // prepend '#'

    const div = document.createElement("div");
    div.className = "color-box";
    div.style.backgroundColor = colorCode;

    const spanName = document.createElement("span");
    spanName.className = "badge name";
    spanName.textContent = name;

    const spanHex = document.createElement("span");
    spanHex.className = "badge hex";
    spanHex.textContent = colorCode;

    div.appendChild(spanName);
    div.appendChild(spanHex);

    div.addEventListener("click", () => {
      navigator.clipboard.writeText(colorCode);
      div.classList.add("copied");
      setTimeout(() => div.classList.remove("copied"), 500);
    });

    container.appendChild(div);
  });
});
