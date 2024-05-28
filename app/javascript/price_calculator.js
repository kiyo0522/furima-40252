function priceCalculator() {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value,10);
      console.log("入力された価格:", price); // デバッグ用
  if (!isNaN(price) && price >= 300 && price <= 9999999) {
    const fee = Math.floor(price * 0.1); // 販売手数料を計算
    console.log("OK");
    const profitAmount = price - fee; // 販売利益を計算
    // 計算結果を表示
    taxPrice.innerText = fee.toLocaleString();
    profit.innerText = profitAmount.toLocaleString();
    console.log("販売手数料:", fee, "販売利益:", profitAmount); // デバッグ用

  } else {
    taxPrice.innerText = '';
    profit.innerText = '';
  }
 });
 }
}
window.addEventListener('turbo:load', priceCalculator);
