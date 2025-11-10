/**
 * Creative Theme Custom JavaScript
 */

(function() {
    'use strict';

    // Navbar scroll effect
    function navbarScrollEffect() {
        const navbar = document.querySelector('.navbar');
        if (!navbar) return;

        function updateNavbar() {
            if (window.scrollY > 100) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
        }

        // Initial check
        updateNavbar();

        // Update on scroll
        window.addEventListener('scroll', updateNavbar);
    }

    // Smooth scroll for anchor links
    function smoothScroll() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                if (href === '#' || href === '#!') return;

                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    const offsetTop = target.offsetTop - 72; // Account for navbar height
                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                }
            });
        });
    }

    // Magnific Popup for portfolio items (if needed)
    function initPortfolioPopup() {
        if (typeof $.fn.magnificPopup !== 'undefined') {
            $('.portfolio-item').magnificPopup({
                type: 'image',
                closeOnContentClick: true,
                closeBtnInside: false,
                mainClass: 'mfp-with-zoom mfp-img-mobile',
                image: {
                    verticalFit: true,
                    titleSrc: function(item) {
                        return item.el.find('h4').text() + ' &middot; <small>' + item.el.find('p').text() + '</small>';
                    }
                },
                zoom: {
                    enabled: true,
                    duration: 300,
                    opener: function(element) {
                        return element.find('img');
                    }
                }
            });
        }
    }

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            navbarScrollEffect();
            smoothScroll();
            initPortfolioPopup();
        });
    } else {
        navbarScrollEffect();
        smoothScroll();
        initPortfolioPopup();
    }

})();
