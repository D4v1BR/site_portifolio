document.querySelectorAll('nav a').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault(); // impede o comportamento brusco de rolagem

        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth' // efeito suave
        });
    });
});


