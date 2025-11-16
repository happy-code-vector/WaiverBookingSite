/**
 * Grayscale Theme Custom JavaScript
 */

(function() {
    "use strict";

    // Navbar scroll effect
    var navbar = document.getElementById('mainNav');
    if (navbar) {
        var navbarCollapse = navbar.querySelector('.navbar-collapse');
        
        if (navbarCollapse) {
            var navbarShrink = function() {
                var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
                
                if (scrollTop === 0) {
                    navbar.classList.remove('navbar-scrolled');
                } else {
                    navbar.classList.add('navbar-scrolled');
                }
            };

            // Shrink the navbar on page load
            navbarShrink();

            // Shrink the navbar when page is scrolled
            document.addEventListener('scroll', navbarShrink);
        }
    }

    // Smooth scrolling for anchor links
    var scrollLinks = document.querySelectorAll('a[href^="#"]');
    
    scrollLinks.forEach(function(link) {
        link.addEventListener('click', function(e) {
            var href = this.getAttribute('href');
            
            // Don't prevent default for links that just have "#"
            if (href === '#' || href === '') {
                return;
            }
            
            var target = document.querySelector(href);
            
            if (target) {
                e.preventDefault();
                
                var offsetTop = target.offsetTop;
                
                // Account for fixed navbar height
                if (navbar) {
                    offsetTop -= navbar.offsetHeight;
                }
                
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Collapse responsive navbar when toggler is visible
    var navbarToggler = document.querySelector('.navbar-toggler');
    var responsiveNavItems = document.querySelectorAll('#navbarNav .nav-link');
    
    if (navbarToggler && responsiveNavItems.length > 0) {
        responsiveNavItems.forEach(function(responsiveNavItem) {
            responsiveNavItem.addEventListener('click', function() {
                if (window.getComputedStyle(navbarToggler).display !== 'none') {
                    navbarToggler.click();
                }
            });
        });
    }

})();
