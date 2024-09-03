<%-- <!DOCTYPE html>
<!--
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Simple. by Sara (saratusar.com, @saratusar) for Innovatif - an awesome Slovenia-based digital agency (innovatif.com/en)
Change it, enhance it and most importantly enjoy it!
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->

<!--[if !IE]><!-->
<html lang="$ContentLocale">
<!--<![endif]-->
<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
<head>
	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	$MetaTags(false)
	[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]
	<% require themedCSS('reset') %>
	<% require themedCSS('typography') %>
	<% require themedCSS('form') %>
	<% require themedCSS('layout') %>
	<link rel="shortcut icon" href="$resourceURL('themes/simple/images/favicon.ico')" />
</head>
<body class="$ClassName.ShortName<% if not $Menu(2) %> no-sidebar<% end_if %>" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
<% include Header %>
<div class="main" role="main">
	<div class="inner typography line">
		$Layout
	</div>
</div>
<% include Footer %>

<% require javascript('//code.jquery.com/jquery-3.7.1.min.js') %>
<% require themedJavascript('script') %>

</body>
</html> --%>
<!DOCTYPE html>
<html lang="en">
<head>
	<% base_tag %>
    <% include SideBar %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	$MetaTags(false)
	<%-- <% require themedCSS('reset') %>
	<% require themedCSS('typography') %>
	<% require themedCSS('form') %>
	<% require themedCSS('layout') %> --%>
	<link rel="shortcut icon" href="$resourceURL('themes/simple/images/faviconn.png')" style="aspect-ratio: 1:1;"/>
    <title>Metro</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.0.7/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
	<div class="main" role="main">
		<div class="inner typography line">
			$Layout
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
	<script>
		$(document).ready(function () {
            $("#owl-carousel").owlCarousel({
                items: 3,
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                dots: true,
                smartSpeed: 450,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 1
                    }
                },
            });
            var thumbnailCarousel = $("#thumbnailCarousel").owlCarousel({
                items: 4,
                loop: false,
                margin: 10,
                nav: false,
                dots: false,
                onInitialized: function() {
                    $('#thumbnailCarousel .owl-stage').css({
                        'display': 'flex',
                        'align-items': 'center'
                    });
                }
            });
            $('.subvariant').each(function() {
                var variantStock = $(this).data('stock');
                if (variantStock <= 0) {
                    $(this).addClass('out-of-stock');
                } else {
                    $(this).removeClass('out-of-stock');
                }
            });
            function createVideoThumbnail(videoUrl, callback) {
                var video = document.createElement('video');
                var canvas = document.createElement('canvas');
                var context = canvas.getContext('2d');

                video.src = videoUrl;
                video.addEventListener('loadeddata', function() {
                    video.currentTime = Math.min(video.duration / 2, 1);
                });

                video.addEventListener('seeked', function() {
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;
                    context.drawImage(video, 0, 0, canvas.width, canvas.height);
                    var thumbnailUrl = canvas.toDataURL('image/jpeg');
                    callback(thumbnailUrl);
                });
            }
            var hasVideo = false;
            var videoUrl = $('#ProductVideoSource').attr('src');
                if (videoUrl) {
                    hasVideo = true;
                    createVideoThumbnail(videoUrl, function(thumbnailUrl) {
                    $('#thumbnailCarousel .video-thumbnail img').attr('src', thumbnailUrl);
                    $('#mainProductImage').hide();
                    $('#mainProductVideo').show();
                });
            }

            if (hasVideo) {
                $('#mainProductImage').hide();
                $('#mainProductVideo').show();
            } else {
                var firstThumbnail = $("#thumbnailCarousel .item").first().find('img');
                var firstImageUrl = firstThumbnail.attr('src');
                var firstImageAlt = firstThumbnail.attr('alt');

                $("#mainProductImage").attr('src', firstImageUrl);
                $("#mainProductImage").attr('alt', firstImageAlt);
                $('#mainProductVideo').hide();
            }

            $("#thumbnailCarousel").on('mouseenter', '.item', function() {
                var imageUrl = $(this).find('img').attr('src');
                var imageAlt = $(this).find('img').attr('alt');
                var isVideo = $(this).data('is-video');
                var variantId = $(this).data('variant-id');
                var variantPrice = $(this).data('price');
                var variantStock = $(this).data('stock');

                if (isVideo) {
                    $('#mainProductImage').hide();
                    $('#mainProductVideo').show();
                } else if (variantId) {
                    <%-- console.log('Variant ID:', variantId); --%>
                    if (variantStock <= 0) {
                        $(this).find('.out-of-stock-badge').show();
                        return;
                    } else {
                        $(this).find('.out-of-stock-badge').hide();
                    }
                    $("#mainProductImage").attr('src', imageUrl);
                    $("#mainProductImage").attr('alt', imageAlt);
                    $('#mainProductImage').show();
                    $('#mainProductVideo').hide();
                    $('.subvariant').removeClass('active');
                    $('.subvariant[data-variant-id="' + variantId + '"]').addClass('active');
                    $('#price').text(variantPrice);
                    $('#stock').text(variantStock);
                } else {
                    $('.subvariant').removeClass('active');
                    $("#mainProductImage").attr('src', imageUrl);
                    $("#mainProductImage").attr('alt', imageAlt);
                    $('#mainProductImage').show();
                    $('#mainProductVideo').hide();
                    $('#price').text('$Product.rangePrice');
                    $('#stock').text('$Product.totalStock');
                }
                
            });
            $('.subvariant').on('click', function() {
                var variantImageUrl = $(this).find('img').attr('src');
                var variantImageAlt = $(this).find('img').attr('alt');
                var variantPrice = $(this).data('price');
                var variantStock = $(this).data('stock');
                if (variantStock <= 0) {
                    $(this).find('.out-of-stock-badge').show();
                    return;
                } else {
                    $(this).find('.out-of-stock-badge').hide();
                }
                $("#mainProductImage").attr('src', variantImageUrl);
                $("#mainProductImage").attr('alt', variantImageAlt);
                $('#mainProductImage').show();
                $('#mainProductVideo').hide();

                $('.subvariant').removeClass('active');
                $(this).addClass('active');
                $('#price').text(variantPrice);
                $('#stock').text(variantStock);
            });

            var activeSubvariant = $('.subvariant.active');
            if (activeSubvariant.length > 0) {
                var initialImageUrl = activeSubvariant.find('img').attr('src');
                var initialImageAlt = activeSubvariant.find('img').attr('alt');
                var initialPrice = activeSubvariant.data('price');
                var initialStock = activeSubvariant.data('stock');
                var variantName = activeSubvariant.find('#variantName').text();

                $("#mainProductImage").attr('src', initialImageUrl);
                $("#mainProductImage").attr('alt', initialImageAlt);
                $('#mainProductImage').show();
                $('#mainProductVideo').hide();
                $('#price').text(initialPrice);
                $('#stock').text(initialStock);
            } else {
                $('#price').text('$Product.rangePrice');
                $('#stock').text('$Product.totalStock');
            }
            $.ajax({
                url: "https://jsonplaceholder.typicode.com/photos",
                success: function (result) {
                    const rating = (item) => {
                        return `
                        <% loop ProductObjects %>
                            <% if $Rating > 4 %>
                                <a href="/project3/all-product-page/product/view/$ID">
                                    <div class="item">
                                        <div class="card">
                                            <% with $ProductImages.First %>
                                                <img src="$URL" class="img-fluid">
                                            <% end_with %>
                                            <div class="card-body p-0 p-md-3">
                                                <h5 class="card-title">$ID</h5>
                                                <p class="card-text">$Title</p>
                                            </div>
                                            <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between">
                                                <h4>$minPrice</h4>
                                            </div>
                                        </div>
                                    </div>                       
                                </a>
                            <% end_if %>
                        <% end_loop %>
                        `;
                    };
                    const gamingControlConsole = (item) => {
                        return `
                        <% loop ProductObjects %>
                            <% if $ProductCategory.Title == 'Elektronik' %>
                                <% if $ProductSubCategory.Title == 'Gaming Console Control' %>
                                    <a href="/project3/all-product-page/product/view/$ID">
                                        <div class="item">
                                            <div class="card">
                                                <% with $ProductImages.First %>
                                                    <img src="$URL" class="img-fluid">
                                                <% end_with %>
                                                <div class="card-body p-0 p-md-3">
                                                    <h5 class="card-title">$ID</h5>
                                                    <p class="card-text">$Title</p>
                                                </div>
                                                <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between">
                                                    <h4>$minPrice</h4>
                                                </div>
                                            </div>
                                        </div>                       
                                    </a>
                                <% end_if %>
                            <% end_if %>
                        <% end_loop %>
                        `;
                    };
                    const ovens = (item) => {
                        return `
                        <% loop ProductObjects %>
                            <% if $ProductCategory.Title == 'Perlengkapan Rumah' %>
                                <% if $ProductSubCategory.Title == 'Ovens' %>
                                    <a href="/project3/all-product-page/product/view/$ID">
                                        <div class="item">
                                            <div class="card">
                                                <% with $ProductImages.First %>
                                                    <img src="$URL" class="img-fluid">
                                                <% end_with %>
                                                <div class="card-body p-0 p-md-3">
                                                    <h5 class="card-title">$ID</h5>
                                                    <p class="card-text">$Title</p>
                                                </div>
                                                <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between">
                                                    <h4>$minPrice</h4>
                                                </div>
                                            </div>
                                        </div>                       
                                    </a>
                                <% end_if %>
                            <% end_if %>
                        <% end_loop %>
                        `;
                    };
                    const TV = (item) => {
                        return `
                        <% loop ProductObjects %>
                            <% if $ProductCategory.Title == 'Elektronik' || $ProductCategory.Title == 'Komputer Accessories' %>
                                <% if $ProductSubCategory.Title == 'TV' || $ProductSubCategory.Title == 'Laptop' %>
                                    <a href="/project3/all-product-page/product/view/$ID">
                                        <div class="item">
                                            <div class="card">
                                                <% with $ProductImages.First %>
                                                    <img src="$URL" class="img-fluid">
                                                <% end_with %>
                                                <div class="card-body p-0 p-md-3">
                                                    <h5 class="card-title">$ID</h5>
                                                    <p class="card-text">$Title</p>
                                                </div>
                                                <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between">
                                                    <h4>$minPrice</h4>
                                                </div>
                                            </div>
                                        </div>                       
                                    </a>
                                <% end_if %>
                            <% end_if %>
                        <% end_loop %>
                        `;
                    };
                    
                    const createCard2 = (item) => {
                        return `
                            <a href="/project3/all-product-page/product/view/$ID">
                                <div class="item">
                                    <div class="card position-relative">
                                        <img src="${item.url}" class="card-img-top" alt="Product Image">
                                        <h5 class="card-title position-absolute bottom-0 pb-3 start-50 translate-middle-x" style="font-size: 90%;">${item.id}</h5>
                                    </div>
                                </div>
                            </a>
                        `;
                    };
                    const discoverTop = (item) => {
                        return `
                            <% loop ProductObjects %>
                                <a href="/project3/all-product-page/product/view/$ID">
                                    <div class="item">
                                        <div class="card position-relative">
                                            <% with $ProductImages.First %>
                                                <img src="$URL" class="img-fluid">
                                            <% end_with %>
                                            <h5 class="card-title position-absolute bottom-0 pb-3 d-flex align-items-center justify-content-center w-100 pt-3" style="font-size: 90%; color: #fff; background-color: #00000055; filter: drop-shadow(0px 0px 1px #000000);">$minPrice</h5>
                                        </div>
                                    </div>
                                </a>
                            <% end_loop %>
                        `;
                    };

                    const createCard3 = (item) => {
                        return `
                            <div class="item px-2" style="width: 100%">
                                <div class="card px-2 d-grid d-md-flex flex-md-row justify-content-md-evenly" style="border: none;">
                                    <div class="col-12 col-md-5">
                                        <img src="${item.url}" class="img-fluid" alt="Product Image">
                                    </div>
                                    <div class="info px-2 d-flex flex-column justify-content-center align-items-md-center w-100">
                                        <div class="card-body p-0 p-md-3 d-flex flex-column justify-content-center">
                                            <h5 class="card-title d-flex justify-content-center justify-content-md-start pt-2 p-md-0">${item.id}</h5>
                                            <p class="card-text">${item.title}</p>
                                        </div>
                                        <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between" style="background-color: #ffffff;">
                                            <h6><i class='bx bxs-star'></i><i class='bx bxs-star'></i><i class='bx bxs-star'></i><i class='bx bxs-star'></i><i class='bx bxs-star' style="color: #d1d1d1;"></i></h6>
                                            <h4>$2,299.00</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `;
                    };  
                    const sixpic = (item) => {
                        return `
                        <% loop ProductObjects.Limit(3) %>
                            <a href="/project3/all-product-page/product/view/$ID">
                                <div class="item px-2">
                                    <div class="card px-0 px-md-2 d-grid d-md-flex flex-md-row justify-content-md-evenly" style="border: none;">
                                        <div class="col-12 col-md-5">
                                            <% with $ProductImages.First %>
                                                <img src="$URL" class="img-fluid">
                                            <% end_with %>
                                        </div>
                                        <div class="info px-0 px-md-2 d-flex flex-column justify-content-center align-items-md-center w-100">
                                            <div class="card-body p-0 p-md-3 d-flex flex-column justify-content-center">
                                                <h5 class="card-title d-flex justify-content-center justify-content-md-start pt-2 p-md-0">$ID</h5>
                                                <p class="card-text" style="color:#000; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;">$Title</p>
                                            </div>
                                            <div class="card-footer p-0 p-md-3 pt-3 d-grid d-md-flex justify-content-md-between" style="background-color: #ffffff;">
                                                <h4>$minPrice</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        <% end_loop %>
                        `;
                    };  
                    
                    

                    const card1 = $("#card1");
                    const card2 = $("#card2");
                    const card3 = $("#card3");
                    const card4 = $("#card4");
                    const card5 = $("#card5");
                    const card6 = $("#card6");
                    const card7 = $("#card7");
                    const card8 = $("#card8");
                    const card9 = $("#card9");
                    const card10 = $("#card10");
                    const card11 = $("#card11");
                    const card12 = $("#card12");
                    const card13 = $("#card13");

                    for (let index = 0; index < 1; index++) {
                        const item = result[index];
                        card1.append(rating(item));
                        card2.append(rating(item));
                        card3.append(rating(item));
                        card5.append(gamingControlConsole(item));
                        card6.append(ovens(item));
                        card7.append(rating(item));
                        card8.append(TV(item));
                        card9.append(rating(item));
                        card12.append(rating(item));
                        card13.append(rating(item));
                    }
                    for (let index = 0; index < 1   ; index++) {
                        const item = result[index];
                        card4.append(discoverTop(item));
                        
                    }
                    for (let index = 0; index < 1; index++) {
                        const item = result[index];
                        card10.append(sixpic(item));
                        card11.append(sixpic(item));

                    }

                    $("#card1").owlCarousel({
                        items: 5,
                        loop: false,
                        margin: 20,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 5
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card2").owlCarousel({
                        items: 5,
                        loop: false,
                        margin: 20,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card3").owlCarousel({
                        items: 5,
                        loop: false,
                        margin: 20,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card4").owlCarousel({
                        items: 4,
                        loop: true,
                        margin: 10,
                        autoplay: true,
                        autoplayTimeout: 2000,
                        autoplayHoverPause: false,
                        dotsContainer: '#customDots',
                        responsive: {
                            0: {
                                items: 2
                            },
                            600: {
                                items: 3
                            },
                            1000: {
                                items: 4
                            }
                        }
                    });
                    $("#card5").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 30,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card6").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 30,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card7").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 30,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card8").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 30,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card9").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 30,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 6
                            }
                        }
                    });
                    $("#card10").owlCarousel({
                        items: 3,
                        loop: false,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        <%-- responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 4
                            }
                        }, --%>
                        <%-- onInitialized: function() {
                            $('#card10 .owl-stage').css({
                                'display': 'flex',
                                'justify-content': 'space-around'
                            });
                            $('#card10 .owl-item.active').css({
                                'margin-right': '0'
                            });
                        },
                        onTranslated: function() {
                            $('#card10 .owl-item.active').css({
                                'margin-right': '0'
                            });
                        } --%>
                    });
                    $("#card11").owlCarousel({
                        items: 3,
                        loop: false,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        <%-- responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 4
                            }
                        }, --%>
                    });
                    $("#card12").owlCarousel({
                        items: 4,
                        loop: false,
                        margin: 20,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 4
                            }
                        }
                    });
                    $("#card13").owlCarousel({
                        items: 5,
                        loop: false,
                        margin: 20,
                        autoplay: false,
                        autoplayTimeout: 3000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 3
                            },
                            600: {
                                items: 4
                            },
                            1000: {
                                items: 4
                            }
                        }
                    });
                }
            });
        });	
	</script>
</body>
</html>