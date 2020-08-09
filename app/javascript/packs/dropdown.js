// Navbar and dropdowns
const toggle = document.getElementsByClassName("navbar-toggler")[0];
const collapse = document.getElementsByClassName("navbar-collapse")[0];
const dropdowns = document.getElementsByClassName("dropdown");

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
