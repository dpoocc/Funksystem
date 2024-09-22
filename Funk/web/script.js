const contiElements = document.querySelectorAll('.conti');

contiElements.forEach(self => {
    self.addEventListener('click', () => {
        contiElements.forEach(item => item.querySelector('i').classList.remove('active'));

        self.querySelector('i').classList.add('active');
    });
});