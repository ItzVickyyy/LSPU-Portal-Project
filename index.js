// ── Nav scroll shadow ──
    const nav = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
      nav.classList.toggle('scrolled', window.scrollY > 20);
    }, { passive: true });

    // ── Mobile menu ──
    const hamburger = document.getElementById('hamburger');
    const mobileMenu = document.getElementById('mobile-menu');
    hamburger.addEventListener('click', () => {
      mobileMenu.classList.toggle('open');
      const isOpen = mobileMenu.classList.contains('open');
      hamburger.innerHTML = isOpen ? '<i class="fa fa-xmark"></i>' : '<i class="fa fa-bars"></i>';
    });
    function closeMobile() {
      mobileMenu.classList.remove('open');
      hamburger.innerHTML = '<i class="fa fa-bars"></i>';
    }

    // ── Intersection Observer for scroll animations ──
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(e => {
        if (e.isIntersecting) {
          e.target.classList.add('visible');
          observer.unobserve(e.target);
        }
      });
    }, { threshold: 0.12 });

    document.querySelectorAll('.fade-up, .stagger').forEach(el => observer.observe(el));