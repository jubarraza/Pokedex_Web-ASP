<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="Pokedex_web.RegistroUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 border rounded pt-3 col-lg-5 col-xxl-3 col-sm-auto">



        <div class="row justify-content-center">

            <div class="mb-3 col-4 col-sm-auto col-md-auto">
                <h2>Registar nuevo usuario</h2>
            </div>
        </div>

        <div class="row justify-content-center">


            <div class="mb-3">
                <label for="txtUsuario" class="form-label">Usuario:</label>
                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" PlaceHolder="Usuario123" MaxLength="50" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario" ErrorMessage="El campo Usuario es obligatorio" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email:</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" PlaceHolder="email@dominio.com" MaxLength="70" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="El campo Email es obligatorio" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="mb-4">
                <label for="txtPass" class="form-label">Contraseña:</label>
                <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" MaxLength="50" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" ErrorMessage="El campo Contraseña es obligatorio" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de nacimiento:</label>
                <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="El campo Fecha de Nacimiento es obligatorio" CssClass="text-danger" Display="Dynamic" />
            </div>


            <div class="mt-3 mb-3">
                <asp:Button Text="Registrarse" runat="server" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" CssClass="btn btn-primary card-img" />
            </div>

        </div>

    </div>

</asp:Content>
