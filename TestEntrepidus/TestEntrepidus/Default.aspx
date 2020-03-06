﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestEntrepidus._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     
     <link href="/Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="/Content/bootstrap.min.css" rel="stylesheet" />
     <link href="/Content/bootstrap.css" rel="stylesheet" />
     <link href="/Content/css/global.css" rel="stylesheet" />
     <script src="/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
     <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
     <script src="/Scripts/js/global.js" type="text/javascript"></script>


    <div class="row" style="margin-top:5%;">
        <div class="col-md-4">
          <div class="divBan container">
            <div class="col-md-4 container">
                <h4>Autentificacion de Usuario</h4><br>
                <input type="text" id="user" name="user" placeholder="Ingresa Usuario o Email" required oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')" class="form-control" /><br />
                 <input type="password" id="password" name="password" placeholder="Ingresa Password" required oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')" class="form-control" /><br />
                 <label class="checkbox-inline"><input type="checkbox" id="check" name="check" required class="btn btn-primary" /> No soy un robot</label><br /><br />

                <input type="submit" id="enviar" value="Enviar" class="voton btn btn-primary" onclick="LoginUser();"/>
               <input type="reset" id="cancelar" value="Cancelar" onclick="Limpiar();" class="voton btn btn-primary" />
           </div>
        </div>
       </div>
    </div>

    <script>
    function Limpiar() {
        $('#user').val('');
        $('#password').val('');
        $("input[type=checkbox]").prop("checked", false);
    }
</script>
</asp:Content>
