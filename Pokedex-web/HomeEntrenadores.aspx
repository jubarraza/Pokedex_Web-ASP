<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeEntrenadores.aspx.cs" Inherits="Pokedex_web.HomeEntrenadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <%   if (UsuarioAdmin((Dominio.Usuario)Session["usuario"]))
            { %>
  
                <div class="row mt-4 mb-4 ms-4 me-4">
                  <h1 class="form-title">¡Bienvenido Admin Pokemon!</h1>
                </div>

                <div class="mb-3">
                 <asp:Button Text="Menu Admin" runat="server" ID="btnMenuAdmin" OnClick="btnMenuAdmin_Click" CssClass="btn btn-success" />
                </div>

             <%}
            else
            { %>
                <div class="row mt-4 mb-4 ms-4 me-4">
                    <h1 class="form-title">¡Bienvenido Entrenador Pokemon!</h1>
                </div>


        <%  }%>
</asp:Content>
