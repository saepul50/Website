<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Metro</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <% require themedCSS('aboutus') %>
    <% include HeaderAbout %>
    <% include NavigationCart %>
</head>
<body>
    <header class="text-white text-center py-2">
        <h4 class="">About Us</h4>
    </header>
    <img src="$resourceURL('themes/simple/images/pngegg.png')" alt="" class="sticky-img">
    <section class="first m-0 p-0" style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('$resourceURL('themes/simple/images/cf04d198-9220-40f0-9772-c33bb90b23cb_rw_3840.jpg')');">
        <div class="container">
            <h2 class="text-center">Welcome to Metro</h2>
            <p class="lead text-center">Metro is your one-stop online shop for electronics, furniture, and more. Established in 2015, we have been committed to providing quality products and excellent customer service.</p>
        </div>
    </section>
    <section id="vision-mission" class="py-5 bg-light">
        <div class="container text-center">
            <h2>Our Vision and Mission</h2>
            <p><strong>Vision:</strong> To be the leading online shopping destination for all your needs.</p>
            <p><strong>Mission:</strong> To provide a wide range of high-quality products with exceptional customer service and to continuously innovate to meet the needs of our customers.</p>
        </div>
    </section>
    <section id="values" class="py-5">
        <div class="container">
            <h2 class="text-center">Our Values</h2>
            <ul class="list-unstyled text-center">
                <li>Integrity</li>
                <li>Quality</li>
                <li>Customer Service</li>
                <li>Innovation</li>
            </ul>
        </div>
    </section>
    <section id="history" class="py-5 bg-light">
        <div class="container text-center">
            <h2>Our History</h2>
            <p>Since our inception in 2015, Metro has grown from a small startup to a major player in the online shopping industry.</p>
        </div>
    </section>
    <section id="team" class="py-5">
        <div class="container">
            <h2 class="text-center">Our Team</h2>
                <div class="team d-flex justify-content-center">
                    <img src="$resourceURL('themes/simple/images/Show-employees-that-you-care.jpg')" class="img-fluid" alt="CEO">
                </div>
        </div>
    </section>
    <section id="products" class="py-5 bg-light">
        <div class="container text-center">
            <h2>Our Products and Services</h2>
            <p>We offer a wide range of products including electronics, furniture, and more.</p>
        </div>
    </section>
    <section id="testimonials" class="py-5">
        <div class="container">
            <h2 class="text-center">Customer Testimonials</h2>
            <blockquote class="blockquote text-center">
                <p class="mb-0">"Metro offers the best products and amazing customer service!"</p>
                <footer class="blockquote-footer mt-5">Happy Customer</footer>
            </blockquote>
        </div>
    </section>
    <section id="contact" class="py-5 bg-light d-flex">
        <div class="col-6">
            <h2 class="text-center">Contact Us</h2>
            <div class="text-center pb-2">
                <a href="">Facebook</a>
                <a href="">Twitter</a>
                <a href="">Instagram</a>
            </div>
            <p class="text-center">Address: 123 Main Street, Surabaya, Indonesia</p>
            <p class="text-center">Phone: (123) 456-7890</p>
            <p class="text-center">Email: support@metro.com</p>
        </div>
        <div class="col-6 d-flex justify-content-center">
            <div class="textr d-flex">
                <div class="">
                    <h3>Metro</h3>
                    <ul class="">
                        <a href="/project3/home"><li style="list-style: none;">Home</li></a>
                        <a href="/project3/home#footer"><li style="list-style: none;">Contact Us</li></a>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
