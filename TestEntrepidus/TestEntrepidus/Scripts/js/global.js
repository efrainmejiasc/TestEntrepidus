

function LoginUser() {
    var user = $('#user').val();
    var password = $('#password').val();
    var flag = $('#check:checked').val();
    if (user === '' || password === '' || flag !== 'on') {
        alert('Todos los campos son obligatorios');
        return false;
    }
    var parametros = JSON.stringify({ user: user, password: password });
    $.ajax({
        type: "POST",
        url: "Default.aspx/LoginUser",
        data:parametros,
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var dtP = JSON.parse(data.d);
            console.log(dtP);
            if (dtP.Description === 'Autentificacion Exitosa')
                alert(dtP.Description);
            else
                alert(dtP.Description);
        },
        failure: function () {
            console.log(failure);
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

    console.log(min);
    console.log(may);
    console.log(num);


    if (min === false && may === false) {
        CancelSubmit( 'El password debe contener letras');
        return false;
    }
    if (num === false) {
        CancelSubmit( 'El Password debe contener numeros');
        return false;
    }

    $.ajax({
        type: "POST",
        url: "About.aspx/CreateAdministrator",
        data: JSON.stringify({ name: name , lastName: lastName, user: user, password: a }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var dtP = JSON.parse(data.d);
            if (dtP.Description === 'Administrador creado satisfactoriamente') {
                console.log(dtP);
                alert(dtP.Description);
                NavePage('Default.aspx');
            }
            else {
                alert(dtp.Description);
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
    setTimeout(HideValidation, 4000);
}

function HideValidation() {
    document.getElementById('validacion').style.display = 'none';
    $('#password').val('');
    $('#password2').val('');
}

function NavePage(page) {
    window.location.href = page;
}