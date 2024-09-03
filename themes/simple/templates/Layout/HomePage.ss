<% include Header %>
<% include Navigation %>
<% include SideBar %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
<section class="sec1 p-0" id="sec1">
    <div id="owl-carousel" class="owl-carousel d-flex justify-content-center">
        <% loop $PromotionObjects %>
            <% if $ShowPromotion1 %>
                <div class="item promo1">
                    <div class="d-none d-sm-flex align-items-center">
                        <div class="text-left mr-4">
                            <div class="carousel-caption d-flex flex-column align-items-start justify-content-center">
                                <h5 class="pb-3">$PromoText1</h5>
                                <h4>$PromoText2</h4>
								<p style="display: none;">$PromoPrice</p>
                                <p class="mt-2">Wide Range Start From <span class="ps-2">$FormattedPrice</span></p>
                                <a href="{$BaseHref}/all-product-page/product/view/$ProductID">
                                    <button type="button" class="btn btn-danger" style="text-transform: none;">Start Buying</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <img src="$ProductImages.Link" class="" alt="" style="object-fit: cover;">
                </div>
            <% end_if %>
        <% end_loop %>
    </div>
</section>
<section class="sec2 p-0 d-flex flex-wrap w-100 pt-5 pb-3" id="sec2">
	<div class="text d-flex pb-3 pt-3 px-2">
		<div class="textm col-6 p-2">
			<h2>What Shopmax Offer?</h2>
			<p class="pt-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, earum. Consequatur
				quisquam assumenda totam fugiat laboriosam maxime minima velit tempore.</p>
		</div>
		<div class="textn col-6 d-flex flex-wrap">
			<div class="textc col-6">
				<h3>Easy & Free Return</h3>
				<p>All Over Worldwide</p>
			</div>
			<div class="textc col-6 ps-3">
				<h3>Money Gurantee</h3>
				<p>Seal Of Truts</p>
			</div>
			<div class="textc col-6">
				<h3>Online Need Helps</h3>
				<p>24/7 Online Support</p>
			</div>
			<div class="textc col-6 ps-3">
				<h3>Gift Card & Voucher</h3>
				<p>Item per Month</p>
			</div>
		</div>
	</div>
</section>
<section class="sec3 pt-5 px-0 m-0" id="sec3">
	<nav class="pt-5 pb-2 px-3">
		<div class="nav13 d-flex justify-content-between align-items-center">
			<ul class="nav nav-pills mb-0 ps-0 mx-0" id="pills-tab" role="tablist">
				<li class="nav-item me-0 ms-0" role="presentation" style="list-style:none;">
					<button class="nav-link active" id="pills-trending-tab" data-bs-toggle="pill"
						data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending"
						aria-selected="true">Trending Items</button>
				</li>
				<li class="nav-item mx-1 mx-lg-2" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-discounted-tab" data-bs-toggle="pill"
						data-bs-target="#pills-discounted" type="button" role="tab" aria-controls="pills-discounted"
						aria-selected="false">Discounted Items</button>
				</li>
				<li class="nav-item mx-0 mx-lg-2" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-popular-tab" data-bs-toggle="pill"
						data-bs-target="#pills-popular" type="button" role="tab" aria-controls="pills-popular"
						aria-selected="false">Popular Product</button>
				</li>
			</ul>
			<ul class="nav navall me-3 d-flex align-items-center" id="pills-tab" role="tablist">
				<li class="text-end" style="list-style:none;">
					<a href="" style="text-decoration: none; color: var(--primary-color);">Discover All Product
						&nbsp;&nbsp; &#x2192;</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="tab-content px-3 pb-5" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-trending" role="tabpanel"
			aria-labelledby="pills-trending-tab">
			<div class="owl-carousel owl-theme" id="card1">
				<%-- <% loop ProductObjects %>
					$ProductImage.First
				<% end_loop %> --%>
			</div>
		</div>
		<div class="tab-pane fade" id="pills-discounted" role="tabpanel" aria-labelledby="pills-discounted-tab">
			<div class="owl-carousel owl-theme" id="card2">

			</div>
		</div>
		<div class="tab-pane fade" id="pills-popular" role="tabpanel" aria-labelledby="pills-popular-tab">
			<div class="owl-carousel owl-theme" id="card3">

			</div>
		</div>
	</div>
	<div class="footer-card container-fluid p-0 d-flex justify-content-center w-100">
		<div class="foot d-flex align-items-center p-0 pt-2 pb-3">
			<p class="m-0 mt-1 text-center px-3">Don't Miss Our Furniture, Lighting & Decorative Piece Discount 70% Special - Offer -
				<span>'NEW01'</span>
			</p>
		</div>
	</div>
</section>
<section class="sec4 pt-5 pb-5 px-0 d-flex justify-content-between" id="sec4">
	<div class="item-start col-2 ps-3 d-grid flex-row align-items-center text-left mw-100">
		<div class="startit d-flex-sm flex-row flex-wrap">
			<p class="m-0 py-1">TOP FEATURED</p>
			<h2 class="m-0">Discover Top</h2>
			<h3 class="m-0">Categories</h3>
			<h5 class="py-3 m-0">
				<div id="customDots" class="owl-dots"></div>
			</h5>
			<h4 class="m-0">View All Category</h4>
		</div>
	</div>
	<div class="item-end col-9">
		<div class="owl-carousel owl-theme px-3" id="card4">

		</div>
	</div>
</section>
<section class="sec5" id="sec5">
	<div class="contain w-100 d-flex justify-content-between">
		<div class="textl col-3 d-flex flex-column align-items-start justify-content-center ps-2 py-3">
			<h3 class="m-0">Limited</h3>
			<h2 class="m-0">Weekly Deals</h2>
			<p class="m-0 pt-5">Hurry Up Before Offer Will End</p>
		</div>
		<div class="imagec promo3 col-5 pb-5">
			<% loop $PromotionObjects %>
				<% if $ShowPromotion3 %>
					<img src="$ProductImages.Link" alt="" class="img-fluid" style="mix-blend-mode: multiply;">
				<% end_if %>
			<% end_loop %>
		</div>
		<div class="textr col-3 d-flex flex-column align-items-start justify-content-center py-3" style="font-size: 10px;">
			<h4><i class='bx bxs-star' style="color: #FFD61E;"></i><i class='bx bxs-star'
					style="color: #FFD61E;"></i><i class='bx bxs-star' style="color: #FFD61E;"></i><i
					class='bx bxs-star' style="color: #FFD61E;"></i><i class='bx bxs-star'
					style="color: #d1d1d1;"></i></h4>
			<h6>3D Wooden Ceiling Floor Lighting For Living Room</h6>
			<div class="txtgr d-flex align-items-center col-12">
				<p class="col-6 pt-3 pb-3 m-0 d-flex align-items-center w-auto">$2,299.00</p>
				<span class="col-6 ms-2">$2,299.00</span>
			</div>
			<div class="time pb-3 col-12 d-flex flex-wrap mw-100">
				<div class="timee col-xl-2 col-lg-3 col-4 me-2 mb-2">
					<div class="isi py-0 py-lg-3">
						<div class="timer pt-2 d-flex justify-content-center">
							00
						</div>
						<div class="note pb-2 p-0 d-flex justify-content-center">
							Second
						</div>
					</div>
				</div>
				<div class="timee col-xl-2 col-lg-3 col-4 me-2 mb-2">
					<div class="isi py-0 py-lg-3">
						<div class="timer pt-2 d-flex justify-content-center">
							00
						</div>
						<div class="note pb-2 p-0 d-flex justify-content-center">
							Second
						</div>
					</div>
				</div>
				<div class="timee col-xl-2 col-lg-3 col-4 me-2 mb-2">
					<div class="isi py-0 py-lg-3">
						<div class="timer pt-2 d-flex justify-content-center">
							00
						</div>
						<div class="note pb-2 p-0 d-flex justify-content-center">
							Second
						</div>
					</div>
				</div>
				<div class="timee col-xl-2 col-lg-3 col-4 me-2 mb-2">
					<div class="isi py-0 py-lg-3">
						<div class="timer pt-2 d-flex justify-content-center">
							00
						</div>
						<div class="note pb-2 p-0 d-flex justify-content-center">
							Second
						</div>
					</div>
				</div>
			</div>
			<h5>+Add To Cart</h5>
		</div>
	</div>
</section>
<section class="sec6 pt-1" id="sec6">
	<nav class="nav11">
		<div class="">
			<ul class="nav nav-pills mb-0 ps-0 mx-0 d-flex justify-content-around" id="pills-tab" role="tablist">
				<li class="nav-item text-center" role="presentation" style="list-style:none;">
					<button class="nav-link active" id="pills-gaming-tab" data-bs-toggle="pill"
						data-bs-target="#pills-gaming" type="button" role="tab" aria-controls="pills-gaming"
						aria-selected="true">
						Gaming Console & Control
					</button>
				</li>
				<li class="nav-item text-center" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-ovens-tab" data-bs-toggle="pill"
						data-bs-target="#pills-ovens" type="button" role="tab" aria-controls="pills-ovens"
						aria-selected="false">
						Microwave Ovens
					</button>
				</li>
				<li class="nav-item text-center" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-smart-tab" data-bs-toggle="pill"
						data-bs-target="#pills-smart" type="button" role="tab" aria-controls="pills-smart"
						aria-selected="false">
						Smart Watches Deal Series 2
					</button>
				</li>
				<li class="nav-item text-center" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-com-tab" data-bs-toggle="pill" data-bs-target="#pills-com"
						type="button" role="tab" aria-controls="pills-com" aria-selected="false">
						Computer & TVs
					</button>
				</li>
				<li class="nav-item text-center" role="presentation" style="list-style:none;">
					<button class="nav-link" id="pills-smartt-tab" data-bs-toggle="pill"
						data-bs-target="#pills-smartt" type="button" role="tab" aria-controls="pills-smartt"
						aria-selected="false">
						Smart Watches Deal Series 2
					</button>
				</li>
			</ul>
		</div>
	</nav>
	<div class="tab-content px-3 pb-0" id="pills-tabContent">
		<nav class="nav12 pt-5 pb-2">
			<div class="nav13 d-flex justify-content-between">
				<ul class="nav nav-pills mb-0 ps-3 m-0" id="pills-tab" role="tablist">
					<li class="nav-item me-2 ms-0" role="presentation" style="list-style:none;">
						<button class="nav-link active px-lg-5" id="pills-home-tab" data-bs-toggle="pill"
							data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
							aria-selected="true">Featured Items</button>
					</li>
				</ul>
				<ul class="nav navall me-3" id="pills-tab" role="tablist">
					<li style="list-style:none;">
						<a href="" style="text-decoration: none; color: var(--primary-color);">Discover All Product
							&nbsp;&nbsp; &#x2192;</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="tab-pane fade show active" id="pills-gaming" role="tabpanel" aria-labelledby="pills-gaming-tab">
			<div class="owl-carousel owl-theme" id="card5">

			</div>
		</div>
		<div class="tab-pane fade" id="pills-ovens" role="tabpanel" aria-labelledby="pills-ovens-tab">
			<div class="owl-carousel owl-theme" id="card6">

			</div>
		</div>
		<div class="tab-pane fade" id="pills-smart" role="tabpanel" aria-labelledby="pills-smart-tab">
			<div class="owl-carousel owl-theme" id="card7">

			</div>
		</div>
		<div class="tab-pane fade" id="pills-com" role="tabpanel" aria-labelledby="pills-com-tab">
			<div class="owl-carousel owl-theme" id="card8">

			</div>
		</div>
		<div class="tab-pane fade" id="pills-smartt" role="tabpanel" aria-labelledby="pills-smartt-tab">
			<div class="owl-carousel owl-theme" id="card9">

			</div>
		</div>
	</div>
	<div class="imagecon d-sm-flex d-sm-grid px-3 pt-3 pb-5 w-10 justify-content-around">
		<% loop $PromotionObjects %>
			<div class="cimg pe-sm-3 pb-2">
				<% if $ShowPromotion4 %>
					<div class="itemic position-relative col-12 d-flex justify-content-center">
						<div class="caption position-absolute d-flex flex-column justify-content-center">
							<h3>$PromoText1</h3>
							<h4>$PromoText2</h4>
							<a href="/project3/all-product-page/product/view/$Product.ID">View Collection &nbsp;&nbsp;&nbsp;&nbsp; &#x27F6;</a>
						</div>
						<img src="$ProductImages.Link" alt="" class="mw-100 col-sm-12 col-9">
					</div>
				<% end_if %>
			</div>
		<% end_loop %>
	</div>
</section>
<section class="sec7" id="sec7">
	<nav class="nav13 pt-5 pb-2">
		<div class="nav13 d-flex justify-content-between">
			<ul class="nav nav-pills mb-0 ps-3 m-0" id="pills-tab" role="tablist">
				<li class="nav-item me-2 ms-0" role="presentation" style="list-style:none;">
					<button class="nav-link active px-lg-5" id="pills-home-tab" data-bs-toggle="pill"
						data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
						aria-selected="true">Featured Items</button>
				</li>
			</ul>
			<ul class="nav navall me-3" id="pills-tab" role="tablist">
				<li style="list-style:none;">
					<a href="" style="text-decoration: none; color: var(--primary-color);">Discover All Product
						&nbsp;&nbsp; &#x2192;</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="contain container-fluid d-flex flex-column">
		<div class="contain1 pt-3">
			<div class="pro">
				<div class="owl-carousel owl-theme" id="card10">

				</div>
			</div>
		</div>
		<div class="contain2 pt-3">
			<div class="pro">
				<div class="owl-carousel owl-theme" id="card11">

				</div>
			</div>
		</div>
	</div>
</section>
<section class="sec8" id="sec8">
	<div class="container-fluid p-0 position-relative px-3">
		<% loop $PromotionObjects %>
			<% if $ShowPromotion5 %>
				<img src="$ProductImages.Link" alt="" class="img-fluid" style="mix-blend-mode: multiply;">
			<% end_if %>
		<% end_loop %>
		<div
			class="text-overlay ps-5 d-flex flex-column justify-content-center text-left position-absolute w-100 h-100">
			<div class="px-3">
				<h3>End Season Sale</h3>
				<h2>Wooden Furniture</h2>
			</div>
		</div>
	</div>
</section>
<section class="sec9" id="sec9">
	<div class="contain mw-100">
		<nav class="nav13 pt-5 pb-2">
			<div class="nav13 d-flex justify-content-between">
				<ul class="nav nav-pills mb-0 ps-3 m-0" id="pills-tab" role="tablist">
					<li class="nav-item me-2 ms-0" role="presentation" style="list-style:none;">
						<button class="nav-link active px-md-5" id="pills-home-tab" data-bs-toggle="pill"
							data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
							aria-selected="true">Featured Items</button>
					</li>
				</ul>
				<ul class="nav navall me-3" id="pills-tab" role="tablist">
					<li style="list-style:none;">
						<a href="" style="text-decoration: none; color: var(--primary-color);">Discover All Product
							&nbsp;&nbsp; &#x2192;</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container pt-2 d-flex flex-wrap justify-content-between mw-100">
                <div class="item-start flex-grow-1 col-12 col-md-3 mb-3 mb-md-0 d-flex align-items-center">
                    <div class="startit d-flex flex-column align-items-center text-left w-100">
                        <div class="cimg pb-2 w-100">
							<% loop $PromotionObjects %>
								<% if $ShowPromotion6 %>
									<div class="itemic position-relative d-flex justify-content-center">
										<div class="caption position-absolute no-decoration d-flex flex-column justify-content-end align-items-center w-100" style="color: #000; z-index: 10; margin-top: -3rem;">
											<h3 class="m-0">$PromoText1</h3>
											<h4 class="pb-2">$PromoText2</h4>
										</div>
										<img src="$ProductImages.Link" alt="" class="img-fluid">
									</div>
								<% end_if %>
							<% end_loop %>
                        </div>
                    </div>
                </div>
                <div class="item-end flex-grow-1 col-12 col-md-9 px-0">
                    <div class="owl-carousel owl-theme px-3" id="card12">
                        
                    </div>
                </div>
            </div>
		<nav class="nav13 pt-5 pb-2">
			<div class="nav13 d-flex justify-content-between">
				<ul class="nav nav-pills mb-0 ps-3 m-0" id="pills-tab" role="tablist">
					<li class="nav-item me-2 ms-0" role="presentation" style="list-style:none;">
						<button class="nav-link active px-md-5" id="pills-home-tab" data-bs-toggle="pill"
							data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
							aria-selected="true">Featured Items</button>
					</li>
				</ul>
				<ul class="nav navall me-3" id="pills-tab" role="tablist">
					<li style="list-style:none;">
						<a href="" style="text-decoration: none; color: var(--primary-color);">Discover All Product
							&nbsp;&nbsp; &#x2192;</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container pt-2 pb-4 d-flex flex-wrap justify-content-between mw-100">
			<div class="item-start flex-grow-1 col-12 col-md-3 mb-3 mb-md-0 d-flex align-items-center">
				<div class="startit d-flex flex-column align-items-center text-left w-100">
					<div class="cimg pb-2 w-100">
						<% loop $PromotionObjects %>
							<% if $ShowPromotion6 %>
								<div class="itemic position-relative d-flex justify-content-center">
									<div class="caption position-absolute no-decoration d-flex flex-column justify-content-end align-items-center w-100" style="color: #000; z-index: 10; margin-top: -3rem;">
										<h3 class="m-0">$PromoText1</h3>
										<h4 class="pb-2">$PromoText2</h4>
									</div>
									<img src="$ProductImages.Link" alt="" class="img-fluid">
								</div>
							<% end_if %>
						<% end_loop %>
					</div>
				</div>
			</div>
			<div class="item-end flex-grow-1 col-12 col-md-9 px-0">
				<div class="owl-carousel owl-theme px-3" id="card13">
					
				</div>
			</div>
		</div>
	</div>
</section>
<section class="sec10" id="sec10">
	<div class="contain d-flex py-3">
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/klober.png')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/roshults.avif')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/magisso.png')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/packit.png')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/joseph.png')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/roshults.avif')"class="img-fluid" /></a>
		<a href="" target="_blank"><img src="$resourceURL('themes/simple/images/klober.png')"class="img-fluid" /></a>
	</div>
	<div class="footer ps-3 d-flex align-items-center col-12">
		<div class="textl py-2 col-2 d-flex justify-content-center">
			<i class='bx bxs-megaphone me-2 m-md-0'></i>
			<p class="m-0"> Subscribe for Join Us!</p>
		</div>
		<div class="textm py-2 col-5 d-flex justify-content-center ps-2">
			<p class="m-0">... & receive $20 coupon for first Shopping & free delivery.</p>
		</div>
		<div class="textr pe-3 col-5 d-flex justify-content-center">
			<div class="input-group py-2">
				<input type="text" class="form-control h-100" placeholder="Enter Your Email Address ..."
					style="color: white;" id="emailInput">
				<div class="input-group-append">
					<span class="input-group-text" style="background-color: transparent; border: none;">
						<i class='bx bx-paper-plane' style="color: var(--bg-color); font-size: 150%;"></i>
					</span>
				</div>
			</div>
		</div>
	</div>
</section>
<% include Contact %>
<% include Footer %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			var userName = "<% if $Member %>$Member.FirstName<% else %>User<% end_if %>";
            function getGreeting() {
                var today = new Date();
                var hour = today.getHours();
                var greeting;
                if (hour >= 2 && hour < 10) {
                    greeting = "Selamat Pagi";
                } else if (hour >= 10 && hour < 15) {
                    greeting = "Selamat Siang";
                } else if (hour >= 15 && hour < 18) {
                    greeting = "Selamat Sore";
                } else {
                    greeting = "Selamat Malam";
                }

                return greeting;
            }
            var titleMessage = getGreeting() + ", " + userName;
            iziToast.show({
                timeout: 5000,
                color: 'dark',
                icon: 'fa fa-user',
                title: titleMessage,
                position: 'topRight',
                transitionIn: 'fadeInDown',
                transitionOut: 'fadeOutUp',
                progressBarColor: 'rgb(0, 255, 184)',
            });
		})
	</script>