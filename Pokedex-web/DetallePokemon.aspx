<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="Pokedex_web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <div class="row g-3">

        <div class="col-md-3">
            <label for="txtID" class="form-label"># Numero</label>
            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" />
        </div>

        <div class="col-md-9">
            <label for="txtNombre" class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
        </div>

        <div class="col-12">
            <label for="inputAddress" class="form-label">Descripcion</label>
            <asp:TextBox TextMode="MultiLine" CssClass="form-control" ID="txtDescripcion" runat="server" />
        </div>

        <div class="col-md-2">
        </div>

        <div class="col-md-4">
            <label for="txtTipo" class="form-label">Tipo</label>
            <asp:TextBox ID="txtTipo" CssClass="form-control" runat="server" />
        </div>

        <div class="col-md-4">
            <label for="txtDebilidad" class="form-label">Debilidad</label>
            <asp:TextBox ID="txtDebilidad" CssClass="form-control" runat="server" />
        </div>

        <div class="col-md-2">
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Sign in</button>
        </div>
    </div>

</asp:Content>
