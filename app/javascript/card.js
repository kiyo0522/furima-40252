// const pay = () => {
//   const payjp = Payjp('pk_test_d6cfc310c0a229bc7a4dd037')// PAY.JPテスト公開鍵
//   const elements = payjp.elements();
//   const numberElement = elements.create('cardNumber');
//   const expiryElement = elements.create('cardExpiry');
//   const cvcElement = elements.create('cardCvc');

//   numberElement.mount('#number-form');
//   expiryElement.mount('#expiry-form');
//   cvcElement.mount('#cvc-form');

//   const form = document.getElementById('charge-form')
//   form.addEventListener("submit", (e) => {
//     payjp.createToken(numberElement).then(function (response) {
//       if (response.error) {
//       } else {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token' type="hidden">`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//         debugger;
//       }
//     });
//     e.preventDefault();
//   });
// };

// window.addEventListener("turbo:load", pay);