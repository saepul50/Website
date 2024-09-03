<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<% include Header %>
<% include SideBar %>
<% include NavigationCart %>
<% if $Product %>
<div class="products container-fluid">
    <div class="f container d-flex flex-wrap align-items-center ps-5 py-3 mt-1">
        <div class="ff">
            <a href="{$BaseHref}/"><h5>Metro</h5></a>
        </div>
        <div class="ff">
            <% loop $Product.ProductCategory %><a href="{$BaseHref}/all-product-page?&Category=$ID"><h5>$Title</h5></a><% end_loop %>
        </div>
        <div class="ff">
            <% loop $Product.ProductSubCategory %><a href="{$BaseHref}/all-product-page?SubCategory=$ID"><h5>$Title</h5></a><% end_loop %>
        </div>
        <div class="ff">
            <h5 id="productTitle">$Product.Title</h5>
        </div>
    </div>
    <div class="pp container">
        <div class="product py-4 py-xl-5 px-4 d-xl-flex justify-content-center">
            <div class="col-12 col-md-7 col-xl-4 container py-2 d-flex flex-column justify-content-center">
                <div id="mainImage" class="d-flex justify-content-center bg-light" style="height: auto; width: auto:">
                    <video id="mainProductVideo" class="img-fluid" style="aspect-ratio: 1/1;" controls autoplay loop muted>
                        <source id="ProductVideoSource" src="$Product.ProductVideo.URL" type="video/mp4">
                    </video>
                    <img src="$Product.ProductImages.First.URL" alt="$Product.ProductImages.First.Title" class="img-fluid" id="mainProductImage">
                    <img src="$Product.ProductImages.First.URL" alt="$Product.ProductImages.First.Title" class="img-fluid" id="mainImages" style="display:none;">
                </div>
                <div id="thumbnailCarousel" class="owl-carousel owl-theme mt-2">
                    <% if $Product.ProductVideo.URL %>
                    <div class="item video-thumbnail" style="cursor: pointer;" data-is-video="true">
                        <img src="" alt="Product Video Thumbnail" class="img-fluid">
                    </div>
                    <% end_if %>
                    <% loop $Product.ProductImages %>
                    <div class="item" style="cursor: pointer;">
                        <img src="$URL" alt="$Title" class="img-fluid">
                    </div>
                    <% end_loop %>
                    <% loop $Product.ProductVariants %>
                    <div class="item itemvar" style="cursor: pointerdata" data-variant-id="$ID" data-price="$FormattedPrice" data-stock="$Stock">
                        <img src="$VariantImage.URL" alt="$VariantName" class="img-fluid">
                        <% if $Stock <= 0 %>
                            <div class="out-of-stock-badge">Habis</div>
                        <% end_if %>
                    </div>
                    <% end_loop %>
                </div>
            </div>
            <div class="thetitle col-12 container col-xl-8 py-2 ps-0 ps-xl-5 ri" style="font-size: 100%;">
                <h4 class="productTitle">$Product.Title</h4>
                <h4 style="display: none;" id="productID" data-id="$Product.ID">$Product.ID</h4>
                <div class="d-flex py-2">
                    <h5 class="rating" id="rating">
                        <span class="span1" id="productRating">$Product.Rating</span>&nbsp;
                        <i class='bx bxs-star star'></i>
                        <i class='bx bxs-star star'></i>
                        <i class='bx bxs-star star'></i>
                        <i class='bx bxs-star star'></i>
                        <i class='bx bxs-star star'></i>
                        <h5 class="pnl"><span class="span3">1,2RB</span> Rated</h5>
                        <h5 class="pnl"><span class="span4">$Product.QuantitySold</span> Terjual</h5>
                    </h5>
                </div>
                <div class="prices mt-3 p-4">
                    <% if $Product.ProductVariants %>
                        <div class="pricer" data-variant-id="$ID" data-price="$FormattedPrice">
                            <%-- <% loop $Product.ProductVariants %>
                                <p>$ID</p>
                            <% end_loop %> --%>
                            <h3 class="price" id="price">$Product.rangePrice</h3>
                            <h3 id="totalPrice"></h3>
                        </div>
                    <% end_if %>
                    <div class="d-flex align-items-center">
                        <i class='bx bxs-check-square fluid fs-3 pt-1'></i>
                        <div class="pt-2 ps-2">
                            <p class="p m-0">Garansi 100% ori</p>
                            <p class="m-0">Garansi uang kembali jika product tidak ori</p>
                        </div>
                    </div>
                </div>
                <div class="variants pt-3 d-flex align-items-center">
                    <label class="me-3">Variant:</label>
                    <% loop Product.Variant %>
                        <div class="subvariant ms-1 d-flex align-items-center" data-variant-id="$ID" data-price="$FormattedPrice" data-stock="$Stock">
                            <div class="col-3 d-flex align-items-center">
                                <img src="$VariantImage.URL" class="img-fluid">
                                <%-- <p class="m-0">$VariantImageID</p> --%>
                            </div>
                            <div class="col-9 d-flex align-items-center justify-content-center">
                                <p class="m-0" id="variantName">$VariantName</p>
                                <p class="m-0" id="variantName">$VariantID</p>
                            </div>
                        </div>
                    <% end_loop %>
                </div>
                <div class="quantity d-flex align-items-center mt-0 py-3">
                    <label class="">Quantity:</label>
                    <div class="input-group mx-3">
                        <button class="btn m-0 py-1 px-2" type="button" id="decrementButton">-</button>
                        <input type="text" inputmode="numeric" id="quantityInput" class="form-control py-1 px-2" value="1" min="1">
                        <button class="btn m-0 py-1 px-2" type="button" id="incrementButton">+</button>
                    </div>
                    <p class="m-0" style="color: #707070; font-weight: 400;">Tersisa <span id="stock">10</span> Buah</p>
                </div>
                <div class="co d-flex" id="co">
                    <button class="butna m-0 py-2 px-3" type="" id="addcart"><span><i class='bx bx-cart-add'></i></span>Masukkan Keranjang</button>
                    <button class="butnc m-0 ms-2 py-2 px-3" type="text" id="checkout">Beli Sekarang</button>
                </div>
            </div>
        </div>
    </div>
    <div class="pp container">
        <div class="details px-4 mt-4 py-5">
            <div class="">
                <div class="Subtitle py-3 mx-3 my-3" style="background-color: #f9f9f9;">
                    <p class="m-0 fw-bold container mx-2" style="font-size: 100%;">Spesifikasi Product:</p>
                </div>
                <div class="">
                    <div class="spek mx-4 my-2">
                        <div class="d-flex flex-column flex-md-row">
                            <div class="col-2">
                                <h5 class="m-0">Kategori:</h5>
                            </div>
                            <div class="col-12 col-md-10">
                                <div class="f container d-flex align-items-center p-0">
                                    <div class="ff">
                                        <a href="https://607e-2001-448a-50e0-ed8f-7c4f-593b-caf9-c711.ngrok-free.app/project3home"><h5 class="m-0 p-0">Metro</h5></a>
                                    </div>
                                    <div class="ff">
                                        <% loop $Product.ProductCategory %><a href="{$BaseHref}/all-product-page?&Category=$ID"><h5 class="m-0 p-0">$Title</h5></a><% end_loop %>
                                    </div>
                                    <div class="f" style="position: relative;">
                                        <% loop $Product.ProductSubCategory %><a href="{$BaseHref}/all-product-page?SubCategory=$ID"><h5 class="m-0 p-0" style="color: #2b6ebf; font-size: 93%; padding-top: .3rem;">$Title</h5></a><% end_loop %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-column flex-md-row">
                            <div class="col-2">
                                <h5 class="m-0">Stock:</h5>
                            </div>
                            <div class="col-10">
                                <% loop Product %>
                                    <h5>$totalStock</h5>
                                <% end_loop %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Subtitle py-3 mx-3 my-3" style="background-color: #f9f9f9;">
                    <p class="m-0 fw-bold container mx-2" style="font-size: 100%;">Desrkripsi Product:</p>
                </div>
                <div class="">
                    <div class="desc mx-4 my-2">
                        <p class="m-0 ps-1" style="font-size: 95%;">$Product.Description</p>
                        <p class="m-0 ps-1" style="font-size: 95%;">$Product.Information</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<% include Contact %>
</div>
<% include Footer %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            function formatRupiah(amount) {
                return new Intl.NumberFormat('id-ID', {
                    style: 'currency',
                    currency: 'IDR',
                    minimumFractionDigits: 0
                }).format(amount);
            }
            $("#checkout").on('click', function (event) {
                event.preventDefault();
                $(".spinnerout").show();
                var activeSubvariant = $('.subvariant.active');
                var variantName = '';
                if (activeSubvariant.length > 0) {
                    variantStock = activeSubvariant.data("stock");
                    variantStockQuantity = $('#quantityInput').val();
                    if(variantStockQuantity<=variantStock){
                        variantName = activeSubvariant.find('#variantName').text();
                        var selectedProducts = [];
                        var priceText = $("#price").text();
                        var price = parseInt(priceText.replace(/Rp\. |[.]/g, ''));
                        var quantity = $("#quantityInput").val();
                        var totalPrice = price * quantity;
                        var formattedTotalPrice = formatRupiah(totalPrice.toString());
                        var productData = {
                            ProductID: $("#productID").data("id"),
                            ProductTitle: $("#productTitle").text(),
                            ProductImage: $("#mainImages").attr("src"),
                            VariantName: variantName,
                            VariantID: activeSubvariant.data("variant-id"),
                            Price: $("#price").text(),
                            Quantity: $("#quantityInput").val(),
                            TotalPrice: formattedTotalPrice,
                        };
                        <%-- console.log(formattedTotalPrice) --%>
                        selectedProducts.push(productData);
                        $.post("{$BaseHref}/checkout/static", {
                            products: selectedProducts
                        })
                        .done(function (data) {
                            var response = JSON.parse(data);
                            if (response.success) {
                                iziToast.success({
                                    timeout: 1000,
                                    title: 'Tunggu Sebentar',
                                    position: 'bottomRight',
                                    onClosed: function () {
                                        $(".spinnerout").hide();
                                        window.location.href = "{$BaseHref}/checkout";
                                    }
                                });
                            } else {
                                $(".spinnerout").hide();
                                iziToast.error({title: 'Error', message: 'Gagal Melakukan Checkout Cek Kembali username & password', position: 'bottomRight'});
                            }
                        })
                        .fail(function () {
                            $(".spinnerout").hide();
                            iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                        });
                    } else {
                        $(".spinnerout").hide();
                        iziToast.error({title: 'Caution', message: 'Kuantitas Tidak Tersedia', position: 'bottomRight'});
                    }
                } else {
                    $(".spinnerout").hide();
                    iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Pilih Variant Sebelum Checkout'});
                }
            });
            $("#addcart").on('click', function (event) {
                event.preventDefault();
                $(".spinnerout").show();
                var activeSubvariant = $('.subvariant.active');
                var variantName = '';

                if (activeSubvariant.length > 0) {
                    variantStock = activeSubvariant.data("stock");
                    variantStockQuantity = $('#quantityInput').val();
                    if(variantStockQuantity<=variantStock){
                        variantName = activeSubvariant.find('#variantName').text();
                        $.post("{$BaseHref}/cart/cart",
                        {
                            ProductID: $("#productID").data("id"),
                            ProductTitle: $("#productTitle").text(),
                            ProductImage: $("#mainImages").attr("src"),
                            VariantName: variantName,
                            VariantID: activeSubvariant.data("variant-id"),
                            Price: $("#price").text(),
                            Quantity: $("#quantityInput").val(),
                        })
                        .done(function (data) {
                            var response = JSON.parse(data);
                            if (response.success) {
                                iziToast.success({
                                    icon: 'fa fa-cart-arrow-down',
                                    timeout: 1500,
                                    title: 'Product added to cart',
                                    position: 'bottomRight',
                                    onClosed: function () {
                                        $(".spinnerout").hide();
                                        window.reload();
                                    }
                                });
                            } else {
                                $(".spinnerout").hide();
                                iziToast.error({title: 'Error', message: 'Gagal Menambahkan ke Keranjang', position: 'bottomRight'});
                            }
                        })
                        .fail(function () {
                            iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                        });
                        <%-- return false; --%>
                    } else {
                        $(".spinnerout").hide();
                        iziToast.error({title: 'Caution', message: 'Kuantitas Tidak Tersedia', position: 'bottomRight'});
                    }
                } else {
                    iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Pilih  Variant!'});
                }
            });
        });
        document.addEventListener('DOMContentLoaded', function() {

            const decrementButton = document.getElementById('decrementButton');
            const incrementButton = document.getElementById('incrementButton');
            const quantityInput = document.getElementById('quantityInput');

            decrementButton.addEventListener('click', function() {
                if (quantityInput.value > 1) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                }
            });

            incrementButton.addEventListener('click', function() {
                quantityInput.value = parseInt(quantityInput.value) + 1;
            });
            quantityInput.addEventListener('input', function() {
                quantityInput.value = quantityInput.value.replace(/[^0-9]/g, '');
            });

            quantityInput.addEventListener('blur', function() {
                if (quantityInput.value === '' || parseInt(quantityInput.value) < 1) {
                    quantityInput.value = 1;
                }
            });

            const rating = parseFloat(document.getElementById('productRating').innerText);
            const stars = document.querySelectorAll('.star');
            stars.forEach((star, index) => {
                const starValue = index + 1;
                if (starValue <= rating) {
                    star.style.background = 'linear-gradient(90deg, #cd3301 100%, #C0C0C0 0%)';
                } else if (starValue - rating < 1) {
                    const percentage = (rating - index) * 100;
                    star.style.background = `linear-gradient(90deg, #cd3301 ${percentage}%, #C0C0C0 ${percentage}%)`;
                } else {
                    star.style.background = 'linear-gradient(90deg, #C0C0C0 100%, #C0C0C0 0%)';
                }
            });
        });
    </script>
<% else %>
<p>Product not found</p>
<% end_if %>
