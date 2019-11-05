if (document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
} else{
	ready();
}

function ready() {
	var addToCartButtons = document.getElementsByClassName('cart-item-delete')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', openModal);
	}
}

function openModal(event){
	var button = event.target;
	var shopItem = button.parentElement.parentElement;
	var productID = shopItem.getElementsByClassName('cart-product-id')[0].innerHTML;
	var productName = shopItem.getElementsByClassName('cart-product-name')[0].innerText;
	console.log(productID, productName);
	/*changeText(title, category, price, unit, description);*/
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