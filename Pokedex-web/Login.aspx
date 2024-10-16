<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pokedex_web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center pt-5">

    <div class="mb-3 col-4 col-sm-auto col-md-auto">
        <asp:Label Text="Registro exitoso. Por favor ingrese con el usuario generado" CssClass="alert alert-success" runat="server" Visible="false" ID="lblRegistroExitoso"/>
    </div>
 </div>

    <div class="container mt-5 border rounded pt-3 col-lg-5 col-xxl-3 col-sm-auto">

    <div class="row justify-content-center">

        <div class="mb-3 col-4 col-sm-auto col-md-auto">
            <h2>Ingreso de usuario</h2>
        </div>
     </div>

     <div class="row justify-content-center">

                <%if (Session["usuario"] != null)
                    {%>
                    <div class="mb-3 col-3 col-sm-auto col-md-auto">
                     <asp:Label Text="USUARIO" ID="lblUsuarioLogueado" runat="server" />
                    </div>

                    <div class="mb-3">
                     <asp:Label Text="¿Desea cerrar la sesión actual?" ID="lblDeslogueo" runat="server" />
                    </div>


                    <div class="mb-3">
                      <asp:Button Text="Cerrar Sesion" runat="server" ID="btnCerrarSesion" OnClick="btnCerrarSesion_Click" CssClass="btn btn-danger" />
                    </div>
                <% }
                else
                { %>
                    <div class="mb-3">
                        <label for="txtUsuario" class="form-label">Usuario:</label>
                        <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" PlaceHolder="Usuario123" MaxLength="50" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario" ErrorMessage="El campo Usuario es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label for="txtPass" class="form-label">Contraseña:</label>
                        <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" MaxLength="50" />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" ErrorMessage="El campo Contraseña es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <asp:Button Text="Ingresar" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btn btn-success card-img" />
                    </div>
            <%    }%>

    </div>

   </div> 

</asp:Content>
