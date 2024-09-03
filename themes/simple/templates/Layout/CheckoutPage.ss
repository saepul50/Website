    <% require themedCSS('checkout') %>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css"> --%>
    <div class="spinnerout">
        <div class="spinnerin">
        <div class="dot-spinner" id="dotSpinner">
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
            <div class="dot-spinner__dot"></div>
        </div>
        </div>
    </div>
   <section class="seccontainer">
        <% include HeaderCheckout %>
        <p class="m-0">&nbsp;</p>
        <div class="address py-4">
            <div class="container">
                <p class="d-flex align-items-center" style="color: #cd3301;"><span class="material-icons pe-2">place</span> Alamat Pengiriman</p>
                <div class="d-flex dress pt-2 justify-content-center">
                    <% if $AddressData %>
                        <% loop AddressData %>
                            <div class="col-2 p-1 d-flex flex-wrap">
                                <p class="fw-bold" id="numbery">$Number</p>
                            </div>
                            <div class="col-8 d-flex justify-content-center">
                                <p id="addressDetail" class="text-center" >$AddressDetail, $Address</p>
                                <p id="addressDet" class="text-center" style="display:none;">$AddressDetail</p>
                                <p id="addressy" style="display:none;">$Address</p>
                                <p id="namey" style="display:none;">$Name</p>
                            </div>
                            <div class="col-2 d-flex justify-content-end align-items-start">
                                <button class="changeButton p-0 m-0" data-bs-toggle="modal" data-bs-target="#addressModal">Ubah</button>
                            </div>
                        <% end_loop %>
                    <% else %>
                    <p>Please Insert Address</p>
                    <div class="col-2 p-1 d-flex justify-content-end align-items-start">
                        <button class="changeButton p-0 m-0" data-bs-toggle="modal" data-bs-target="#addressModal">Ubah</button>
                    </div>
                    <% end_if %>
                </div>
            </div>
        </div>
        <p id="emails" class="d-none">$MemberEmail</p>
        <div class="order py-5 mt-3">
            <% if $CheckoutData %>
                <div class="container">
                    <div class="d-grid d-md-flex">
                        <div class="col-12 col-md-6 tporder">
                            <p class="d-flex align-items-center">Product Order</p>
                            <div class="responsive d-flex d-md-none align-items-center">
                            <% loop $CheckoutData %>
                                <div class="">
                                    <label id="time" class="d-none"></label>
                                    <div id="commenter" class="d-none"></div>
                                </div>
                                <div class="d-flex gap-2 align-items-center">
                                    <h4 style="display: none;" id="ProductID" data-id="$ProductID">$ProductID</h4>
                                    <div class="">
                                        <img id="productImage" src="$ProductImage" alt="$ProductTitle" class="img-fluid">
                                    </div>
                                    <div class="col-8 p-0">
                                        <p id="productTitle" class="m-0" style="font-size: .9em">$ProductTitle</p>
                                        <p id="variantName" class="m-0 pt-3 ps-3" style="font-size: .9em">$VariantName</p>
                                        <p id="variantID" style="display: none;">$VariantID</p>
                                        <p id="cartID" style="display: none;">$CartID</p>
                                        <p id="orderID" style="display: none;"></p>
                                    </div>
                                </div>
                            <% end_loop %>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 pt-3 pt-md-0 tsporder d-flex justify-content-around ps-3">
                            <p>Harga Satuan</p>
                            <p>Jumlah</p>
                            <p>SubTotal Product</p>
                        </div>
                    </div>
                    <% loop $CheckoutData %>
                        <div class="porder d-flex align-items-center pb-3">
                            <div class="responsive d-none d-md-flex align-items-center">
                                <div class="extra">
                                    <label id="time" class="d-none"></label>
                                    <div id="commenter" class="d-none"></div>
                                </div>
                                <div class="d-flex gap-2 align-items-center">
                                    <h4 style="display: none;" id="ProductID" data-id="$ProductID">$ProductID</h4>
                                    <div class="col-6 col-md-2">
                                        <img id="productImage" src="$ProductImage" alt="$ProductTitle" class="img-fluid">
                                    </div>
                                    <div>
                                        <p id="productTitle" class="m-0">$ProductTitle</p>
                                        <p id="variantName" class="m-0 pt-3 ps-3">$VariantName</p>
                                        <p id="variantID" style="display: none;">$VariantID</p>
                                        <p id="cartID" style="display: none;">$CartID</p>
                                        <p id="orderID" style="display: none;"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 d-flex justify-content-around">
                                <p id="pricef">$Price</p>
                                <p id="priceNF" class="d-none"></p>
                                <p id="quantity">$Quantity</p>
                                <p id="totalPrice">$TotalPrice</p>
                                <p id="PriceNF" class="d-none">$TotalPrice</p>
                            </div>
                        </div>
                    <% end_loop %>
                </div>
            <% else %>
                <p>No checkout data available.</p>
            <% end_if %>
        </div>
        <div class="pembayaran mt-3">
            <div class="container py-5">
                <div class="tpembayaran py-3 d-flex flex-column flex-lg-row">
                    <div class="tleft col-10 col-lg-2 d-flex align-items-center pb-2">
                        <p class="m-0">Metode Pembayaran</p>
                    </div>
                    <div class="tright col-12 col-lg-10 py-3 py-xl-0 d-flex justify-content-end">
                        <div class="metode d-flex justify-content-center justify-content-lg-start align-items-center gap-4 w-100">
                            <div class="submetode d-flex align-items-center justify-content-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="submetode" class="d-none" value="ManualTF" id="manualTF" checked>
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <p class="m-0" id="">Manual Transfer</p>
                                </div>
                            </div>
                            <div class="submetode d-flex align-items-center justify-content-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="submetode" class="d-none" value="COD" id="cod">
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <p class="m-0" id="">COD</p>
                                </div>
                            </div>
                            <div class="submetode d-flex align-items-center justify-content-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="submetode" class="d-none" value="Duitku" id="Duitku">
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <p class="m-0" id="">Duitku</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bank pb-5" id="bankList">
                    <div class="form-group d-flex">
                        <div class="col-2">
                            <label for="bankname" class=" m-0 fs-6">Pilih Bank: </label>
                        </div>
                        <div class="col-10">
                            <div class="banklist d-flex align-items-center justify-content-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="sublist" value="BCA">
                                </div>
                                <div class="d-flex ps-2 align-items-center justify-content-start">
                                    <div class="col-md-1 col-3">
                                        <img src="$resourceURL('themes/simple/images/bca.png')" alt="Logo" class="img-fluid">
                                    </div>
                                    <div class="col-11">
                                        <p class="m-0 ps-md-3 ps-0 fw-bold" id="">BCA</p>
                                    </div>
                                </div>
                            </div>
                            <div class="banklist py-3 d-flex align-items-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="sublist" value="BRI">
                                </div>
                                <div class="d-flex ps-2 align-items-center justify-content-start">
                                    <div class="col-md-1 col-3">
                                        <img src="$resourceURL('themes/simple/images/bri.png')" alt="Logo" class="img-fluid">
                                    </div>
                                    <div class="col-11">
                                        <p class="m-0 ps-md-3 ps-0 fw-bold" id="">BRI</p>
                                    </div>
                                </div>
                            </div>
                            <div class="banklist d-flex align-items-center gap-1">
                                <div class="d-flex align-items-center justify-content-end">
                                    <input type="radio" name="sublist" value="Mandiri">
                                </div>
                                <div class="d-flex ps-2 align-items-center justify-content-start">
                                    <div class="col-md-1 col-3">
                                        <img src="$resourceURL('themes/simple/images/mandiri.png')" alt="Logo" class="img-fluid">
                                    </div>
                                    <div class="col-11">
                                        <p class="m-0 ps-md-3 ps-0 fw-bold" id="">Mandiri</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="duitku" id="duitkuForm">
                    <div class=" col-12 col-xl-7 w-100">
                        <div class="bg-light p-4 border shadow">
                            <form class="w-100">
                                <div class="container ps-4 m-0">
                                    <div class="row p-0">
                                        <div class="p-2">  
                                            <span class="">Metode Pembayaran</span>
                                            <div class="card m-2">
                                                <div class="accordion" id="accordionExample">
                                                    <div class="card">
                                                        <div class="card-header p-0" id="headingBank">
                                                            <h2 class="mb-0">
                                                                <button class="btn btn-light btn-block text-left collapsed p-3 rounded-0 border-bottom-custom" type="button" data-toggle="collapse" data-target="#collapseBank" aria-expanded="false" aria-controls="collapseBank">
                                                                    <div class="d-flex align-items-center justify-content-between">
                                                                        <span>Pilih pembayaran</span>
                                                                    </div>
                                                                </button>
                                                            </h2>
                                                        </div>
                                                        <div id="collapseBank" class="collapse" aria-labelledby="headingBank" data-parent="#accordionExample">
                                                            <div id="paymentOptions" class="card-body payment-card-body d-flex flex-column">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="finalpembayaran d-flex py-3">
                    <div class="col-0 col-sm-7">
                        <p>&nbsp;</p>
                    </div>
                    <div class="col-12 col-sm-5">
                        <div class="calculate d-flex justify-content-between">
                            <div class="mw-100">
                                <p>Subtotal Product</p>
                                <p style="font-size: 1rem; font-weight: 400;">Total Pemesanan: &nbsp;</p>
                            </div>
                            <div class="mw-100">
                                <div class="d-flex justify-content-end">
                                    <p>Rp. </p>
                                    <p class="" id="finalPrices"></p>
                                    <p class="d-none" id="finalPriceNF"></p>
                                </div>
                                <p style="color: #cd3301;" id="finalPrice"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end pt-3">
                    <button class="butt m-0 py-2 px-5 d-flex me-2 justify-content-end" type="button" id="Checkout">Checkout</button>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addressModalLabel">Ubah Data Pengiriman</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addressForm" class="w-100" method="POST">
                            <div class="d-flex justify-content-center gap-3">
                                <div class="form-group number">
                                    <input type="text" input-mode="number"pattern="[0-9+]*" maxlength="14" class="form-control" id="number" required value="<% if AddressData %><% loop AddressData %>$Number<% end_loop %><% end_if %>">
                                    <label for="number" class="form-label">Nomor Telepon</label>
                                </div>
                                <div class="form-group name">
                                    <input type="text" class="form-control" id="name" required value="<% if AddressData %><% loop AddressData %>$Name<% end_loop %><% end_if %>">
                                    <label for="name" class="form-label">Nama Lengkap</label>
                                </div>
                            </div>
                            <div class="mb-3 ms-3 addrs">
                                <div class="input-group d-flex">
                                    <input type="text" id="addressInput" class="form-control" placeholder="Klik untuk memilih alamat" style="font-size: .8rem" readonly value="<% if AddressData %><% loop AddressData %>$Address<% end_loop %><% end_if %>">
                                    <button class="btn-clear" id="clearButton">&times;</button>
                                </div>
                                <div id="dropdownContainer" class="dropdown-menu mt-2 p-3 border rounded mw-100">
                                    <div class="d-flex justify-content-around p-0">
                                        <div class="mb-2 d-flex justify-content-center">
                                            <h5 class="dropdown-header" data-target="provinceContent" id="headerProvince">Provinsi</h5>
                                        </div>
                                        <div class="mb-2">
                                            <h5 class="dropdown-header" data-target="regencyContent" id="headerRegency">Kota/Kabupaten</h5>
                                        </div>
                                        <div class="mb-2">
                                            <h5 class="dropdown-header" data-target="subdistrictContent" id="headerSubdistrict">Kecamatan</h5>
                                        </div>
                                        <div class="mb-2">
                                            <h5 class="dropdown-header" data-target="districtContent" id="headerDistrict">Kelurahan</h5>
                                        </div>
                                    </div>
                                    <div id="provinceContent" class="dropdown-content"></div>
                                    <div id="regencyContent" class="dropdown-content"></div>
                                    <div id="subdistrictContent" class="dropdown-content"></div>
                                    <div id="districtContent" class="dropdown-content"></div>
                                </div>
                            </div>
                            <div class="mb-3 ms-3 tarea" style="position: relative;">
                                <textarea class="form-control" id="address" rows="3" required><% if AddressData %><% loop AddressData %>$AddressDetail<% end_loop %><% end_if %></textarea>
                                <label for="address" class="form-label">Nama Jalan, Gedung, No. Rumah</label>
                            </div>
                            <button type="button" id="saveButton" class="bttn ms-3 py-1 px-3">Simpan</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://app-sandbox.duitku.com/lib/js/duitku.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> --%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<%-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script> --%>
    <script>
        $(document).ready(function () {
            function generateOrderID() {
                const timestamp = Date.now().toString(36);
                const randomStr = Math.random().toString(36).substring(2, 10);
                return `METRO${timestamp}${randomStr}`;
            }

            const orderID = generateOrderID();
            
            $('.porder').each(function () {
                $(this).find('#orderID').text(orderID);
            });
            
            $("input[name='submetode']").on('change', function() {
                var paymentMethod = $("input[name='submetode']:checked").val();
                
                if (paymentMethod === "COD") {
                    $("input[name='sublist']:checked").prop('checked', false);
                }
            });

            var address = $("#addressy").text().trim();
            var addressDet = $("#addressDet").text();
            var addressComponents = address.split(', ');

            addressComponents = addressComponents.map(function(component) {
                return component.split(':')[1].trim();
            });

            addressComponents.reverse();
            var formattedAddress = addressComponents.join(', ');
            $("#addressDetail").text(addressDet+ ", " + formattedAddress);
        });
  
        let selected = {
            province: false,
            regency: false,
            subdistrict: false,
            district: false
        };

        function initHeaders() {
            document.querySelectorAll('.dropdown-header').forEach(header => {
                header.classList.add('disabled');
            });
            document.getElementById('headerProvince').classList.remove('disabled');
        }

        document.getElementById('addressInput').addEventListener('click', function() {
            document.getElementById('dropdownContainer').classList.toggle('show');
        });

        document.querySelectorAll('.dropdown-header').forEach(header => {
            header.addEventListener('click', function() {
                if (this.classList.contains('disabled')) return;

                document.querySelectorAll('.dropdown-header').forEach(h => {
                    h.classList.remove('active');
                });
                this.classList.add('active');

                const targetId = this.getAttribute('data-target');
                document.querySelectorAll('.dropdown-content').forEach(content => {
                    content.classList.remove('show');
                });
                document.getElementById(targetId).classList.add('show');
            });
        });

        function setupOptionClickListeners() {
            document.querySelectorAll('.dropdown-content .dropdown-item').forEach(option => {
                option.removeEventListener('click', handleOptionClick);
                option.addEventListener('click', handleOptionClick);
            });
        }

        function handleOptionClick() {
            const header = document.querySelector('.dropdown-header.active').innerText;
            const target = document.querySelector('.dropdown-header.active').getAttribute('data-target');
            const value = this.getAttribute('data-value');
            const input = document.getElementById('addressInput');

            if (!selected[header.toLowerCase()]) {
                input.value += (input.value ? ', ' : '') + header + ': ' + value;
                selected[header.toLowerCase()] = true;

                const nextHeader = document.querySelector(`.dropdown-header[data-target="${getNextContentId(target)}"]`);
                if (nextHeader) {
                    nextHeader.classList.remove('disabled');
                    nextHeader.click();
                } else {
                    document.getElementById('dropdownContainer').classList.remove('show');
                    document.querySelectorAll('.dropdown-content').forEach(content => {
                        content.classList.remove('show');
                    });
                    document.querySelectorAll('.dropdown-header').forEach(header => {
                        header.classList.remove('active');
                    });
                }
            }
        }

        function getNextContentId(currentId) {
            const headers = ['provinceContent', 'regencyContent', 'subdistrictContent', 'districtContent'];
            const currentIndex = headers.indexOf(currentId);
            return headers[currentIndex + 1] || null;
        }

        function resetHeaders() {
            document.querySelectorAll('.dropdown-header').forEach(header => {
                header.classList.remove('active');
                header.classList.add('disabled');
            });
            document.getElementById('headerProvince').classList.remove('disabled');
            selected = { // reset e
                province: false,
                regency: false,
                subdistrict: false,
                district: false
            };
            document.getElementById('addressInput').value = '';
        }

        document.addEventListener('click', function(event) {
            if (!event.target.closest('#addressInput') && !event.target.closest('#dropdownContainer')) {
                document.getElementById('dropdownContainer').classList.remove('show');
                document.querySelectorAll('.dropdown-content').forEach(content => {
                    content.classList.remove('show');
                });
                document.querySelectorAll('.dropdown-header').forEach(header => {
                    header.classList.remove('active');
                });
            }
        });

        document.getElementById('clearButton').addEventListener('click', function(event) {
            event.preventDefault();
            resetHeaders();
            setupOptionClickListeners(); // tambah reload
        });

        initHeaders();
        setupOptionClickListeners();

        document.addEventListener('DOMContentLoaded', function () {
            fetch('https://kanglerian.github.io/api-wilayah-indonesia/api/provinces.json')
                .then(response => response.json())
                .then(provinces => {
                    var data = provinces;
                    var content = '';
                    data.forEach(element => {
                        content += `<div class="dropdown-item" style="cursor: pointer;" data-reg="${element.id}" data-value="${element.name}">${element.name}</div>`;
                    });
                    document.getElementById('provinceContent').innerHTML = content;
                    setupOptionClickListeners();
                });

            const provinceContent = document.getElementById('provinceContent');
            provinceContent.addEventListener('click', (e) => {
                if (e.target && e.target.matches('div[data-reg]')) {
                    var province = e.target.dataset.reg;
                    fetch(`https://kanglerian.github.io/api-wilayah-indonesia/api/regencies/${province}.json`)
                        .then(response => response.json())
                        .then(regencies => {
                            var data = regencies;
                            var content = '';
                            data.forEach(element => {
                                content += `<div class="dropdown-item" data-reg="${element.id}" data-value="${element.name}">${element.name}</div>`;
                            });
                            document.getElementById('regencyContent').innerHTML = content;
                            setupOptionClickListeners();
                        });
                }
            });

            const regencyContent = document.getElementById('regencyContent');
            regencyContent.addEventListener('click', (e) => {
                if (e.target && e.target.matches('div[data-reg]')) {
                    var regency = e.target.dataset.reg;
                    fetch(`https://kanglerian.github.io/api-wilayah-indonesia/api/districts/${regency}.json`)
                        .then(response => response.json())
                        .then(districts => {
                            var data = districts;
                            var content = '';
                            data.forEach(element => {
                                content += `<div class="dropdown-item" style="cursor: pointer;" data-reg="${element.id}" data-value="${element.name}">${element.name}</div>`;
                            });
                            document.getElementById('subdistrictContent').innerHTML = content;
                            setupOptionClickListeners();
                        });
                }
            });

            const subdistrictContent = document.getElementById('subdistrictContent');
            subdistrictContent.addEventListener('click', (e) => {
                if (e.target && e.target.matches('div[data-reg]')) {
                    var subdistrict = e.target.dataset.reg;
                    fetch(`https://kanglerian.github.io/api-wilayah-indonesia/api/villages/${subdistrict}.json`)
                        .then(response => response.json())
                        .then(villages => {
                            var data = villages;
                            var content = '';
                            data.forEach(element => {
                                content += `<div class="dropdown-item" style="cursor: pointer;" data-reg="${element.id}" data-value="${element.name}">${element.name}</div>`;
                            });
                            document.getElementById('districtContent').innerHTML = content;
                            setupOptionClickListeners();
                        });
                }
            });
        });
    </script>
        <script>
            async function urlToFile(url, filename) {
                const res = await fetch(url);
                const blob = await res.blob();
                return new File([blob], filename, { type: blob.type });
            }

            $("#Checkout").on('click', async function (event) {
                event.preventDefault();
                $(".spinnerout").show();
                var addressExists = $(".dress #addressDetail").length > 0;
                var selectedProducts = [];
                var imageFile;

                if (!addressExists) {
                    iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Masukkan Alamat!'});
                    $(".spinnerout").hide();
                    return;
                }

                var paymentMethod = $("input[name='submetode']:checked").val();
                if (paymentMethod === "ManualTF") {
                    for (const item of $(".porder")) {
                        var finalPricesValue = $(".calculate #finalPrice").text();
                        var Name = $(".dress #namey").text();
                        var Number = $(".dress #numbery").text();
                        var Address = $(".dress #addressy").text();
                        var AddressDetail = $(".dress #addressDetail").text();
                        var bankSelected = $("input[name='sublist']:checked").val();
                        var accountNumber;
                        var paymentMethod = "Manual Transfer";
                        var bankImage = "";

                        switch (bankSelected) {
                            case "BCA":
                                accountNumber = "1234567890";
                                bankImage = $(".banklist input[value='BCA']").closest('.banklist').find('img').attr("src");
                                break;
                            case "BRI":
                                accountNumber = "0987654321";
                                bankImage = $(".banklist input[value='BRI']").closest('.banklist').find('img').attr("src");
                                break;
                            case "Mandiri":
                                accountNumber = "1122334455";
                                bankImage = $(".banklist input[value='Mandiri']").closest('.banklist').find('img').attr("src");
                                break;
                            default:
                                accountNumber = "Unknown";
                                break;
                        }

                        if (bankImage) {
                            const randomNumber = Math.floor(Math.random() * 1000);
                            const fileName = `bankImage_${Date.now()}_${randomNumber}.png`;
                            imageFile = await urlToFile(bankImage, fileName);
                        }

                        var paymentData = {
                            ProductID: $(item).find('#ProductID').text(),
                            CartID: $(item).find('#cartID').text(),
                            ProductTitle: $(item).find('#productTitle').text(),
                            ProductImage: $(item).find('#productImage').attr("src"),
                            VariantName: $(item).find('#variantName').text(),
                            VariantID: $(item).find('#variantID').text(),
                            Price: $(item).find('#pricef').text(),
                            Quantity: $(item).find('#quantity').text(),
                            SubTotalPrice: $(item).find('#totalPrice').text(),
                            OrderID: $(item).find('#orderID').text(),
                            Bank: bankSelected,
                            BankImg: bankImage,
                            BankRek: accountNumber,
                            FinalPrice: finalPricesValue,
                            Name: Name,
                            Number: Number,
                            Address: Address,
                            AddressDetail: AddressDetail,
                            PaymentMethod: paymentMethod
                        };
                        selectedProducts.push(paymentData);
                        <%-- console.log(selectedProducts) --%>
                    }
                    var bankSelected = $("input[name='sublist']:checked").val();
                    if (bankSelected) {
                        var formData = new FormData();
                        formData.append('paymentDatas', JSON.stringify(selectedProducts));
                        if (imageFile) {
                            formData.append('bankImage', imageFile);
                        }

                        $.ajax({
                            url: "{$BaseHref}/payment/staticpayment",
                            type: "POST",
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function (data) {
                                <%-- return false; --%>
                                var response = JSON.parse(data);
                                if (response.success) {
                                    iziToast.success({
                                        timeout: 1000,
                                        title: 'Tunggu Sebentar',
                                        position: 'bottomRight',
                                        onClosed: function () {
                                            $(".spinnerout").hide();
                                            var redirectOrderID = $(".porder").first().find('#orderID').text();
                                            window.location.href = "{$BaseHref}/payment/paymentstate/" + redirectOrderID;
                                        }
                                    });
                                } else {
                                    $(".spinnerout").hide();
                                    iziToast.error({title: 'Gagal Checkout', position: 'bottomRight'});
                                }
                            },
                            error: function () {
                                $(".spinnerout").hide();
                                iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                            }
                        });
                    } else {
                        $(".spinnerout").hide();
                        iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Pilih Pembayaran!'});
                    }
                } else if (paymentMethod === "Duitku") {
                    var formData = new FormData();
                    var finalPricesValue = $(".calculate #finalPriceNF").text();
                    var Name = $(".dress #namey").text();
                    var Email = $("#emails").text();
                    var Number = $(".dress #numbery").text();
                    var Address = $(".dress #addressy").text();
                    var AddressDetail = $(".dress #addressDetail").text();
                    var paymentSelected = $(".porder input[name='paymentMethod']:checked").val();
                    var bankSelected = $(".payment-option input[name='paymentMethod']:checked").data("method");
                    var comments = $("#commenter").text();
                    var timeCheckout = $(".extra #time").text();
                    var paymentMethod = "Duitku Transfer";
                    for (const item of $(".porder")) {
                        var paymentSelected = $("input[name='paymentMethod']:checked").val();
                        var productData = {
                            ProductID: $(item).find('#ProductID').text(),
                            CartID: $(item).find('#cartID').text(),
                            ProductTitle: $(item).find('#productTitle').text(),
                            ProductImage: $(item).find('#productImage').attr("src"),
                            VariantName: $(item).find('#variantName').text(),
                            VariantID: $(item).find('#variantID').text(),
                            Price: $(item).find('#pricef').text(),
                            Quantity: $(item).find('#quantity').text(),
                            SubTotalPrice: $(item).find('#totalPrice').text(),
                            OrderID: $(item).find('#orderID').text(),
                            FinalPrice: finalPricesValue,
                            Name: Name,
                            Email: Email,
                            Number: Number,
                            Address: Address,
                            AddressDetail: AddressDetail,
                            PaymentSelected: paymentSelected,
                            Bank: bankSelected,
                            Comments: comments,
                            TimeCheckout: timeCheckout,
                            PaymentMethod: paymentMethod
                        };
                        selectedProducts.push(productData);
                        <%-- console.log(selectedProducts)    --%>
                    }
                    formData.append('paymentDatas', JSON.stringify(selectedProducts));
                    <%-- console.log(formData) --%>
                    if(paymentSelected){
                        $.ajax({
                            url: "{$BaseHref}/duitkupayment/transaction",
                            type: "POST",
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function (results) {
                                <%-- console.log("Raw response: ", results); --%>
                                try {
                                    var response = JSON.parse(results);
                                    <%-- console.log("response: ", response); --%>
                                    if (response && response.paymentUrl) {
                                        iziToast.success({
                                            timeout: 2000,
                                            title: 'Tunggu Sebentar',
                                            message: 'Memproses Pembayaran',
                                            position: 'bottomRight',
                                            onClosed: function () {
                                                $(".spinnerout").hide();
                                                window.location.href = response.paymentUrl;
                                            }
                                        });
                                    } else {
                                        $(".spinnerout").hide();
                                        iziToast.error({title: 'Error', message: 'URL pembayaran tidak ditemukan dalam respons.', position: 'bottomRight'});
                                    }
                                } catch (e) {
                                    $(".spinnerout").hide();
                                    iziToast.error({title: 'Error' + e.message, position: 'bottomRight'});
                                }
                            },
                            error: function () {
                                $(".spinnerout").hide();
                                iziToast.error({title: 'Error', position: 'bottomRight'});
                            }
                        });
                    } else {
                        $(".spinnerout").hide();
                        iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Pilih Pembayaran!'});
                    }
                } else if (paymentMethod === "COD") {
                    var paymentMethod = "Cash On Delivery";
                    $("input[name='sublist']:checked").prop('checked', false);
                    var formData = new FormData();
                    var finalPricesValue = $(".calculate #finalPriceNF").text();
                    var Name = $(".dress #namey").text();
                    var Email = $("#emails").text();
                    var Number = $(".dress #numbery").text();
                    var Address = $(".dress #addressy").text();
                    var AddressDetail = $(".dress #addressDetail").text();
                    var bankSelected = "Cash On Delivery";
                    var paymentSelected = $(".porder input[name='paymentMethod']:checked").val();
                    var comments = $("#commenter").text();
                    var timeCheckout = $(".extra #time").text();
                    var paymentMethod = "Cash On Delivery";
                    for (const item of $(".porder")) {
                        var productData = {
                            ProductID: $(item).find('#ProductID').text(),
                            CartID: $(item).find('#cartID').text(),
                            ProductTitle: $(item).find('#productTitle').text(),
                            ProductImage: $(item).find('#productImage').attr("src"),
                            VariantName: $(item).find('#variantName').text(),
                            VariantID: $(item).find('#variantID').text(),
                            Price: $(item).find('#pricef').text(),
                            Quantity: $(item).find('#quantity').text(),
                            SubTotalPrice: $(item).find('#totalPrice').text(),
                            OrderID: $(item).find('#orderID').text(),
                            FinalPrice: finalPricesValue,
                            Name: Name,
                            Email: Email,
                            Number: Number,
                            Address: Address,
                            AddressDetail: AddressDetail,
                            Bank: bankSelected,
                            Comments: comments,
                            TimeCheckout: timeCheckout,
                            PaymentMethod: paymentMethod
                        };
                        selectedProducts.push(productData);
                        console.log(selectedProducts)   
                    }
                    formData.append('paymentDatas', JSON.stringify(selectedProducts));
                    <%-- console.log(formData) --%>
                    $.ajax({
                        url: "{$BaseHref}/checkout/cash",
                        type: "POST",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function (results) {
                            iziToast.success({
                                timeout: 4000,
                                icon: 'fa fa-shipping-fast',
                                title: 'Sukses Checkout',
                                position: 'bottomRight',
                                onClosed: function () {
                                    $(".spinnerout").hide();
                                    window.location.href = "{$BaseHref}/order";
                                }
                            });
                        },
                        error: function () {
                            $(".spinnerout").hide();
                            iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                        }
                    });
                }
            });

            $("#saveButton").on('click', function (event) {
                event.preventDefault();
                var data = {
                    Number: $('#number').val(),
                    Name: $('#name').val(),
                    Address: $('#addressInput').val(),
                    AddressDetail: $('#address').val()
                };
                <%-- console.log(data) --%>
                $.post("{$BaseHref}/checkout/address", {
                    Number: $('#number').val(),
                    Name: $('#name').val(),
                    Address: $('#addressInput').val(),
                    AddressDetail: $('#address').val()
                })
                .done(function (data) {
                    var response = JSON.parse(data);
                    if (response.success) {
                        window.location.reload();
                    } else {
                        iziToast.warning({title: 'Caution', message: 'Lengkapi Data Pengiriman', position: 'bottomRight'});
                    }
                })
                .fail(function () {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
                });
                <%-- return false; --%>
            });
            document.addEventListener('DOMContentLoaded', (event) => {
                const numberInput = document.getElementById('number');

                numberInput.addEventListener('input', () => {
                    numberInput.value = numberInput.value.replace(/[^0-9+]/g, '');

                    if (numberInput.value.length > 14) {
                        numberInput.value = numberInput.value.slice(0, 14);
                    }
                });

                document.querySelectorAll('.submetode').forEach(function(submetode) {
                    submetode.addEventListener('click', function() {
                        const radioInput = this.querySelector('input[type="radio"]');
                        if (radioInput) {
                            radioInput.checked = true;
                            $(radioInput).trigger('change');
                            $('.submetode').removeClass('active');
                            $(this).addClass('active');
                            toggleForms();
                        }
                    });
                });

                $('.submetode input[type="radio"]:checked').closest('.submetode').addClass('active');

                function toggleForms() {
                    const activeSubmetode = document.querySelector('.submetode.active');
                    if (activeSubmetode) {
                        const activeRadioValue = activeSubmetode.querySelector('input[type="radio"]').value;

                        const formManualTF = document.getElementById('bankList');
                        const formDuitku = document.getElementById('duitkuForm');

                        formManualTF.style.display = (activeRadioValue === 'ManualTF') ? 'block' : 'none';

                        if (activeRadioValue === 'Duitku') {
                            formDuitku.style.display = 'block';
                            formManualTF.style.display = 'none';

                            $.ajax({
                                url: "{$BaseHref}/duitkupayment/paymentmethod",
                                type: "POST",
                                success: function(results) {
                                    var data = JSON.parse(results).Data;
                                    var collapseDuitku = $('#paymentOptions');
                                    collapseDuitku.empty();

                                    data.forEach(function(payment) {
                                        var paymentOption = `
                                            <label class="payment-option">
                                                <input type="radio" name="paymentMethod" value="${payment.paymentMethod}" data-method="${payment.paymentName}" style="cursor:pointer">
                                                <img src="${payment.paymentImage}" width="50" alt="${payment.name}">
                                                ${payment.paymentName}
                                            </label>
                                        `;
                                        collapseDuitku.append(paymentOption);
                                    });
                                },
                                error: function() {
                                    $(".spinnerout").hide();
                                    iziToast.error({title: 'Error', message: 'Saat Memuat Data', position: 'bottomRight'});
                                }
                            });
                        } else {
                            formDuitku.style.display = 'none';
                        }
                    }
                }

                toggleForms();

                document.querySelectorAll('.submetode input[type="radio"]').forEach(function(radio) {
                    radio.addEventListener('change', toggleForms);
                });

                function FinalPrice() {
                    let priceElements = [];
                    
                    document.querySelectorAll('.porder').forEach(item => {
                        const priceElement = item.querySelector('#totalPrice');

                        <%-- console.log(TotalpriceElement) --%>
                        if (priceElement) {
                            priceElements.push(priceElement);
                        }
                    });

                    let totalPrice = 0;

                    priceElements.forEach(element => {
                        let priceText = element.textContent.replace('Rp. ', '').replace('Rp', '').replace('.', '').replace('.', '').replace('.', '').replace('.', '').replace('.', '');
                        <%-- console.log(priceText); --%>
                        const price = parseInt(priceText);

                        if (!isNaN(price)) {
                            totalPrice += price;
                        }
                    });

                    return totalPrice;
                }
                
                const finalPrice = FinalPrice();
                <%-- console.log(finalPrice) --%>
                const finalPriceElement = document.getElementById('finalPrice');
                const finalPricesElement = document.getElementById('finalPrices');
                const finalPriceNFElement = document.getElementById('finalPriceNF');
                finalPriceNFElement.textContent = finalPrice;
                finalPriceElement.textContent = 'Rp. ' + finalPrice.toLocaleString('id-ID');
                finalPricesElement.textContent = finalPrice.toLocaleString('id-ID');
                <%-- console.log('Total Harga: Rp.' + finalPrice.toLocaleString('id-ID')); --%>

                document.querySelectorAll('.porder').forEach(item => {
                    const PriceNFElement = item.querySelector('#PriceNF');
                    const PriceNFText = PriceNFElement.textContent.replace('Rp ', '').replace('.', '').replace('.', '').replace('.', '').replace('.', '').replace('.', '');
        
                    PriceNFElement.textContent = PriceNFText;
                });
            });
            function updateTime() {
                var now = new Date();
                var day = now.getDate().toString().padStart(2, '0');
                var month = (now.getMonth() + 1).toString().padStart(2, '0');
                var year = now.getFullYear();
                var hours = now.getHours().toString().padStart(2, '0');
                var minutes = now.getMinutes().toString().padStart(2, '0');
                var seconds = now.getSeconds().toString().padStart(2, '0');
                
                var formattedTime = `${day}/${month}/${year}   ${hours}:${minutes}:${seconds}`;
                
                $('.porder').each(function () {
                    $(this).find('#time').text(formattedTime);
                });
                <%-- document.getElementById('time').innerHTML = formattedTime; --%>
            }

            setInterval(updateTime, 500);

            updateTime();
            
        </script>
    </section>