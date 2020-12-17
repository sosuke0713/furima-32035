window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  console.log(addTaxDom);

  const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - inputValue * 0.1)
  console.log(profit);
  })

});

//var num = 12345;
//num.toLocaleString();
