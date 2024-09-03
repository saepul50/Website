<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.0.7/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</head>
<% include HeaderCart %>
<% include NavigationCart %>
<body style="font-size: 100%; background-color: #f2f2f2;">
    <% require themedCSS('cart') %>
        <% if $ProductData %>
                <section class="container njobo" style>
                    <div class="container menu d-flex mt-3 py-4">
                        <div class="men1 col-5 d-flex align-items-center">
                            <input type="checkbox" id="masterCheckbox" style="display:none;">
                            <p class="m-0 px-4">Product</p>
                        </div>
                        <div class="men2 col-7 d-none d-sm-flex justify-content-around align-items-center">
                            <p class="m-0">Price</p>
                            <p class="m-0">Quantity</p>
                            <p class="m-0">Final Price</p>
                            <p class="m-0">Act</p>
                        </div>
                        <div class="men3 col-7 d-flex justify-content-end pe-3 d-sm-none">
                            <p class="m-0">Act</p>
                        </div>
                    </div>
                <% loop $ProductData %>
                    <div class="container items d-flex py-3 mt-4 align-items-center">
                        <div class="col-8 col-md-5 first d-flex align-items-center gap-1 gap-md-4">
                            <input type="checkbox" class="productCheckbox" data-id="$ID">
                            <div class="col-3 col-md-5">
                                <img id="productImage" src="$ProductImage" alt="$ProductTitle" class="img-fluid">
                            </div>
                            <p id="productTitle" class="productTitle d-none d-lg-custom">$ProductTitle</p>
                            <h4 style="display: none;" id="ProductID" data-id="$ProductID">$ProductID</h4>
                            <div class="cat">
                                <p class="m-0">Variant:</p>
                                <p class="m-0" id="variantName">$VariantName</p>
                                <p class="m-0" id="variantID" style="display:none;">$VariantID</p>
                                <p>$Category</p>
                            </div>
                        </div>
                        <div class="col-4 col-md-7 quantity d-flex flex-column flex-md-row justify-content-around">
                            <p id="price" class="d-none">$Price</p>
                            <p id="pricef" class="d-none d-md-flex">$FormattedPrice</p>
                            <div class="input-group d-flex justify-content-center align-items-center">
                                <button class="btn m-0" type="button" id="decrementButton">-</button>
                                <input type="text" inputmode="numeric" id="quantityInput" class="form-control" value="$Quantity" min="1">
                                <button class="btn m-0" type="button" id="incrementButton">+</button>
                            </div>
                            <p class="harga d-flex justify-content-center" id="totalPrice">$TotalPrice</p>
                            <button class="buttn m-0 py-1 px-3" data-id="$ID" id="removeItem">Remove</button>
                        </div>
                    </div>
                <% end_loop %>
                    <div class="py-2">
                    </div>
                    <div class="bottom-checkout  px-3 container d-flex justify-content-center align-items-center">
                        <div class="col-5 d-flex align-items-center">
                            <input type="checkbox" id="bottomMasterCheckbox">
                            <p class="m-0 px-4">Product</p>
                        </div>
                        <div class="col-7 d-flex justify-content-end align-items-center gap-md-5 gap-2">
                            <p class=" m-0 d-md-flex d-none ">Tambah Favorit</p>
                            <p class="m-0" style="color: #ff5500;" id="removeAll">Hapus</p>
                            <button class="butt m-0 py-2 px-5" type="button" id="Checkout">Checkout</button>
                        </div>
                    </div>
                </section>
        <% else %>
            <p class="d-flex justify-content-center py-5">Your cart is empty.</p>
        <% end_if %>
        <% include contact %>
        <% include footer %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script>
        $(document).ready(function () {
            $("#Checkout").on('click', function (event) {
                event.preventDefault();
                $(".spinnerout").show();
                var selectedProducts = [];
                $(".productCheckbox:checked").each(function(data) {
                    var productData = {
                        CartID: $(this).data("id"),
                        ProductID: $(this).closest('.items').find('#ProductID').text(),
                        ProductTitle: $(this).closest('.items').find('#productTitle').text(),
                        ProductImage: $(this).closest('.items').find('#productImage').attr("src"),
                        VariantName: $(this).closest('.items').find('#variantName').text(),
                        VariantID: $(this).closest('.items').find('#variantID').text(),
                        Price: $(this).closest('.items').find('#pricef').text(),
                        TotalPrice: $(this).closest('.items').find('#totalPrice').text(),
                        TotalPriceNF: $(this).closest('.items').find('#totalPriceNF').text(),
                        Quantity: $(this).closest('.items').find('#quantityInput').val()
                    };
                    selectedProducts.push(productData);
                    console.log(selectedProducts)
                });

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
                        iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Pilih Product Sebelum Checkout'});
                    }
                })
                .fail(function () {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Error', position: 'bottomRight'});
                });
            });
            $(document).on('click', '#removeItem', function (event) {
                event.preventDefault();
                var productId = $(this).data('id');
                
                $.post("{$BaseHref}/cart/remove", {
                    ID: productId
                })
                .done(function (data) {
                    var response = JSON.parse(data);
                    <%-- console.log(response) --%>
                    if (response.success) {
                        $(this).closest('.items').remove();
                        iziToast.success({
                            icon: 'fa fa-trash',
                            timeout: 1500,
                            title: 'Product Has Been Removed',
                            position: 'bottomRight',
                            onClosed: function () {
                                $(".spinnerout").hide();
                                window.location.reload();
                            }
                        });
                    } else {
                        $(".spinnerout").hide();
                        iziToast.error({title: 'Gagal Menghapus Product', message: response.message, position: 'bottomRight'});
                    }
                })
                .fail(function () {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                });
                <%-- return false; --%>
            });

            $("#removeAll").on('click', function (event) {
                event.preventDefault();
                var selectedProductIds = [];
                $(".productCheckbox:checked").each(function() {
                    var productId = $(this).data('id');
                    selectedProductIds.push(productId);
                    console.log("Selected Product IDs:", selectedProductIds);
                });

                $.post("{$BaseHref}/cart/remove", {
                    IDs: selectedProductIds
                })
                .done(function (data) {
                    var response = JSON.parse(data);
                    console.log(data)
                    if (response.success) {
                        $(".productCheckbox:checked").each(function() {
                            $(this).closest('.items').remove();
                            iziToast.success({
                                icon: 'fa fa-trash',
                                timeout: 1500,
                                title: 'Product Telah Dihapus',
                                position: 'bottomRight',
                                onClosed: function () {
                                    $(".spinnerout").hide();
                                    window.location.reload();
                                }
                            });
                        });
                    } else {
                        $(".spinnerout").hide();
                        iziToast.error({title: 'Gagal Menghapus Product Yang dipilih:', message: response.message, position: 'bottomRight'});
                    }
                })
                .fail(function () {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                });
            });

            $("#masterCheckbox, #bottomMasterCheckbox").on('change', function() {
                var isChecked = $(this).is(':checked');
                $(".productCheckbox").prop('checked', isChecked);
            });
            function formatNumber(number) {
                let parts = number.toString().split('.');
                let integerPart = parts[0];
                let decimalPart = parts.length > 1 ? '.' + parts[1] : '';
                
                let formattedIntegerPart = '';
                while (integerPart.length > 0) {
                    formattedIntegerPart = '.' + integerPart.slice(-3) + formattedIntegerPart;
                    integerPart = integerPart.slice(0, -3);
                }
                
                return formattedIntegerPart.slice(1) + decimalPart;
            }

            function updateTotalPrice(quantityInput, priceElement, totalPriceElement) {
                let priceText = priceElement.textContent.replace('Rp. ', '').replace('.', '').replace('.', '');
                let priceNumber = parseInt(priceText);
                const quantity = parseInt(quantityInput.value, 10);

                <%-- console.log('Price Text:', priceText); --%>
                <%-- console.log('Price Number:', priceNumber); --%>
                <%-- console.log('Quantity:', quantity); --%>
                if (isNaN(priceNumber)) priceNumber = 0;
                if (isNaN(quantity) || quantity < 1) quantity = 1;

                const totalPrice = (priceNumber * quantity).toFixed(0);
                totalPriceElement.textContent = `Rp ${formatNumber(totalPrice)}`;
                    <%-- console.log('Total Price:', totalPrice); --%>
            }

            document.querySelectorAll('.items').forEach(item => {
                const decrementButton = item.querySelector('#decrementButton');
                const incrementButton = item.querySelector('#incrementButton');
                const quantityInput = item.querySelector('#quantityInput');
                const priceElement = item.querySelector('#pricef');
                <%-- console.log('Quantity:', priceElement); --%>
                const totalPriceElement = item.querySelector('#totalPrice');

                decrementButton.addEventListener('click', function() {
                    if (quantityInput.value > 1) {
                        quantityInput.value = parseInt(quantityInput.value, 10) - 1;
                        updateTotalPrice(quantityInput, priceElement, totalPriceElement);
                    }
                });

                incrementButton.addEventListener('click', function() {
                    quantityInput.value = parseInt(quantityInput.value, 10) + 1;
                    updateTotalPrice(quantityInput, priceElement, totalPriceElement);
                });

                quantityInput.addEventListener('input', function() {
                    quantityInput.value = quantityInput.value.replace(/[^0-9]/g, '');
                    if (!quantityInput.value) {
                        quantityInput.value = 1;
                    }
                    updateTotalPrice(quantityInput, priceElement, totalPriceElement);
                });

                updateTotalPrice(quantityInput, priceElement, totalPriceElement);
            });
        });
    </script>
</body>
</html>
