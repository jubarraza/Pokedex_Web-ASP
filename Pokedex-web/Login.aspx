<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pokedex_web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row ms-3 mt-5">

        <div class="mb-3">
            <h2>Ingreso de usuario</h2>
        </div>
     </div>

     <div class="row ms-3 mt-2">
            

                <%if (Session["usuario"] != null)
                    {%>
         <div class="col-3 col-sm-auto col-md-auto"> 
                    <div class="mb-3">
                     <asp:Label Text="USUARIO" ID="lblUsuarioLogueado" runat="server" />
                    </div>

                    <div class="mb-3">
                     <asp:Label Text="¿Desea cerrar la sesión actual?" ID="lblDeslogueo" runat="server" />
                    </div>


                    <div class="mb-3">
                      <asp:Button Text="Cerrar Sesion" runat="server" ID="btnCerrarSesion" OnClick="btnCerrarSesion_Click" CssClass="btn btn-danger" />
                    </div>
              </div>
                <% }
                else
                { %>
         <div class="col-3 col-sm-auto col-md-auto">
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
                        <asp:Button Text="Ingresar" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btn btn-primary" />
                    </div>
             </div>
            <%    }%>

    </div>

    

</asp:Content>
