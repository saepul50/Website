<%-- <style>
    
</style> --%>
<% require themedCSS('allproduct') %>
<% if $Results %>
    <section class="tcard container d-flex justify-content-center gap-2 w-100 flex-wrap py-xl-5 p-0">
        <% loop $Results %>
                <a href="/project3/all-product-page/product/view/$ID">
                    <div class="card">
                        <div class = "img pt-1">
                            <% with $ProductImages.First %>
                                <img src="$URL" class="img-fluid p-2">
                            <% end_with %>
                        </div>
                        <div class = "text text-left px-3 py-3">
                            <h4>$Title</h4>
                            <p class="mb-2">$minPrice</p>
                            <div class="rat d-flex">
                                <h5 class="rating" id="rating">
                                    <span class="span1 productRating" style="display: none;">$Rating</span>&nbsp;
                                    <i class='bx bxs-star star'></i>
                                    <i class='bx bxs-star star'></i>
                                    <i class='bx bxs-star star'></i>
                                    <i class='bx bxs-star star'></i>
                                    <i class='bx bxs-star star'></i>
                                </h5>
                            </div>
                        </div>
                    </div>
                </a>
        <% end_loop %>
    </section>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ratings = document.querySelectorAll('.productRating');
            ratings.forEach(function(ratingElement) {
                const rating = parseFloat(ratingElement.innerText);
                const stars = ratingElement.parentElement.querySelectorAll('.star');
                stars.forEach((star, index) => {
                    const starValue = index + 1;
                    if (starValue <= rating) {
                        star.style.background = 'linear-gradient(90deg, #FFBC1C 100%, #C0C0C0 0%)';
                    } else if (starValue - rating < 1) {
                        const percentage = (rating - index) * 100;
                        star.style.background = `linear-gradient(90deg, #FFBC1C ${percentage}%, #C0C0C0 ${percentage}%)`;
                    } else {
                        star.style.background = 'linear-gradient(90deg, #C0C0C0 100%, #C0C0C0 0%)';
                    }
                });
            });
        });
    </script>
<% else %>
        <p>No results found</p>
<% end_if %>