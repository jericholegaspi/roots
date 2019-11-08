if (document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
} else{
	ready();
}

function ready() {
	var openCatalogueModal = document.getElementsByClassName('see-details')
	for (var i = 0; i < openCatalogueModal.length; i++) {
        var button = openCatalogueModal[i]
        button.addEventListener('mouseover', openModal);
	}
	/*for (var i = 0; i < openCatalogueModal.length; i++) {
        var button = openCatalogueModal[i]
        button.addEventListener('click', openModal);
	}*/
}

function openModal(event){
	var button = event.target;
	var catalogueItem = button.parentElement.parentElement;
	var catalogueID = catalogueItem.getElementsByClassName('retrieve-catalogueID')[0].innerHTML;
	console.log(catalogueID);
	changeText(catalogueID);
}

function changeText(catalogueID){
	var modalCatalogueID = document.getElementsByClassName("modal-catalogue-ID")[0];
	modalCatalogueID.value = catalogueID;
	console.log(modalCatalogueID);
}

/*function addStringToModal(title, category, price, unit, description){
	document.getElementById("p1").innerHTML = "New text!";
}*/