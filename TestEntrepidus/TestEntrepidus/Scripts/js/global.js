

function LoginUser() {
    var user = $('#user').val();
    var password = $('#password').val();
    var flag = $('#check:checked').val();
    var flag2 = $('#check2:checked').val();
    if (user === '' || password === '' || flag !== 'on') {
        alert('Todos los campos son obligatorios');
        return false;
    }
    var session = '';
    if (flag2 === 'on') {
        session = 'si';
    }

    var parametros = JSON.stringify({ user: user, password: password,session: session });
    $.ajax({
        type: "POST",
        url: "Default.aspx/LoginUser",
        data:parametros,
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var respuesta = JSON.parse(data.d);
            console.log(respuesta);
            if (respuesta.Description === 'Autentificacion Exitosa')
                alert(respuesta.Description);
            else
                alert(respuesta.Description);
        },
        complete: function () {
            console.log('LOGINUSER');
        }
    });      
}

function CreateAdministrator() {

    var name = $('#name').val();
    var lastName = $('#lastName').val();
    var user = $('#user').val();
    var a = $('#password').val();
    var b = $('#password2').val();

    if (a !== b) {
        alert('Los passwords deben ser identicos');
        return false;
    } else if (password.length < 10) {
        alert('El password debe contener minimo 10 caracteres');
        return false;
    }

    var may = false;
    var min = false;
    var num = false;
    for (var i = 0; i < a.length; i++) {
        if (a.charCodeAt(i) >= 65 && a.charCodeAt(i) <= 90)
            may = true;
        else if (a.charCodeAt(i) >= 97 && a.charCodeAt(i) <= 122)
            min = true;
        else if (a.charCodeAt(i) >= 48 && a.charCodeAt(i) <= 57)
            num= true;
    }

    if (min === false && may === false) {
        CancelSubmit( 'El password debe contener letras');
        return false;
    }
    if (num === false) {
        CancelSubmit( 'El Password debe contener numeros');
        return false;
    }

    $.ajax({
        type: "GET",
        url: "About.aspx/CreateAdministrator",
        data: JSON.stringify({ name: name , lastName: lastName, user: user, password: a }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var respuesta = JSON.parse(data.d);
            if (respuesta.Description === 'Administrador creado satisfactoriamente') {
                console.log(respuesta);
                alert(respuesta.Description);
                NavePage('Default.aspx');
            }
            else {
                alert(respuesta.Description);
            }
        },
        complete: function () {
            console.log('CREATEADMINISTRATOR');
        }
    }); 
 
}

function CancelSubmit(msj) {
    document.getElementById('validacion').innerHTML = msj;
    document.getElementById('validacion').style.display = 'block';
    setTimeout(HideValidation, 10000);
}

function HideValidation() {
    document.getElementById('validacion').style.display = 'none';
    $('#password').val('');
    $('#password2').val('');
}

function NavePage(page) {
    window.location.href = page;
}