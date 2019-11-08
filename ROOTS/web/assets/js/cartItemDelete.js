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

/*function changeText(title, category, price, unit, description){
	var modalTitle = document.getElementsByClassName("modal-prodname")[0];
	var modalCategory = document.getElementsByClassName("modal-category")[0];
	var modalDescription = document.getElementsByClassName("p-text-description")[0];
	var modalPrice = document.getElementsByClassName("p-text-price")[0];
	var modalUnit = document.getElementsByClassName("p-text-unit")[0];

	modalTitle.innerHTML = title;
	modalCategory.innerHTML = category;
	modalDescription.innerTexterHTML = description;
	modalPrice.innerHTML = price;
	modalUnit.innerHTML = unit;
}*/