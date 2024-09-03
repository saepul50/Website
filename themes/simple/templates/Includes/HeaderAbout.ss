<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<style>
	.nav1{
		background-color: #cd3301 !important;
		.text1{
			padding: 0 5rem;
			.fs-6{
				margin-top: -.10rem;
			}
			.nav-item {
				display: flex;
				align-items: center;
				position: relative;
			}
			.nav-item::after {
				content: "|";
				height: 100%;
				position: absolute;
				top: 60% !important;
				right: 0;
				left: 110%;
				transform: translateY(-50%);
				color: #fff !important;
			}
		}
		.text2{
			.nav-item {
				display: flex;
				align-items: center;
				position: relative;
			}
			.nav-item::after {
				content: "|";
				height: 100%;
				position: absolute;
				top: 60% !important;
				right: 0;
				left: 110%;
				transform: translateY(-50%);
				color: #fff !important;
			}
		}
	}
	.line{
		.p{
			width: 1px;
			height: 50px;
			background-color: #cd3301;
		}
		h5{
			color: #cd3301;
			font-family: "Roboto", sans-Serif;
			font-size: 1.5rem;
		}
	}
</style>
<header class="header" role="banner" id="header">
	<div class="inner inner-light" style="background-color: #fff;">
		<nav class="navbar-expand-lg">
			<div class="">
				<div class="nav1 row d-flex justify-content-between align-items-center py-1 m-0 decoration mw-100" style="font-size: 80%;">
					<div class="text1 col-auto py-2 p-0">
						<div class="d-flex">
							<div class="text1 text-light col-auto pb-2 pt-2">
								Free Shipping Worldwide - On All Order Over 1000
							</div>
						</div>
					</div>
				</div>
				<div class="nav2 container align-items-center d-flex py-2">
					<div class="col-2 d-flex align-items-center">
						<a href="{$BaseHref}/"><img src="$resourceURL('themes/simple/images/pngegg.png')" alt="Logo" class="img-fluid"></a>
					</div>
					<div class="col-3 d-flex align-items-center">
						<div class="line"><p class="p mt-4 ms-3">&nbsp;</p></div>
						<h5 class="chckout ps-3 pt-1">About Us</h5>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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