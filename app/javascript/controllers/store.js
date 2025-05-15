document.querySelectorAll('.store > img').forEach(img => {
    img.addEventListener('click', function() {
        // Находим форму внутри родителя изображения и отправляем её
        const form = this.parentElement;
        const submitButton = form.querySelector(':submit');
        if (submitButton) {
            submitButton.click();
        }
    });
});

