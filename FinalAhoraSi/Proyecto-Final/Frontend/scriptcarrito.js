document.addEventListener('DOMContentLoaded', () => {
    const cartItemsContainer = document.querySelector('.cart-items');
    const cartTotalElement = document.getElementById('cart-total');
    let cartTotal = 0;

    // Función para agregar un artículo al carrito
    function addToCart(item) {
        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <img src="${item.imgSrc}" alt="${item.name}">
            <div>
                <h4>${item.name}</h4>
                <p>$${item.price}</p>
            </div>
            <button class="remove-item">X</button>
        `;
        cartItemsContainer.appendChild(cartItem);

        // Actualizar el total
        cartTotal += item.price;
        cartTotalElement.textContent = cartTotal.toFixed(2);

        // Añadir evento para eliminar el artículo
        cartItem.querySelector('.remove-item').addEventListener('click', () => {
            cartItemsContainer.removeChild(cartItem);
            cartTotal -= item.price;
            cartTotalElement.textContent = cartTotal.toFixed(2);
        });
    }

    // Escuchar el evento click en el botón "Reservar"
    const reservarBtn = document.getElementById('reservar_btn');
    reservarBtn.addEventListener('click', () => {
        
        const selectedCar = {
            imgSrc: 'Images/Carro.png', 
            name: 'Nombre del carro',   
            price: 10000                
        };
        addToCart(selectedCar);
    });
});
