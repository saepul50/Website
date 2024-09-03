<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <% require themedCSS('login') %>
</head>
<body>
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
    
    <div class="container-fluid d-flex flex-column justify-content-center align-items-center pt-5 pb-5 mw-100">
        <img class="pt-4 ps-4 position-absolute" src="$resourceURL('themes/simple/images/pngegg.png')" style="top: 0; left:0;">
        <h2 class="pt-5 pb-3">Login</h2>
        <form id="logg" method="post" style="width: 60%;">
            <div class="input-group">
                <input class="input" type="email" id="email" required>
                <label class="label" for="email">Email</label>
                <div class="underlined"></div>
            </div>
            <div class="input-group pt-md-3 pt-5 password-container">
                <input class="input" type="password" id="password" required>
                <label class="label" for="password">Password</label>
                <div class="underlined"></div>
                <span class="eye-icon" id="togglePassword"><i class="bi bi-eye-slash"></i></span>
            </div>
            <div class="input-group pt-md-3 pt-5">
                <div class="check d-flex justify-content-between w-100">
                    <div class="chek d-flex">
                        <input type="checkbox" id="login_remember" name="login_remember">
                        <label class="ps-1" for="login_remember">Remember Me</label>
                    </div>
                    <a href="{$BaseHref}/register">Don't Have Account?</a>
                </div>
            </div>
            <div class="button pt-md-3 pt-5 pb-5 d-flex justify-content-start">
                <button class="btn btn-danger px-4" type="submit">Login</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
    <script>
    $(document).ready(function () {
        $("#logg").submit(function (event) {
            event.preventDefault();
            $(".spinnerout").show();

            $.post("{$BaseHref}/login/processlogin",
            {
                Email: $("#email").val(),
                Password:  $("#password").val()
            })
            .done(function (data) {
                var response = JSON.parse(data);
                if (response.success) {
                    iziToast.success({
                        icon: 'fa fa-user',
                        title: 'Sukses Login',
                        position: 'bottomRight',
                        onClosed: function () {
                            $(".spinnerout").hide();
                            window.location.href = "$BaseHref";
                        }
                    });
                } else {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Gagal Login', message: 'Cek Kembali Username & Password', position: 'bottomRight'});
                }
            }).fail(function () {
                $(".spinnerout").hide();
                iziToast.error({title: 'Error', message: 'Terjadi Kesalahan', position: 'bottomRight'});
            });
        });

        $("#togglePassword").click(function () {
            var passwordField = $("#password");
            var type = passwordField.attr("type") === "password" ? "text" : "password";
            passwordField.attr("type", type);
            var icon = $(this).find("i");
            icon.toggleClass("bi-eye-slash").toggleClass("bi-eye");
        });

        iziToast.settings({
            timeout: 3000,
            resetOnHover: true,
            transitionIn: 'fadeInUp',
            transitionOut: 'fadeOutDown',
            position: 'topRight',
            <%-- onOpen: function () {
                console.log('callback abriu!');
            },
            onClose: function () {
                console.log("callback fechou!");
            } --%>
        });
    });
    </script>
</body>
</html>
