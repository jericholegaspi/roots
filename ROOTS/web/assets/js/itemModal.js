if (document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
} else{
	ready();
}

function ready() {
	var addToCartButtons = document.getElementsByClassName('see-details')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', openModal);
	}
}

function openModal(event){
	var button = event.target;
	var shopItem = button.parentElement.parentElement;
	var productID = shopItem.getElementsByClassName('card-prodID')[0].innerText;
	var productID2 = shopItem.getElementsByClassName('card-prodID')[0].innerText;
	var category = shopItem.getElementsByClassName('card-subtitle')[0].innerText;
	var price = shopItem.getElementsByClassName('card-price')[0].innerText;
	var unit = shopItem.getElementsByClassName('card-unit')[0].innerText;
	var description = shopItem.getElementsByClassName('card-description')[0].innerText;
	console.log(productID, productID2);
	changeText(productID, productID2);
}

function changeText(productID, productID2){
	
	var modalProductID = document.getElementsByClassName("modal-prodID")[0];
	modalProductID.innerHTML = productID;
	
	var modalProductID2 = document.getElementsByClassName("modal-prodID2")[0];
	modalProductID2.innerHTML = productID2;
	
	var modalTitle = document.getElementsByClassName("modal-prodName")[0];
	var modalCategory = document.getElementsByClassName("modal-category")[0];
	var modalDescription = document.getElementsByClassName("modal-description")[0];
	var modalPrice = document.getElementsByClassName("modal-price")[0];
	var modalUnit = document.getElementsByClassName("modal-unit")[0];
	
	modalTitle.innerHTML = title;
	modalCategory.innerHTML = category;
	modalDescription.innerHTML = description;
	modalPrice.innerHTML = price;
	modalUnit.innerHTML = unit;
}

function addStringToModal(title, category, price, unit, description){
	document.getElementById("p1").innerHTML = "New text!";
}