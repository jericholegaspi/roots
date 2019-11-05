if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready);
} else {
    ready();
}

function ready(){
	var quantityInputs = document.getElementsByClassName('cart-quantity-input');
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i];
        input.addEventListener('change', quantityChanged);
    }

    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i];
        input.addEventListener('change', subTotalChanged);
    }
    loadInitialTotal();    
}

function quantityChanged(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
    }
    updateCartTotal();
}

function updateCartTotal() {
    var cartItemContainer = document.getElementsByClassName('cart-items')[0];
    var cartRows = cartItemContainer.getElementsByClassName('cart-row');
    var total = 0;
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i];
        var priceElement = cartRow.getElementsByClassName('cart-price')[0];
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0];
        var price = parseFloat(priceElement.innerText.replace('\u20B1', ''));
        var quantity = quantityElement.value;
        total = total + (price * quantity);
    }
    total = Math.round(total * 100) / 100;
    document.getElementsByClassName('cart-total-price')[0].innerHTML = 'Total: \u20B1' + total;
    
}

function subTotalChanged(event){
    var quantityClicked = event.target;
    var shopItem = quantityClicked.parentElement.parentElement;
    var subTotal = 0;
    var tempPrice = shopItem.getElementsByClassName('cart-price')[0];
    var tempQuantity = shopItem.getElementsByClassName('cart-quantity-input')[0];
    var itemPrice = parseFloat(tempPrice.innerText.replace('\u20B1', ''));
    var itemQuantity = tempQuantity.value;
    subTotal = subTotal + (itemPrice * itemQuantity);
    console.log(subTotal);
    subTotal = Math.round(subTotal * 100) / 100;
    document.getElementsByClassName('cart-item-subtotal')[0].innerHTML = '\u20B1' + subTotal;
}

function loadInitialTotal(){
    var cartItemContainer = document.getElementsByClassName('cart-items')[0];
    var cartRows = cartItemContainer.getElementsByClassName('cart-row');
    var total = 0;
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i];
        var priceElement = cartRow.getElementsByClassName('cart-item-subtotal')[0];
        var price = parseFloat(priceElement.innerText.replace('\u20B1', ''));
        total = total + (price);
    }
    total = Math.round(total * 100) / 100;
    document.getElementsByClassName('cart-total-price')[0].innerHTML = 'Total: \u20B1' + total;
}