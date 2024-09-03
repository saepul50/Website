<%-- <nav class="primary">
	<button class="nav-open-button">²</button>
	<ul>
		<% loop $Menu(1) %>
			<li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
		<% end_loop %>
	</ul>
</nav> --%>
<% require themedCSS('layout') %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<nav class="navbar-expand-lg sticky-top" style="font-size: 85%;">
	<div class="container-fluid m-0">
		<div class="nav3 row align-items-end d-flex justify-content-between align-items-center pt-1 pb-2">
			<div class="col-2 start d-flex align-items-center">
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							English & Dollar
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
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
			<div class="col-8 mid d-flex">
				<div class="collapse navbar-collapse w-100 justify-content-center" id="navbarToggle3">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle text-dark" href="/project3#footer" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								Home
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#header">Top</a></li>
								<li><a class="dropdown-item" href="#sec1">Home</a></li>
								<li><a class="dropdown-item" href="#sec2">Section 2</a></li>
								<li><a class="dropdown-item" href="#sec3">Section 3</a></li>
								<li><a class="dropdown-item" href="#sec4">Section 4</a></li>
								<li><a class="dropdown-item" href="#sec5">Section 5</a></li>
								<li><a class="dropdown-item" href="#sec6">Section 6</a></li>
								<li><a class="dropdown-item" href="#sec7">Section 7</a></li>
								<li><a class="dropdown-item" href="#sec8">Section 8</a></li>
								<li><a class="dropdown-item" href="#sec9">Section 9</a></li>
								<li><a class="dropdown-item" href="#sec10">Section 10</a></li>
								<li><a class="dropdown-item" href="#sec11">Section 11</a></li>
								<li><a class="dropdown-item" href="#footer">Footer</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Separated link</a></li>
							</ul>
						</li>
						<% loop $Menu(1) %>
							<% if $MenuTitle != 'Home' && $MenuTitle != 'All Product Page' %>
                            	<li class=" d-flex align-items-center $LinkingMode"><a style="color: #000000;" class="px-2" href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
							<% end_if %>
                        <% end_loop %>
						<li class="d-flex align-items-center"><a style="color: #000000;" class="nav-link" href="/project3#footer">Contact Us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-2 endd d-flex justify-content-end">
				<button class="navbar-toggler navbar-light" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarToggle3" aria-controls="navbarToggle3" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>