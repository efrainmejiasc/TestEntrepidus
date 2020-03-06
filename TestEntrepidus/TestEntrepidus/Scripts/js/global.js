

function LoginUser() {
    var user = $('#user').val();
    var password = $('#password').val();
    var flag = $('#check:checked').val();
    if (user === '' || password === '' || flag !== 'on') {
        alert('Todos los campos son obligatorios');
        return false;
    }
        $.ajax({
            type: "POST",
            url: "Default.aspx/LoginUser",
            data: JSON.stringify({ user: user , password: password}),
            contentType:"application/json; chartset=utf-8",
            datatype: "json",
            success: function (data) {
                data = JSON.stringify(data);
                if (data.Description === "Autentificacion Exitosa") {
                    alert(data.Description);
                    console.log(0);
                } else {
                    alert(data.Description);
                    console.log(1);
                }
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