<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TestEntrepidus.About" %>




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
          <h4>Nuevo Administrador</h4><br>.
          <input type="text" id="name" name="name" placeholder="Ingrese Nombre" required class="form-control" autocomplete="off"/><br />
          <input type="text" id="lastName" name="lastName" placeholder="Ingrese Apellido" required class="form-control" autocomplete="off"/><br>
          <input type="text" id="user" name="user" placeholder="Ingrese Nombre de Usuario" required class="form-control" autocomplete="off"/><br />
          <label id="validacion"  class="validacionField"></label>
          <input type="password" id="password" name="password" placeholder="Ingrese Password" required class="form-control"  autocomplete="off"/>
          <label id="msjPassword" class="lblMsj">10 caracteres minimo, combine letras y numeros</label><br />
          <input type="password" id="password2" name="password2" placeholder="Confirme Password" required class="form-control"  autocomplete="off"/><br />

          <label class="checkbox-inline"><input type="checkbox" id="check" required class="btn btn-primary" /> No soy un robot</label><br /><br />
          <input type="button" id="registrar" value="Registrar" class="voton btn btn-primary" onclick="CreateAdministrator();" />
          <input type="reset" id="cancelar" value="Cancelar" onClick="NavePage('Default.aspx');" class="voton btn btn-primary" />
       </div>

       </div>
    <br /><br />

</div>
<script>
    $(document).ready(function () {
        $('#user').val('');
        $('#password').val('');
        $('#password2').val('');
    });
</script>
</asp:Content>
