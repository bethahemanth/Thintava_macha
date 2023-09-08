// online_orders.js
document.addEventListener("DOMContentLoaded", function() {
    const orderItemsList = document.getElementById("orderItems");

    // Check if there are any existing orders in local storage
    const existingOrders = JSON.parse(localStorage.getItem("orders")) || [];

    // Populate the list of ordered items
    existingOrders.forEach(order => {
        const listItem = document.createElement("li");
        listItem.textContent = order.name + " - " + order.price + " rs";
        orderItemsList.appendChild(listItem);
    });

    // Handle adding an item to the order
    const addButtonElements = document.querySelectorAll(".add button");
    addButtonElements.forEach(button => {
        button.addEventListener("click", function() {
            const item = this.parentElement.parentElement;
            const itemName = item.querySelector(".description").textContent;
            const itemPrice = item.querySelector(".rate p").textContent;

            const newOrder = { name: itemName, price: itemPrice };
            existingOrders.push(newOrder);

            // Update local storage with the new order
            localStorage.setItem("orders", JSON.stringify(existingOrders));

            // Update the list on the "Online Orders" page
            const listItem = document.createElement("li");
            listItem.textContent = itemName + " - " + itemPrice;
            orderItemsList.appendChild(listItem);
        });
    });
});
