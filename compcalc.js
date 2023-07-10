"use strict";

const compCalc = {
	costs: [40, 40, 80, 40, 200, 400, 80, 80, 1],

	casualties: [],

	getCost(index) {
		return this.costs[this.casualties[index].unitIndex];
	},

	getTotalCost(index) {
		const { unitIndex, quantity } = this.casualties[index];
		return this.costs[unitIndex] * quantity;
	},

	getGrandTotal() {
		return this.casualties
			.map(({ unitIndex, quantity }) => this.costs[unitIndex] * quantity)
			.reduce((acc, val) => acc + val, 0);
	},

	getWithTax() {
		return this.getGrandTotal() * 1.25; /* = s / (1 - 20%)  */
	},
};

const compCalcForm = document.forms.compcalc;

const updateGrandTotal = function () {
	const { grandtotal, wtax } = compCalcForm.elements;
	const changeText = (elem, newValue) => {
		let fnChange = () => {
			elem.value = newValue.toLocaleString();
			elem.classList.remove("changing");
			elem.ontransitionend = undefined;
		};
		elem.classList.add("changing");
		if (elem.style.transition === undefined)
			fnChange();
		else
			elem.ontransitionend = fnChange;
	};
	changeText(grandtotal, compCalc.getGrandTotal());
	changeText(wtax, compCalc.getWithTax());
};

const appendCasualties = function (unitIndex, quantity) {
	if (unitIndex < 0 || unitIndex >= compCalc.costs.length)
		throw new RangeError("unitIndex out of range");
	quantity = parseInt(quantity);
	const index = compCalc.casualties.push({ unitIndex, quantity }) - 1;

	const tbl_result = document.getElementById("tbl_result");
	const newItem = tbl_result.firstElementChild.cloneNode(true);
	tbl_result.insertBefore(newItem, tbl_result.lastElementChild);

	const setTextContentIn = (classname, newText) => {
		newItem.getElementsByClassName(classname)[0].textContent = newText;
	};
	setTextContentIn("unitname",
		compCalcForm.elements.unit.options[unitIndex + 1].textContent);
	setTextContentIn("qtd", quantity.toLocaleString());
	setTextContentIn("mul",
		`\xD7\xA0${compCalc.getCost(index).toLocaleString()}\xA0=`);
	setTextContentIn("cost", compCalc.getTotalCost(index).toLocaleString());

	newItem.removeAttribute("style");
};

compCalcForm.onsubmit = function (event) {
	const { unit: spnUnitType, casualties: numCasualties } =
		compCalcForm.elements;

	appendCasualties(spnUnitType.selectedIndex - 1, numCasualties.value);
	updateGrandTotal();
	event.preventDefault();

	numCasualties.value = "";
	spnUnitType.focus();
};
