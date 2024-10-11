<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="Pokedex_web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">

        <div class="col-2"></div>
        <div class="col-4">
           

            <div class="mb-3">
                <label for="txtID" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtID" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtNumero" class="form-label">Número: </label>
                <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo: </label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <a href="PokemonsLista.aspx">Cancelar</a>
            </div>
        </div>

        <div class="col-4">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción: </label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="ddlEvolucion" class="form-label">Evolucion</label>
                <asp:DropDownList ID="ddlEvolucion" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                        runat="server" ID="imgPokemon" Width="60%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="col-2"></div>


    </div>
</asp:Content>
