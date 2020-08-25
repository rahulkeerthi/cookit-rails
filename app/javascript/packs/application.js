// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
const Flickity = require("flickity");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "flickity";
import "flickity-imagesloaded";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { toggleController } from "./dropdown";

document.addEventListener("turbolinks:before-cache", () => {
	window.removeEventListener("resize", closeMenusOnResize, false);
	toggle.removeEventListener("click", toggleMenu, false);
});

document.addEventListener("turbolinks:load", () => {
	// CAROUSELS
	const carousel = document.querySelector(".main-carousel");
	if (carousel) {
		const flkty = new Flickity(carousel, {
			imagesLoaded: true,
			accessibility: true,
			wrapAround: true,
			pageDots: false,
			resize: true,
			percentPosition: false,
		});
		flkty.resize();
		window.addEventListener("resize", flkty.resize(), false);
	}

	// DROPDOWNS
	const collapse = document.getElementsByClassName("navbar-collapse")[0];
	const dropdowns = document.getElementsByClassName("dropdown");
	const toggle = document.getElementsByClassName("navbar-toggler")[0];

	// Toggle if navbar menu is open or closed
	const toggleMenu = () => {
		collapse.classList.toggle("collapse");
		if (!collapse.classList.contains("collapse")) {
			const avatar = document.getElementsByClassName(".nav-item.dropdown")[0];
			avatar.classList.toggle("avatar-hide");
			// collapse.classList.toggle("in");
		}
	};

	// Close all dropdown menus
	const closeMenus = () => {
		for (let dropdown of dropdowns) {
			dropdown.getElementsByClassName("dropdown-toggle")[0];
			dropdown.classList.remove("dropdown-open");
			dropdown.classList.remove("open");
		}
	};

	// Add click handling to dropdowns
	for (let dropdown of dropdowns) {
		dropdown.addEventListener("click", function () {
			if (document.body.clientWidth < 768) {
				const open = this.classList.contains("open");
				closeMenus();
				if (!open) {
					this.getElementsByClassName("dropdown-toggle")[0].classList.toggle(
						"dropdown-open"
					);
					this.classList.toggle("open");
				}
			}
		});
	}

	// Close dropdowns when screen becomes big enough to switch to open by hover
	const closeMenusOnResize = () => {
		if (document.body.clientWidth >= 768) {
			closeMenus();
			collapse.classList.add("collapse");
			// collapse.classList.remove("in");
		}
	};

	// Event listeners
	window.addEventListener("resize", closeMenusOnResize, false);
	toggle.addEventListener("click", toggleMenu, false);
});
