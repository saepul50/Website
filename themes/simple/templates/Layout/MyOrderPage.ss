<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Address Input with Slide Transition</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">      
</head>
<% require themedCSS('order') %>
<% include HeaderOrder %>
<% include SideBar %>
<% if $HeaderCheckout %>
    <section class="container d-flex my-3">
        <div class="menu col-2 d-none d-md-grid pe-3">
            <div class="mymenu pt-5">
                <p class="m-0 d-flex ps-4">Akun Saya</p>
                <a href="{$BaseHref}/purhace" style="color: inherit; text-decoration: none; cursor: pointer;"><p class="m-0 d-flex ps-4">Pesanan Saya</p></a>
            </div>
        </div>
        <div class= "myorder col-12 col-md-10" id="myOrder">
            <nav class="py-2 d-flex justify-content-around flex-wrap">
                <h5 id="navSemua" class="navi-item">Semua</h5>
                <h5 id="navPending" class="navi-item">Pending</h5>
                <h5 id="navProses" class="navi-item">Proses</h5>
                <h5 id="navSelesai" class="navi-item">Selesai</h5>
                <h5 id="navCanceled" class="navi-item">Canceled</h5>
            </nav>
            <div class="Semua" id="semua">
                <% loop HeaderCheckout %>
                <a href="{$BaseHref}/purhace/order/$OrderID?detailOrder=true" style="text-decoration: none; color: inherit;">
                    <div class="thisitem px-4 py-2 my-3">
                        <div class="d-flex header justify-content-between py-3">
                            <h5>Semua</h5>
                            <h5 style="color: #cd3301;">$Status</h5>
                        </div>
                        <% if $Items %>
                            <% loop $Items %>
                                <div class="d-flex align-items-center details pt-2 pb-1">
                                    <div class="col-1">
                                        <img src="$ProductImage" alt="" class="img-fluid">
                                    </div>
                                    <div class="col-9 ps-3">
                                        <p class="m-0 Title" style="font-size: 110%; line-height: 2rem;">$ProductTitle</p>
                                        <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                        <p class="m-0">x$Quantity</p>
                                    </div>
                                    <div class="col-2 d-flex justify-content-end">
                                        <p style="font-size: 100%;">$Price</p>
                                    </div>
                                </div>
                            <% end_loop %>
                        <% end_if %>
                        <div class="d-grid footer justify-content-end py-3">
                            <h5 class="">Total Pesanan: <span>$FormattedFinalPrice</span></h5>
                            <div class="button d-flex justify-content-end m-0 p-0 gap-3">
                                <button class="py-2 px-4">Hubungi Penjual</button>
                            </div>
                        </div>
                    </div>
                </a>
                <% end_loop %>
            </div>
            <div class="Pending" id="pending">
                <% loop HeaderCheckout %>
                    <% if $Status == 'Pending' %>
                        <a href="{$BaseHref}/purhace/order/$OrderID?detailOrder=true" style="text-decoration: none; color: inherit;">
                            <div class="thisitem px-4 py-2 my-3">
                                <div class="d-flex header justify-content-between py-3">
                                    <h5>Pending</h5>
                                    <h5 style="color: #cd3301;">$Status</h5>
                                </div>
                                <% if $Items %>
                                    <% loop $Items %>
                                        <div class="d-flex align-items-center details pt-2 pb-1">
                                            <div class="col-1">
                                                <img src="$ProductImage" alt="" class="img-fluid">
                                            </div>
                                            <div class="col-9 ps-3">
                                                <p class="m-0 Title" style="font-size: 110%; line-height: 2rem;">$ProductTitle</p>
                                                <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                                <p class="m-0">x$Quantity</p>
                                            </div>
                                            <div class="col-2 d-flex justify-content-end">
                                                <p style="font-size: 100%;">$Price</p>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_if %>
                                <div class="d-grid footer justify-content-end py-3">
                                    <h5 class="">Total Pesanan: <span>$FormattedFinalPrice</span></h5>
                                    <div class="button d-flex justify-content-end m-0 p-0 gap-3">
                                        <button class="py-2 px-4">Hubungi Penjual</button>
                                    </div>
                                </div>
                            </div>
                        </a>
                    <% end_if %>
                <% end_loop %>
            </div>
            <div class="Proses" id="proses">
                <% loop HeaderCheckout %>
                    <% if $Status == 'Processing' %>
                        <a href="{$BaseHref}/purhace/order/$OrderID?detailOrder=true" style="text-decoration: none; color: inherit;">
                            <div class="thisitem px-4 py-2 my-3">
                                <div class="d-flex header justify-content-between py-3">
                                    <h5>Processing</h5>
                                    <h5 style="color: #cd3301;">$Status</h5>
                                </div>
                                <% if $Items %>
                                    <% loop $Items %>
                                        <div class="d-flex align-items-center details pt-2 pb-1">
                                            <div class="col-1">
                                                <img src="$ProductImage" alt="" class="img-fluid">
                                            </div>
                                            <div class="col-9 ps-3">
                                                <p class="m-0 Title" style="font-size: 110%; line-height: 2rem;">$ProductTitle</p>
                                                <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                                <p class="m-0">x$Quantity</p>
                                            </div>
                                            <div class="col-2 d-flex justify-content-end">
                                                <p style="font-size: 100%;">$Price</p>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_if %>
                                <div class="d-grid footer justify-content-end py-3">
                                    <h5 class="">Total Pesanan: <span>$FormattedFinalPrice</span></h5>
                                    <div class="button d-flex justify-content-end m-0 p-0 gap-3">
                                        <button class="py-2 px-4">Hubungi Penjual</button>
                                    </div>
                                </div>
                            </div>
                        </a>
                    <% end_if %>
                <% end_loop %>
            </div>
            <div class="Selesai" id="selesai">
                <% loop HeaderCheckout %>
                    <% if $Status == 'Completed' %>
                        <a href="{$BaseHref}/purhace/order/$OrderID?detailOrder=true" style="text-decoration: none; color: inherit;">
                            <div class="thisitem px-4 py-2 my-3">
                                <div class="d-flex header justify-content-between py-3">
                                    <h5>Completed</h5>
                                    <h5 style="color: #cd3301;">$Status</h5>
                                </div>
                                <% if $Items %>
                                    <% loop $Items %>
                                        <div class="d-flex align-items-center details pt-2 pb-1">
                                            <div class="col-1">
                                                <img src="$ProductImage" alt="" class="img-fluid">
                                            </div>
                                            <div class="col-9 ps-3">
                                                <p class="m-0 Title" style="font-size: 110%; line-height: 2rem;">$ProductTitle</p>
                                                <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                                <p class="m-0">x$Quantity</p>
                                            </div>
                                            <div class="col-2 d-flex justify-content-end">
                                                <p style="font-size: 100%;">$Price</p>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_if %>
                                <div class="d-grid footer justify-content-end py-3">
                                    <h5 class="">Total Pesanan: <span>$FormattedFinalPrice</span></h5>
                                    <div class="button d-flex justify-content-end m-0 p-0 gap-3">
                                        <button class="py-2 px-4">Hubungi Penjual</button>
                                    </div>
                                </div>
                            </div>
                        </a>
                    <% end_if %>
                <% end_loop %>
            </div>
            <div class="Canceled" id="canceled">
                <% loop HeaderCheckout %>
                    <% if $Status == 'Cancelled' %>
                        <a href="{$BaseHref}/purhace/order/$OrderID?detailOrder=true" style="text-decoration: none; color: inherit;">
                            <div class="thisitem px-4 py-2 my-3">
                                <div class="d-flex header justify-content-between py-3">
                                    <h5>Canceled</h5>
                                    <h5 style="color: #cd3301;">$Status</h5>
                                </div>
                                <% if $Items %>
                                    <% loop $Items %>
                                        <div class="d-flex align-items-center details pt-2 pb-1">
                                            <div class="col-1">
                                                <img src="$ProductImage" alt="" class="img-fluid">
                                            </div>
                                            <div class="col-9 ps-3">
                                                <p class="m-0 Title" style="font-size: 110%; line-height: 2rem;">$ProductTitle</p>
                                                <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                                <p class="m-0">x$Quantity</p>
                                            </div>
                                            <div class="col-2 d-flex justify-content-end">
                                                <p style="font-size: 100%;">$Price</p>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_if %>
                                <div class="d-grid footer justify-content-end py-3">
                                    <h5 class="">Total Pesanan: <span>$FormattedFinalPrice</span></h5>
                                    <div class="button d-flex justify-content-end m-0 p-0 gap-3">
                                        <button class="py-2 px-4">Hubungi Penjual</button>
                                    </div>
                                </div>
                            </div>
                        </a>
                    <% end_if %>
                <% end_loop %>
            </div>
        </div>
        <% if CheckoutHeader %>
        <% loop CheckoutHeader %>
            <div class="detailOrder w-100" id="detailOrder">
                <div class="detailContain">
                    <div class="navtop d-flex justify-content-between px-3 py-2">
                        <a href="{$BaseHref}/purhace" style="text-decoration: none; color: inherit;">
                            <div class="textleft d-flex align-items-center" style="cursor: pointer">
                                <span class="fs-4">﹤</span>
                                <p class="m-0">Kembali</p>
                            </div>
                        </a>
                        <div class="textright d-flex align-items-center gap-3">
                            <p class="m-0">No. Pesanan. $OrderID</p>
                            <p class="m-0" style="color: #cd3301; font-weight: 500; text-transform: uppercase;">Pesanan $Status</p>
                        </div>
                    </div>
                    <div class="road" style="margin-top: .1rem;">
                        <div class="d-flex justify-content-around align-items-center">
                            <div class="icon-wrapper">
                                <i class='bx bxs-receipt'></i>
                            </div>
                            <div class="icon-wrapper">
                                <i class='bx bxs-wallet-alt'></i>
                            </div>
                            <div class="icon-wrapper">
                                <i class='bx bxs-truck'></i>
                            </div>
                        </div>
                    </div>
                    <div class="text1" style="margin-top: .1rem;">
                        <div class="d-flex justify-content-between align-items-center py-3 px-3">
                            <p class="m-0">Terimakasih telah berbelanja di Metro!</p>
                        </div>
                    </div>
                    <div class="Orders">
                        <div class="delivery d-flex flex-column py-3 px-3">
                            <div class="col-4">
                                <h5>Alamat Pengiriman</h5>
                                <p class="m-0 py-3">$Name</p>
                                <p class="m-0">$Number</p>
                                <p class="m-0">$AddressDetail</p>
                            </div>
                        </div>
                        <div class="allproduct d-flex flex-column py-3 px-3">
                            <% loop $Items %>
                                <div class="d-flex align-items-center details pt-2 pb-1">
                                    <div class="col-1">
                                        <img src="$ProductImage" alt="" class="img-fluid">
                                    </div>
                                    <div class="col-7 ps-3">
                                        <p class="m-0 Title" style="font-size: 110%;">$ProductTitle</p>
                                        <p class="m-0" style="color: #707070; font-size: 100%;">Varian: $VariantName</p>
                                        <p class="m-0">x$Quantity</p>
                                    </div>
                                    <div class="col-4 d-flex justify-content-end gap-2">
                                        <a href="/project3/all-product-page/product/view/$ProductID"><button class="px-4 py-2"  style="color:#fff; background-color: #cd3301; border:none; border-radius: 3px;">Beli Lagi</button></a>
                                        <p class="m-0 d-flex align-items-center" style="font-size: 100%;">$Price</p>
                                    </div>
                                </div>
                            <% end_loop %>
                            <div class="d-flex payment py-2" style="border-top: 1px solid #cdcdcd;">
                                <div class="col-8 d-flex flex-column align-items-end" >
                                    <p class="m-0">Subtotal Produk</p>
                                </div>
                                <div class="col-4 d-flex flex-column align-items-end">
                                    <p class="m-0">$FormattedFinalPrice</p>
                                </div>
                            </div>
                            <div class="d-flex payment py-2" style="border-top: 1px solid #cdcdcd;">
                                <div class="col-8 d-flex flex-column align-items-end" >
                                    <p class="m-0">Total Pesanan</p>
                                </div>
                                <div class="col-4 d-flex flex-column align-items-end">
                                    <p class="m-0">$FormattedFinalPrice</p>
                                </div>
                            </div>
                            <div class="d-flex paymentinfo py-2" style="border-top: 1px solid #cdcdcd;">
                                <div class="d-flex align-items-center py-2 px-3 w-100" style="background-color: #FFFEFB; border: 1px solid #F3DB97;">
                                    <i class='bx bx-bell'></i>
                                    <p class="m-0 ps-3 d-flex">Mohon lakukan pembayaran sebesar <span class="ps-2 d-flex align-items-center" style="color: #cd3301; font-weight: 500;">$FormattedFinalPrice</span></p>
                                </div>
                            </div>
                            <div class="d-flex payment py-2" style="border-top: 1px solid #cdcdcd;">
                                <div class="col-8 d-flex flex-column align-items-end" >
                                    <p class="m-0">Metode Pembayaran</p>
                                </div>
                                <div class="col-4 d-flex flex-column align-items-end">
                                    <p class="m-0">$PaymentMethod</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_loop %>
        <% end_if %>
        <% if $ShowDetailOrder %>
            <script>
                $(document).ready(function() {
                    $('#myOrder').hide();
                    $('#detailOrder').show();
                });
            </script>
        <% else %>
            <script>
                $(document).ready(function() {
                    $('#myOrder').show();
                    $('#detailOrder').hide();
                });
            </script>
        <% end_if %>
    </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                function showSection(sectionId, navItem) {
                    $('.Semua, .Pending, .Proses, .Selesai, .Canceled').hide();
                    $(sectionId).show();
                    $('.navi-item').removeClass('active');
                    $(navItem).addClass('active');
                }

                $('#navSemua').click(function() {
                    showSection('#semua', '#navSemua');
                    toggleOrderDetail(false);
                });
                $('#navPending').click(function() {
                    showSection('#pending', '#navPending');
                    toggleOrderDetail(false);
                });
                $('#navProses').click(function() {
                    showSection('#proses', '#navProses');
                    toggleOrderDetail(false);
                });
                $('#navSelesai').click(function() {
                    showSection('#selesai', '#navSelesai');
                    toggleOrderDetail(false);
                });
                $('#navCanceled').click(function() {
                    showSection('#canceled', '#navCanceled');
                    toggleOrderDetail(false);
                });

                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.has('detailOrder')) {
                    toggleOrderDetail(true);
                } else {
                    $('#navSemua').click();
                }
            });

            function toggleOrderDetail(showDetail) {
                if (showDetail) {
                    $('#myOrder').hide();
                    $('#detailOrder').show();
                } else {
                    $('#myOrder').show();
                    $('#detailOrder').hide();
                }
            }
        </script>
<% else %>

<% end_if %>
</html>
