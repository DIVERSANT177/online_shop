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