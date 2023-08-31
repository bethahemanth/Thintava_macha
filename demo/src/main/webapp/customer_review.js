document.addEventListener("DOMContentLoaded", function() {
    const stars = document.querySelectorAll(".star-rating span");
    let userRating = 0;

    stars.forEach((star, index) => {
        star.addEventListener("mouseover", () => {
            clearStars();
            userRating = index + 1;
            fillStars(userRating);
        });

        star.addEventListener("mouseleave", () => {
            clearStars();
            fillStars(userRating);
        });

        star.addEventListener("click", () => {
            const ratingInput = document.querySelector(".star-rating input[value='" + userRating + "']");
            if (ratingInput) {
                ratingInput.checked = true;
            }
        });
    });

    function clearStars() {
        stars.forEach(star => {
            star.classList.remove("checked");
        });
    }

    function fillStars(count) {
        for (let i = 0; i < count; i++) {
            stars[i].classList.add("checked");
        }
    }

    function submitReview() {
        const username = document.getElementById("username").value;
        const reviewText = document.getElementById("review").value;

        if (username.trim() === "" || reviewText.trim() === "" || userRating === 0) {
            alert("Please fill in both fields and provide a rating before submitting.");
            return;
        }

        const reviewList = document.getElementById("reviewList");
        const newReview = document.createElement("div");
        newReview.classList.add("review");
        newReview.innerHTML = `
            <h3>${username}</h3>
            <p>${reviewText}</p>
            <div class="star-rating">
                ${getStarsHtml(userRating)}
            </div>
        `;
        reviewList.appendChild(newReview);

        // Clear input fields after submitting
        document.getElementById("username").value = "";
        document.getElementById("review").value = "";
        userRating = 0;
        clearStars();
    }

    function getStarsHtml(rating) {
        let starsHtml = "";
        for (let i = 1; i <= 5; i++) {
            const checkedClass = i <= rating ? "checked" : "";
            starsHtml += `<span class="fa fa-star ${checkedClass}"></span>`;
        }
        return starsHtml;
    }

    document.getElementById("submitBtn").addEventListener("click", () => {
        const username = document.getElementById("username").value;
        const reviewText = document.getElementById("review").value;

        if (username.trim() === "" || reviewText.trim() === "" || userRating === 0) {
            alert("Please fill in both fields and provide a rating before submitting.");
            return;
        }

        const reviewDetails = `
            Username: ${username}
            Review: ${reviewText}
            Rating: ${userRating} Stars
        `;

        alert("Review Details:\n" + reviewDetails);

        submitReview();
    });
});
