<%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"> --%>
<% require themedCSS('layout') %>
<nav class="navbar-expand-lg sticky-top" style="font-size: 85%;">
	<div class="container-fluid m-0">
		<div class="nav3 row align-items-end d-flex justify-content-between align-items-center pt-1 pb-2">
			<div class="mid d-flex">
				<div class="collapse navbar-collapse w-100 justify-content-center" id="navbarToggle3">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<% loop $Menu(1) %>
								<% if $MenuTitle != 'All Product Page' %>
									<li class=" d-flex align-items-center $LinkingMode"><a style="color: #000000; border:none;" class="px-2" href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
								<% end_if %>
							<% end_loop %>
							<li class="d-flex align-items-center"><a style="color: #000000; border:none;" class="nav-link" href="/project3#footer">Contact Us</a></li>
						</li>
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
<%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --%>