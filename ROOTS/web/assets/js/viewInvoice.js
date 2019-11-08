if (document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
} else{
	ready();
}

function ready() {
	var addToCartButtons = document.getElementsByClassName('view-invoice')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('mouseover', getData);
	}

	for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', getData);
	}
}

function getData(event){
	var button = event.target;
	var shopItem = button.parentElement.parentElement;
	var orderID = shopItem.getElementsByClassName('invoice-orderID')[0].innerHTML;
	console.log(orderID);
	changeText(orderID);
}

function changeText(orderID){
	var inputOrderID = document.getElementById('input-orderID');
	inputOrderID.value = orderID;
	console.log(inputOrderID);
}