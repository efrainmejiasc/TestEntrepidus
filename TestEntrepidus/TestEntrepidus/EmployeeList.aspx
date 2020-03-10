<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="TestEntrepidus.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <link href="/Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="/Content/bootstrap.min.css" rel="stylesheet" />
     <link href="/Content/bootstrap.css" rel="stylesheet" />
     <link href="/Content/css/global.css" rel="stylesheet" />
     <script src="/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
     <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
     <script src="/Scripts/js/global.js" type="text/javascript"></script>





    <div class ="box-body" style="margin-top:5%;">
        <div class="container-fluid">
            <div class="col-md-4" style="display:inline-block">
            <input  type="text" id="search" class="form-control" runat="server"/>
            <input  type="date" id="init" value="" min="" max="" class="form-control" runat="server" >
            <input  type="date" id="end"  value="" min="" max="" class="form-control" runat="server" >
            <input  type="button" id="btnSearch"  value="Buscar"  class="btn btn-success" runat="server" >
            </div>
        </div><br /><br />

        <table id="tableEmployee" class="table table-bordered table-hover myDataTable">
       
            <thead>
                <tr>
                    <th>Nª</th>
                    <th>Cedula</th>
                    <th>Nombre Completo</th>
                    <th>Email</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

             <tbody>

            </tbody>
        </table>
    </div>


       <div id="myModal" class="modal">
        <div class="modal-content">
                 <input type="hidden" id="ide2"/>
                 <span id="cerrar" class="close"  style="float:right;" onclick="CerrarModal();">&times;</span><br /><br />
                 <input type="text" id="ide" class="txtMod form-control" value="" readonly/>
                 <input type="text" id="name" class="txtmod form-control" value="" required />
                 <input type="text" id="lastName" class="txtMod form-control" value="" required/>
                 <input type="email" id="email" class="txtMod form-control" value="" required />   
                 <input type="button" class="btn btn-success" value="Modificar" onclick="Edit();" />
        </div>
           </div>


<script>
    $(document).ready(function () {
        EmployeeListReady();
    });
</script>
</asp:Content>
