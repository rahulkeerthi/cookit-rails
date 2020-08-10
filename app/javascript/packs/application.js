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
import "./dropdown";
// import "./slider";

document.addEventListener("turbolinks:load", () => {
	// Call your functions here, e.g:
	// initSelect2();
	const carousel = document.querySelector(".main-carousel");
	const flkty = new Flickity(carousel, {
		imagesLoaded: true,
		accessibility: true,
		// cellAlign: "center",
		wrapAround: true,
		pageDots: false,
		resize: true,
		percentPosition: false,
	});
	flkty.resize();

	// const images = document.querySelectorAll(".carousel-cell img");
	// const docStyle = document.documentElement.style;
	// const transformProp =
	// 	typeof docStyle.transform == "string" ? "transform" : "WebkitTransform";
	// flkty.on("scroll", function () {
	// 	flkty.slides.forEach(function (slide, i) {
	// 		const img = images[i];
	// 		const x = -(slide.target + flkty.x) / 3;
	// 		img.style[transformProp] = "translateX( " + x + "px)";
	// 	});
	// });
});

document.addEventListener("DOMContentLoaded", () => {
	flkty.resize();
});
