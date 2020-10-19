function calc () {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const fee = price.value / 10;
    const profitAmount = price.value - fee;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(fee);
    profit.innerHTML = Math.floor(profitAmount);
  })
}

setInterval(calc, 1000);