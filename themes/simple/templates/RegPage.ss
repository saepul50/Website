<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% base_tag %>
    <% require themedCSS('register') %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
        <img class="pt-4 ps-4 position-absolute" src="$resourceURL('themes/simple/images/pngegg.png')"style="top: 0; left:0; aspect-ratio: 1:1; width: 12%;">
            <h2 class="pt-5 pb-3">Register</h2>
        <form id="logg" method="post" style="width: 60%;">
            <div class="input-group pt-3">
                <input class="input" type="text" id="firstname" required>
                <label class="label">First Name</label>
                <div class="underlined"></div>
            </div>
            <div class="input-group pt-3">
                <input class="input" type="text" id="lastname">
                <label class="label">Sur Name</label>
                <div class="underlined"></div>
            </div>
            <div class="input-group pt-3">
                <input class="input" type="email" id="email" required>
                <label class="label">Email</label>
                <div class="underlined"></div>
            </div>
            <div class="input-group pt-md-3 pt-5 password-container">
                <input class="input" type="password" id="password1" required>
                <label class="label">Password</label>
                <div class="underlined"></div>
                <span class="eye-icon" id="togglePassword1"><i class="bi bi-eye-slash"></i></span>
            </div>
            <div class="input-group pt-md-3 pt-5 password-container">
                <input class="input" type="password" id="password2" required>
                <label class="label">Password</label>
                <div class="underlined"></div>
                <span class="eye-icon" id="togglePassword2"><i class="bi bi-eye-slash"></i></span>
            </div>
            <div class="input-group pt-3">
                <div class="check d-flex justify-content-between align-items-center w-100">
                    <%-- <div class="chek d-flex">
                        <input type="checkbox" id="login_remember" name="login_remember">
                        <label class="ps-1" for="login_remember">Remember Me</label>
                    </div> --%>
                    <button class="btn btn-danger px-4" type="submit">Register</button>
                    <a href="{$BaseHref}/login">Already Have Account?</a>
                </div>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
    <script>
    $(document).ready(function () {
        iziToast.settings({
            timeout: 3000,
            resetOnHover: true,
            transitionIn: 'fadeInUp',
            transitionOut: 'fadeOutDown',
            position: 'topCenter',
            <%-- onOpen: function () {
                console.log('callback abriu!');
            },
            onClose: function () {
                console.log("callback fechou!");
            } --%>
        });
        $("#logg").submit(function (event) {
            event.preventDefault()
            $(".spinnerout").show();
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            if (password1 !== password2) {
                iziToast.warning({position: "bottomRight", title: 'Caution', message: 'Password Harus Sama!'});
                return false;
            }
            $.post("{$BaseHref}/register/processregister",
            {
                FirstName: $("#firstname").val(),
                LastName:  $("#lastname").val(),
                Email:  $("#email").val(),
                Password:  $("#password1").val()
            })
            .done(function (data) {
                var response = JSON.parse(data);
                if (response.success) {
                    iziToast.success({
                        icon: 'fa fa-user',
                        title: 'Sukses Registrasi Akun',
                        position: 'bottomRight',
                        onClosed: function () {
                            $(".spinnerout").hide();
                            window.location.href = "{$BaseHref}/login";
                        }
                    });
                } else {
                    $(".spinnerout").hide();
                    iziToast.error({title: 'Gagal Registrasi Akun', message: 'Cek Kembali Username & Password', position: 'bottomRight'});
                }
            }).fail(function () {
                $(".spinnerout").hide();
                iziToast.error({title: 'Error', position: 'bottomRight'});
            });
        });
        $("#togglePassword1").click(function () {
            var passwordField = $("#password1");
            var type = passwordField.attr("type") === "password" ? "text" : "password";
            passwordField.attr("type", type);
            var icon = $(this).find("i");
            icon.toggleClass("bi-eye-slash").toggleClass("bi-eye");
        });
        $("#togglePassword2").click(function () {
            var passwordField = $("#password2");
            var type = passwordField.attr("type") === "password" ? "text" : "password";
            passwordField.attr("type", type);
            var icon = $(this).find("i");
            icon.toggleClass("bi-eye-slash").toggleClass("bi-eye");
        }); 
    });
    </script>
</body>
</html>