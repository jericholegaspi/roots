if (document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
} else{
	ready();
}

function ready() {
	var addToCartButtons = document.getElementsByClassName('cart-item-delete')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('mouseover', openModal);
	}
	for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', openModal);
	}
	for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', getData);
	}
	for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('mouseover', getData);
	}
	
	var editCartItemButton = document.getElementsByClassName('cart-item-edit')
	for (var i = 0; i < editCartItemButton.length; i++) {
        var button = editCartItemButton[i]
        button.addEventListener('mouseover', getData);
	}
	for (var i = 0; i < editCartItemButton.length; i++) {
        var button = editCartItemButton[i]
        button.addEventListener('click', getData);
	}
	
	var editCartItemImage = document.getElementsByClassName('cart-image')
	for (var i = 0; i < editCartItemImage.length; i++) {
        var button = editCartItemImage[i]
        button.addEventListener('mouseover', getData2);
	}
	for (var i = 0; i < editCartItemImage.length; i++) {
        var button = editCartItemImage[i]
        button.addEventListener('click', getData2);
	}
}

function openModal(event){
	var button = event.target;
	var shopItem = button.parentElement.parentElement;
	var productID = shopItem.getElementsByClassName('cart-product-id')[0].innerHTML;
	var productName = shopItem.getElementsByClassName('cart-product-name')[0].innerHTML;
	console.log(productName, productID);
	changeText(productID, productName);
}

function changeText(productID, productName){
	var modalProductID = document.getElementById('modal-prodID');
	var modalProductName = document.getElementById('modal-prodName');
	modalProductID.value = productID;
	modalProductName.value = productName;
	console.log(modalProductID, modalProductName);
}

function getData(event){
	var button = event.target;
	var shopItem = button.parentElement.parentElement;
	var productIDEdit = shopItem.getElementsByClassName('cart-product-id')[0].innerHTML;
	var productNameEdit = shopItem.getElementsByClassName('cart-product-name')[0].innerHTML;
	console.log(productNameEdit, productIDEdit);
	changeTextEdit(productIDEdit, productNameEdit);
}

function changeTextEdit(productIDEdit, productNameEdit){
	var editQtyProductID = document.getElementById('edit-prodID');
	var editQtyProductName = document.getElementById('edit-prodName');	
	editQtyProductID.value = productIDEdit;
	editQtyProductName.value = productNameEdit;
	console.log(editQtyProductID, editQtyProductName);
}

function getData2(event){
	var button2 = event.target;
	var shopItem2 = button2.parentElement.parentElement;
	var productIDEdit2 = shopItem2.getElementsByClassName('cart-product-id')[0].innerHTML;
	var productNameEdit2 = shopItem2.getElementsByClassName('cart-product-name')[0].innerHTML;
	console.log(productNameEdit2, productIDEdit2);
	changeTextEdit2(productIDEdit2, productNameEdit2);
}

function changeTextEdit2(productIDEdit2, productNameEdit2){
	var editQtyProductID2 = document.getElementById('edit-prodID');
	var editQtyProductName2 = document.getElementById('edit-prodName');	
	editQtyProductID2.value = productIDEdit2;
	editQtyProductName2.value = productNameEdit2;
	console.log(editQtyProductID2, editQtyProductName2);
}