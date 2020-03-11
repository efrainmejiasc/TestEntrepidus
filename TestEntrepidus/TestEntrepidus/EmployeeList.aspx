<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="TestEntrepidus.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <link href="/Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="/Content/bootstrap.min.css" rel="stylesheet" />
     <link href="/Content/bootstrap.css" rel="stylesheet" />
     <link href="/Content/css/global.css" rel="stylesheet" />
     <script src="/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
     <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
     <script src="/Scripts/js/global.js" type="text/javascript"></script>


  <div class="container" style="margin-top:8%;">

  <div class="row"  id="searchDiv">
      <div class="form-group">
         <div class="input-group">
              <label>Fecha contrato desde</label>
               <input  type="date" id="dateInit" value="" min="" max="" class="form-control" onchange="ClearText();"/>
               <span class="input-group-addon"  style="background-color:white;border-color:white;"> </span>
               <label>Fecha contrato hasta</label>
                <input  type="date" id="dateEnd"  value="" min="" max="" class="form-control" onchange="ClearText();"/>
               <span class="input-group-addon"  style="background-color:white;border-color:white;"> </span>
                <label>Buscar</label>
               <input  type="text" id="textSearch" class="form-control" onkeypress="javascript:return KeyPress();" />
               <span class="input-group-addon" style="background-color:white;border-color:white;"> </span>
               <br />
              <input  type="button" id="btnSearch"  value="Ver"  class="btn btn-success" runat="server"  style="width:180px" onclick="return PreventExtendSearch();">
        </div>
      </div>
    </div>


      <br /><br />
        <table id="tableEmployee" class="table table-bordered table-hover myDataTable">
       
            <thead>
                <tr style="background-color:gainsboro;">
                    <th onclick="SortTable(0)">Nª</th>
                    <th onclick="SortTable(1)">Cedula</th>
                    <th onclick="SortTable(2)">Nombre</th>
                    <th onclick="SortTable(3)">Email</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

             <tbody>

            </tbody>
        </table>


        <div id="myModal" class="modal" style="margin-top:8%;">
        <div class="modal-content">
            <div align="center">
                 <input type="hidden" id="ide2"/>
                 <span id="cerrar" class="close"  style="float:right;" onclick="CerrarModal();">&times;</span><br /><br />
                 <input type="text" id="ide" class="form-control" value="" readonly style="width:1000px"/>
                 <input type="text" id="name" class="form-control" value="" required />
                 <input type="text" id="lastName" class="form-control" value="" required/>
                 <input type="email" id="email" class="form-control" value="" required />   
                 <input type="button" class="btn-success form-control" value="Modificar" onclick="Edit();" />

            </div>
        </div>
           </div>

       <div id="myModal2" class="modal2" style="margin-top:8%;">
           <div class="modal-content">
            <div align="center">
                 <input type="hidden" id="yesno"/>
                 <span id="close" class="close"  style="float:right;" onclick="HideModal();">&times;</span><br /><br />
                 <label>¿Realmente desea eliminar este registro?</label>
                 <input type="button" class="btn-danger form-control" value="SI" onclick="Remove();" /><br /><br />
             </div>

           </div>
         </div>
    </div>

<script>
    $(document).ready(function () {
        EmployeeListReady();
    });

    function SortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("tableEmployee");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

</script>
</asp:Content>
