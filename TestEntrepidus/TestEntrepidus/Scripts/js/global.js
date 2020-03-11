

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
            $('#userName').text(user);
            $('#logSession').text('Cerrar Sesion');
            console.log('LOGINUSER');
            $("input[type=checkbox]").prop("checked", false);
            return false;
        }
    }); 
    return false;
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
        type: "POST",
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
            return false;
        }
    }); 
    return false;
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
    return false;
}

function NavePage(page) {
    window.location.href = page;
}

function RemoveLogin() {
    $.ajax({
        type: "POST",
        url: "Default.aspx/RemoveLogin",
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            console.log('REMOVELOGIN_EXITO');
        },
        complete: function () {
            console.log('REMOVELOGIN');
            $('#userName').text();
            $('#logSession').text();
            window.location.href = 'Default.aspx';
            return false;
        }
    });
    return false;
}



function EmployeeListReady() {
    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/EmployeeListReady",
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var emp = JSON.parse(data.d);
            CrearTabla(emp);
        },
        complete: function () {
            console.log('EMPLOYEELISTREADY');
            return false;
        }
    });
    return false;

}

function CrearTabla(emp) {
    $('#tableEmployee tbody tr').remove();
    $.each(emp, function (index, item) {
        let tr = `<tr> 
                      <td style="text-align: center;"> ${index + 1} </td>
                      <td style="text-align: justify;"> ${item.IdentificationNumber} </td>
                      <td style="text-align: justify;"> ${item.FirstName}   ${item.LastName}</td>
                      <td style="text-align: justify;"> ${item.Email} </td>
                      <td style="text-align: center;"> <input type="button" value="Editar" class="btn btn-primary" style="width:80px;" onclick="PreventEdit('${item.IdentificationNumber}' ,'${item.FirstName}','${item.LastName}','${item.Email}');"> </td>
                      <td style="text-align: center;"> <input type="button" value="Eliminar" class="btn btn-warning" style="width:80px;" onclick="ShowModal('${item.IdentificationNumber}');"> </td>
                        </tr >`;
        $('#tableEmployee tbody').append(tr);
    });   
}

function PreventEdit(id, name, lastName, email) {
    $('#ide').val(id);
    $('#ide2').val(id);
    $('#name').val(name);
    $('#lastName').val(lastName);
    $('#email').val(email);
    $('#searchDiv').hide();
    MostrarModal();

}

function Edit() {
    var numberId = $('#ide2').val();
    var firstName = $('#name').val();
    var secondName = $('#lastName').val();
    var mail = $('#email').val();
    if (!ValidateEmail(mail)) {
        alert('El email no es valido');
        return false;
    } else if (firstName === '' || secondName === '') {
        alert('Todos los campos requridos');
        return false;
    }
    
    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/EditEmployee",
        data: JSON.stringify({ id: numberId, name: firstName, lastName: secondName, email:mail }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            EmployeeListReady();
        },
        complete: function () {
            console.log('EDIT');
            CerrarModal();
            return false;
        }
    });
}

function ShowModal(id) {
    var modal = document.getElementById('myModal2');
    modal.style.display = 'block';
    $('#searchDiv').hide();
    $('#yesno').val(id);
}

function HideModal() {
    $('#yesno').val('');
    var modal = document.getElementById('myModal2');
    modal.style.display = "none";
    $('#searchDiv').show();
}

function Remove() {

    var id = $('#yesno').val();
    if (id === '')
        return false;

    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/DeleteEmployee",
        data: JSON.stringify({ id: id }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            EmployeeListReady();
            HideModal();
        },
        complete: function () {
            $('#yesno').val('');
            console.log('REMOVE');
            return false;
        }
    });
}

function MostrarModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
}

function CerrarModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = "none";
    $('#searchDiv').show();
}

function ValidateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function PreventExtendSearch() {

    var dateInit = $('#dateInit').val();
    var dateEnd  = $('#dateEnd').val();
    var textSearch = $('#textSearch').val();

    var parametros = null;
    if (dateInit === '' && dateEnd === '' && textSearch === '') {
        return false;
    }
    else if (textSearch !== '') {

        ExtendSearchText(textSearch);
    }
    else if (dateInit !== '' && dateEnd !== '') {
        var a = new Date(dateInit);
        var b = new Date(dateEnd);
        if (b < a) {
            alert('Fecha hasta no puede ser mayor a fecha desde');
            return false;
        }

        ExtendSearchDate2(dateInit, dateEnd);
    }
    else if (dateInit !== '' && dateEnd === '') {
        ExtendSearchDate(dateInit);
    }
    
    return false;
} 

function ExtendSearchText(textSearch) {
    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/ExtendSearchText",
        data: JSON.stringify({ textSearch: textSearch }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var emp = JSON.parse(data.d);
            CrearTabla(emp);
        },
        complete: function () {
            console.log('EXTENDSEARCHTEXT');
            return false;
        }
    });
}

function ExtendSearchDate(dateInit) {
    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/ExtendSearchDate",
        data: JSON.stringify({ dateInit: dateInit }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var emp = JSON.parse(data.d);
            CrearTabla(emp);
        },
        complete: function () {
            console.log('EXTENDSEARCHDATEINIT');
            return false;
        }
    });
}

function ExtendSearchDate2(dateInit, dateEnd) {
    $.ajax({
        type: "POST",
        url: "EmployeeList.aspx/ExtendSearchDate2",
        data: JSON.stringify({ dateInit: dateInit , dateEnd: dateEnd }),
        contentType: "application/json; chartset=utf-8",
        datatype: "json",
        success: function (data) {
            var emp = JSON.parse(data.d);
            CrearTabla(emp);
        },
        complete: function () {
            console.log('EXTENDSEARCHDATEINIT');
            return false;
        }
    });
}


function KeyPress() {
    $('#dateInit').val('');
    $('#dateEnd').val('');
    }

function ClearText() {
    $('#textSearch').val('');
}