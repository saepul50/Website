<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<% require themedCSS('payment') %>
<% if $Product %>

<section class="FormPayment">
    <div class="formManualTF container d-flex justify-content-center align-items-center pt-4">
        <% loop $Product %>
        <div class="DataCheckout d-none">
            <p id="productID">$ProductID</p>
            <p id="productTitle">$ProductTitle</p>
            <img id="productImage" src="$ProductImage" alt="$ProductTitle" class="img-fluid">
            <p id="cartID">$CartID</p>
            <p id="variantName">$VariantName</p>
            <p id="variantID">$VariantID</p>
            <p id="pricef">$Price</p>
            <p id="totalPrice">$TotalPrice</p>
            <p id="quantity">$Quantity</p>
            <p id="finalPrice">$FinalPrice</p>
            <p id="name">$Name</p>
            <p id="number">$CustomerNumber</p>
            <p id="address">$Address</p>
            <p id="addressDetail">$AddressDetail</p>
            <p id="orderID">$OrderID</p>
            <p id="bank">$Bank</p>
            <p id="bankRek">$BankRek</p>
        </div>
        <% end_loop %>
        <form action="" id="FormDataCheckout" enctype="multipart/form-data">
            <div class="title d-flex align-items-center">
                <div class="col-2 d-flex align-items-center">
                    <a href="{$BaseHref}/"><img src="$resourceURL('themes/simple/images/pngegg.png')" alt="Logo" class="img-fluid"></a>
                </div>
                <div class="col-1 d-flex align-items-center">
                    <div class="line "><p class="p mt-4 ms-3">&nbsp;</p></div>
                    <h4 class="d-flex align-items-center ps-3 pt-2">Payment</h4>
                </div>
            </div>
            <div class="form-group d-flex justify-content-start gap-5 pt-3">
                <div class="">
                    <div class="d-flex pt-2 fs-6">
                        <label>
                            no. Rekening:&nbsp;
                        </label>
                        <label class="fw-bold fs-5 pe-3">
                            <% loop $Product.First %>$BankRek<% end_loop %>
                        </label>
                        <div class="col-1"><% loop $Product.First %>$BankImg.Pad(100, 40)<% end_loop %></div>
                    </div>
                </div>
            </div>
            
            <div class="form-group d-flex align-items-center justify-content-center gap-5">
                <div class="col-3">
                    <label for="name" class="">Waktu:</label>
                </div>
                <div class="col-6">
                    <label id="time"></label>
                </div>
            </div>
            <div class="form-group d-flex align-items-center justify-content-center gap-5">
                <div class="col-3">
                    <label for="namey" class="">Nama:</label>
                </div>
                <div class="col-6">
                    <label class="inputData" type="text" id="namey"><% loop $Product.First %>$Name<% end_loop %></label>
                </div>
            </div>
            <div class="form-group d-flex align-items-center justify-content-center gap-5">
                <div class="col-3">
                    <label for="address" class="">Alamat:</label>
                </div>
                <div class="col-6">
                    <label class="inputData" type="text" id="address" name="address"><% loop $Product.First %>$AddressDetail<% end_loop %></label>
                </div>
            </div>
            <div class="form-group d-flex align-items-center justify-content-center gap-5">
                <div class="col-3">
                    <label for="numbery" class="">Nomor:</label>
                </div>
                <div class="col-6">
                    <label class="inputData" type="text" id="numbery" name="numbery"><% loop $Product.First %>$CustomerNumber<% end_loop %></label>
                </div>
            </div>
            
            <div class="form-group d-flex justify-content-center gap-5">
                <div class="col-3">
                    <label for="nominal" class="">Nominal:</label>
                </div>
                <div class="col-6">
                    <label id="nominal"><% loop $Product.First %>$FinalPrice<% end_loop %></label>
                </div>
            </div>
            <div class="form-group d-flex justify-content-center gap-5">
                <div class="col-3">
                    <label for="order" class="">OrderID:</label>
                </div>
                <div class="col-6">
                    <label id="order"><% loop $Product.First %>$OrderID<% end_loop %></label>
                </div>
            </div>

            <div class="form-group d-flex justify-content-center gap-5">
                <div class="col-3">
                    <label class="" for="transfer-image">Unggah Bukti Transfer:</label>
                </div>
                <div class="col-6">
                    <input type="file" id="transfer-image" name="transferImage" accept="image/*" onchange="previewImage(event)" required style="box-shadow: none;">
                </div>
            </div>
            <div class="form-group d-flex justify-content-center gap-5">
                <div class="col-3">
                </div>
                <div class="col-6">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#imageModal">
                        <img id="image-preview" style="display:none; width: 100px; cursor:pointer;"/>
                    </a>
                </div>
            </div>
            <div class="form-group d-flex justify-content-center gap-5">
                <div class="col-3">
                    <label>Komentar:</label>
                </div>
                <div class="col-6">
                    <textarea id="commenter" name="comments" rows="4" placeholder="Komentar (opsional)"></textarea>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <button class="mb-5 py-2 px-4" type="submit" style="text-transform: none;">Kirim</button>
            </div>
        </form>
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content" style="background: none; border: none;">
                    <div class="modal-header" style="border-bottom: none;">
                        <button type="button" class="btn-close btn-light" data-bs-dismiss="modal" aria-label="Close" style="filter: invert(100%);"></button>
                    </div>
                    <div class="modal-body" style="background: none;">
                        <img id="modal-image" src="" style="width: 100%; height: auto;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<% end_if %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var payments = [];
        <%-- console.log(payments) --%>
        $("#FormDataCheckout").submit(function (event) {
            event.preventDefault();
            $(".spinnerout").show();
            var comments = $("#commenter").val();
            var paymentMethod = "Manual Transfer"
            <%-- console.log(comments) --%>
            var timeCheckout = $("#time").text();
            var name = $("#namey").text();
            var number = $("#numbery").text();
            var fileInput = $('#transfer-image')[0].files[0];
            var formData = new FormData();
            <%-- console.log(fileInput) --%>
            if (fileInput) {
                formData.append('ProofImage', fileInput);
            }
            <%-- console.log(formData) --%>
            $(".DataCheckout").each(function() {
                var paymentData = {
                    ProductID: $(this).find('#productID').text(),
                    ProductTitle: $(this).find('#productTitle').text(),
                    ProductImage: $(this).find('#productImage').attr("src"),
                    CartID: $(this).find('#cartID').text(),
                    VariantName: $(this).find('#variantName').text(),
                    VariantID: $(this).find('#variantID').text(),
                    Price: $(this).find('#pricef').text(),
                    SubTotalPrice: $(this).find('#totalPrice').text(),
                    Quantity: $(this).find('#quantity').text(),
                    FinalPrice: $(this).find('#finalPrice').text(),
                    Address: $(this).find('#address').text(),
                    AddressDetail: $(this).find('#addressDetail').text(),
                    OrderID: $(this).find('#orderID').text(),
                    Bank: $(this).find('#bank').text(),
                    Comments: comments,
                    TimeCheckout: timeCheckout,
                    Number: number,
                    Name: name,
                    PaymentMethod: paymentMethod
                };
                payments.push(paymentData);
                <%-- console.log(paymentData) --%>
            });
            formData.append("data", JSON.stringify(payments));
            $.ajax({
                url: '{$BaseHref}/checkout/state',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    <%-- return false; --%>
                    iziToast.success({
                        icon: 'fa fa-shipping-fast',
                        timeout: 4000,
                        title: 'Sukses Checkout',
                        position: 'bottomRight',
                        onClosed: function () {
                            $(".spinnerout").hide();
                            window.location.href = "{$BaseHref}/order";
                        }
                    });
                },
                error: function(xhr, status, error) {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Error', message: error, position: 'bottomRight'});
                }
            });
        });
        function previewImage(event) {
            var reader = new FileReader();
            var img = document.getElementById('image-preview');
            reader.onload = function() {
                img.src = reader.result;
                img.style.display = 'block';
                var modalImg = document.getElementById('modal-image');
                modalImg.src = reader.result;
            }

            if (event.target.files[0]) {
                selectedImage = event.target.files[0];
                reader.readAsDataURL(event.target.files[0]);
            }
        }
        function updateTime() {
            var now = new Date();
            var day = now.getDate().toString().padStart(2, '0');
            var month = (now.getMonth() + 1).toString().padStart(2, '0');
            var year = now.getFullYear();
            var hours = now.getHours().toString().padStart(2, '0');
            var minutes = now.getMinutes().toString().padStart(2, '0');
            var seconds = now.getSeconds().toString().padStart(2, '0');
            
            var formattedTime = `${day}/${month}/${year}   ${hours}:${minutes}:${seconds}`;
            
            $('.form-group').each(function () {
                $(this).find('#time').text(formattedTime);
            });
            <%-- document.getElementById('time').innerHTML = formattedTime; --%>
        }

        setInterval(updateTime, 500);

        updateTime();
    </script>