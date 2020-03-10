<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TestEntrepidus.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href="/Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="/Content/bootstrap.min.css" rel="stylesheet" />
     <link href="/Content/bootstrap.css" rel="stylesheet" />
     <link href="/Content/css/global.css" rel="stylesheet" />
     <script src="/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
     <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
     <script src="/Scripts/js/global.js" type="text/javascript"></script>


         
    <div style="margin-top:7%;">
        <div class="container h-100">
        <div class="row h-100 justify-content-center align-items-center">
        <div class="col-2 col-md-8 col-lg-6">
              <h4>Nuevo Empleado</h4><br>
              <label class="checkbox-inline"><input type="checkbox" id="v" name="v" class="btn btn-primary" /> Venezolano</label>
              <label class="checkbox-inline"><input type="checkbox" id="e"  name="e" class="btn btn-primary" /> Extranjero</label><br /><br />
              <asp:HiddenField ID="nacionalidad" runat="server" />

              <asp:TextBox ID="identificationNumber" Name="identificationNumber" runat="server" class="form form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Cedula identidad"></asp:TextBox><br />
              <asp:TextBox ID="firstName" Name="firstName" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Nombre"></asp:TextBox><br />
              <asp:TextBox ID="lastName" Name="lastName" runat ="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Apellido"></asp:TextBox><br />
              <asp:TextBox ID="direccion" Name="direccion" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Direccion"></asp:TextBox><br />
              <asp:TextBox ID="email" Name="email" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Email"></asp:TextBox><br />
              <asp:TextBox ID="phone" Name="phone" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Telefono"></asp:TextBox><br />
          
              <label  class="lblMsj2">Fecha Contrato</label><br />
              <input type="date" id="contractDate" name="contractDate" value="" min="" max="" class="form-control" runat="server" required ><br />

              <label  class="lblMsj2">Fecha Nacimiento</label><br />
              <input type="date" id="birthDate"  name="birthDate" value="" min="" max="" class="form-control" runat="server" required ><br />

              <label  class="lblMsj2">Tarifa hora</label><br />
               <input type="number" id="rate" name="rate" min="1" max="999999999" step="2.5" class="form-control"  required oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  runat="server" ><br />

              <label class="checkbox-inline"><input type="checkbox" id="freeLance"  name="freeLance" class="btn btn-primary" runat="server" /> Freelance</label><br /><br />

              <asp:Button ID="createEmployee" runat="server" Text="Enviar" cssClass="voton btn btn-primary" OnClick="createEmployee_Click" />
              <asp:Button ID="btnClear" runat="server" Text="Cancelar" cssClass="voton btn btn-primary" OnClientClick ="return ClearForm();"/>

    </div></div></div>
    </div>


<script type="text/javascript">

    $("#v").click(function () {
        $('#e').prop("checked", false);
        $("#MainContent_nacionalidad").val('V-');
    }); 

    $("#e").click(function () {
        $('#v').prop("checked", false);
        $('#MainContent_nacionalidad').val('E-')
    }); 

    function Result(msj) {
        alert(msj);
    }

    function ClearForm() {
        $('#e').prop("checked", false);
        $('#v').prop("checked", false);
        $('#MainContent_freeLance').prop("checked", false);
        var elements = [];
        elements = document.getElementsByClassName("form-control");

        for (var i = 0; i < elements.length; i++) {
            elements[i].value = "";
        }

        return false;
    }

</script>

</asp:Content>
