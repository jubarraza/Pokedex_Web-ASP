<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Pokedex_web.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt-4 mb-4 ms-4 me-4">
        <h1>⛔ Se ha producido un error</h1>
    </div>

    <div class="mb-5 row alert alert-danger ms-4 me-4">
        <asp:Label Text="Error" ID="lblError" runat="server" />
    </div>

</asp:Content>
