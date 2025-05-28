document.addEventListener("turbo:load", function () {
    const toggleButton = document.querySelector('[data-bs-dismiss="offcanvas"]');

    console.log(toggleButton)
    if (toggleButton) {
        toggleButton.addEventListener("click", function () {
        const offcanvas = document.getElementById('sidebarMenu');
        if (offcanvas && offcanvas.classList.contains('show')) {
            offcanvas.classList.remove('show');
        }
        });
    }

    document.querySelectorAll('img').forEach(img => {
    
        img.addEventListener('click', function() {
            
            const productId = this.dataset.productId; 

            $.ajax({
                type: "POST",
                url: '/line_items',
                dataType: 'script',
                data: { product_id: productId }
            })
        });
    });
});
