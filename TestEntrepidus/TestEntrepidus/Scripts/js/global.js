

function LoginUser() {
    var user = $('#user').val();
    var password = $('#password').val();
    var flag = $('#check:checked').val();
    console.log(flag);
    if (user === '' || password === '' || flag !== 'on') {
        alert('Todos los campos son obligatorios');
        return false;
    }

        $.ajax({
            type: "POST",
            url: "Default/LoginUser",
            data: { user: user, password: password },
            contentType:"application/json; chartset=utf-8",
            datatype: "json",
            success: function (data) {
                if (data.Descripcion === "Autentificacion Exitosa") {
                    alert('exito');
                } else {
                    alert('No exito');
                }
            },
            error: function () {
                alert(error);
            },
            complete: function () {
                console.log('LOGINUSER');
            }
        });  
}

function OcultarValidacion() {
    document.getElementById('validacion').style.display = 'none';
    $('#password').val('');
    $('#password2').val('');
}

function NavePage(page) {
    window.location.href = page;
}