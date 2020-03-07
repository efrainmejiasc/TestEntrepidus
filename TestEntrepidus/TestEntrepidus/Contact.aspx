<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TestEntrepidus.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href="/Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="/Content/bootstrap.min.css" rel="stylesheet" />
     <link href="/Content/bootstrap.css" rel="stylesheet" />
     <link href="/Content/css/global.css" rel="stylesheet" />
     <script src="/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
     <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
     <script src="/Scripts/js/global.js" type="text/javascript"></script>


 <div class="row" >

       <div class="col-md-4">
          <div class="divBan container">
          <h4>Nuevo Empleado</h4><br>
              <label class="checkbox-inline"><input type="checkbox" id="v" required class="btn btn-primary" /> Venezolano</label>
               <label class="checkbox-inline"><input type="checkbox" id="e" required class="btn btn-primary" /> Extranjero</label><br /><br />
              <asp:TextBox ID="ci" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Cedula identidad"></asp:TextBox><br />
              <asp:TextBox ID="name" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Nombre"></asp:TextBox><br />
              <asp:TextBox ID="lastName" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Apellido"></asp:TextBox><br />
              <asp:TextBox ID="direccion" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Direccion"></asp:TextBox><br />
              <asp:TextBox ID="email" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Email"></asp:TextBox><br />
              <asp:TextBox ID="phone" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese Telefono"></asp:TextBox><br />
              <label  class="lblMsj">Fecha Contrato</label><br />
              <input type="date" id="dateContract" value="2018-07-22" min="2018-01-01" max="2018-12-31" class="form-control" placeholder="Ingrese Telefono" ><br />
              <label  class="lblMsj">Fecha Nacimiento</label><br />
              <input type="date" id="birthDate"  value="2018-07-22" min="2018-01-01" max="2018-12-31" class="form-control"><br />
              <asp:TextBox ID="rate" runat="server" class="form-control" autocomplete="off" required="true" oninvalid="setCustomValidity('Rellene esta campo')" oninput="setCustomValidity('')"  placeholder="Ingrese tarifa"></asp:TextBox><br />
              <label class="checkbox-inline"><input type="checkbox" id="frelance" required class="btn btn-primary" /> Freelance</label><br /><br />
              <asp:Button ID="btnBB" runat="server" Text="Enviar" cssClass="voton btn btn-primary" />
              <asp:Button ID="Button1" runat="server" Text="Cancelar" cssClass="voton btn btn-primary"/>
       </div>
       </div>
    <br /><br />

</div>

<script type="text/javascript">

</script>

</asp:Content>
