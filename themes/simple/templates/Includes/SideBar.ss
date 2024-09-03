<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<style>
		.sidebar{
			.offcanvas{
				width: 30%;
			}
		}
		@media(max-width:550px){
			.sidebar{
				font-size: 70%;
				.offcanvas{
					width: 60%;
					.offcanvas-header{
						h5{
							font-size: 60%;
						}
					}
				}
			}
		}
	</style>
<aside class="sidebar unit size1of4">
	<%-- <% if $Menu(2) %>
		<nav class="secondary">
			<% with $Level(1) %>
				<h3>
					$MenuTitle
				</h3>
				<ul>
					<% include SidebarMenu %>
				</ul>
			<% end_with %>
		</nav>
	<% end_if %> --%>
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel" >
		<div class="offcanvas-header">
			<i class='bx bxs-user-circle fs-1 d-flex align-items-center'>
				<h5 class="mt-2 ps-2"><% if $Member %>Hi, $Member.FirstName<% else %>User<% end_if %></h5>
			</i>
			<%-- <h5 id="offcanvasSidebarLabel">Sidebar Title</h5> --%>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<a href="{$BaseHref}/purhace" class="text-decoration-none">
				<p class="d-flex align-items-center" style="font-weight: 600; color: #000;"><span class="material-symbols-outlined">shopping_bag</span>Pesanan saya</p>
			</a>
			<p id="logout" class="d-flex align-items-center" style="font-weight: 600;"><span class="material-symbols-outlined">logout</span>Logout</p>
		</div>
	</div>
</aside>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$('#logout').on('click', function(e) {
			e.preventDefault();
			$('#customClick').click(function () {
                iziToast.show({
                    color: 'dark',
					timeout: 8000,
                    icon: 'fa fa-user',
                    title: 'Hey',
                    message: 'Custom Toast!',
                    position: 'bottomRight',
                    progressBarColor: 'rgb(0, 255, 184)',
                    buttons: [
                        [
                            '<button>Ok</button>',
                            function (instance, toast) {
                                $.ajax({
									url: '{$BaseHref}/home/logout',
									type: 'POST',
									dataType: 'json',
									success: function(response) {
										if (response.status === 'success') {
											window.location.href = response.redirect;
										} else {
											iziToast.error({title: 'Error', message: 'Gagal Logout Akun'});
										}
									},
									error: function() {
											iziToast.error({title: 'Error'});
									}
								});
                            }
                        ],
                        [
                            '<button>Close</button>',
                            function (instance, toast) {
                                instance.hide({
                                    transitionOut: 'fadeOutUp'
                                }, toast);
                            }
                        ]
                    ]
                });
            });
		});
	});
	</script>