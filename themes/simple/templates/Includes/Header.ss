<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<% require themedCSS('layout') %>
<header class="header" role="banner" id="header">
	<div class="inner inner-light" style="background-color: #fff;">
		<%-- <div class="unit size4of4 lastUnit">
			<a href="$BaseHref" class="brand" rel="home">
				<h1>$SiteConfig.Title</h1>
				<% if $SiteConfig.Tagline %>
				<p>$SiteConfig.Tagline</p>
				<% end_if %>
			</a>
			<% if $SearchForm %>
				<button class="search-dropdown-icon">L</button>
				<div class="search-bar">
					$SearchForm
				</div>
			<% end_if %>
			<% include Navigation %>
		</div> --%>
		<nav class="navbar-expand-lg">
		<div class="container-fluid m-0 p-0">
			<div class="nav1 row d-flex justify-content-between align-items-center pt-2 pb-2 px-3 m-0 decoration mw-100 bg-light" style="font-size: 80%;">
				<div class="text1 col-auto pb-2 pt-2">
					Free Shipping Worldwide - On All Order Over 1000
				</div>
				<div class="text2 col-auto no-decoration p-0">
					<div class="d-flex">
						<button class="btn navbar-toggler navbar-light" type="button" data-bs-toggle="collapse"
							data-bs-target="#navbarToggleHomeNav1" aria-controls="navbarToggleHomeNav1" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarToggleHomeNav1">
							<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link text-dark" href="#">Store Locator</a>
									</li>
								<li class="nav-item">
									<a class="nav-link text-dark" href="#">Track Orders</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-dark" href="#">Credit Card</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button"
										data-bs-toggle="dropdown" aria-expanded="false">
										English & Dollar
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="z-index: 2000;">
										<li><a class="dropdown-item" href="#">Store Location</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><a class="dropdown-item" href="#">Something else here</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#">Separated link</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="nav2 align-items-center d-flex m-0 pt-3 pb-3 px-2">
				<div class="col-0 col-xl-1 d-flex align-items-center">
				</div>
				<div class="col-2 col-xl-1 d-flex align-items-center">
					<a href="{$BaseHref}/"><img src="$resourceURL('themes/simple/images/pngegg.png')" alt="Logo" class="img-fluid"></a>
				</div>
				<div class="searc col-8 px-5 text-center">
					<form class="container-fluid" id="search" action="{$BaseHref}/all-product-page" method="GET">
						<div class="input-group input-group-md">
							<input type="text" class="form-control ps-3" style="box-shadow: none; border: 1px solid #cd3301" placeholder="Search" aria-label="Search" aria-describedby="basic-addon1" id="input-addon" name="Keywords">
							<button class="input-group-text m-0 px-sm-4 px-1" id="basic-addon1" style="background-color: #cd3301; border: 1px solid #cd3301">
								<i class='bx bx-search-alt-2' style="color: white;"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="menuu pe-1 col-2 col-xl-1 d-flex align-items-center justify-content-end">
					<a href="" style="color: inherit;"><i class='bx bx-user-plus pt-1'></i></a>
					<a href="" style="color: inherit;"><i class='bx bx-heart pt-1'></i></a>
					<a href="{$BaseHref}/cart?memberID=$CurrentMember.ID" class="cartIcon position-relative" style="color: inherit;"><i class='bx bx-cart mt-1 px-1'><% if CartData %><span class=" d-flex position-absolute top-0 py-1 px-2 start-100 translate-middle badge rounded-pill bg-danger" style="margin-top: .6rem; margin-left: -.5rem"><p class="m-0" style="font-size: 60%;">$CartData</p></span><% end_if %></i></a>
					<i class='bx bxs-user-circle mb-1 fs-2' data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar" style="font-size: 24px; cursor: pointer;"></i>
					<i class='bx bx-dollar mb-1 d-none d-md-flex'>876</i>
				</div>
				<div class="menuu col-0 col-xl-1 d-flex align-items-center">
				</div>
			</div>

		</div>
	</nav>
	</div>
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
		$("#basic-addon1").on('click', function (event) {
			event.preventDefault();
			var keyword = $("#input-addon").val();
			var category = $("#category-select").val();
			var url = "{$BaseHref}/all-product-page?Keywords=" + encodeURIComponent(keyword);
			if (category) {
				url += "&Category=" + encodeURIComponent(category);
				window.location.href = url;
			}else{
				window.location.href = url;
			}
		});
	});
</script>