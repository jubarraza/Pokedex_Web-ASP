<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="Pokedex_web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row mt-5">

        <div class="col-3"></div>

        <div class="col-2 ms-4 me-4">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                        runat="server" ID="imgPokemon" CssClass="border border-5 mb-4 rounded-5 shadow w-100"/>

                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>


            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo: </label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

        </div>

        <div class="col-3 mt-2">

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
                <label for="txtDescripcion" class="form-label">Descripción: </label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="ddlEvolucion" class="form-label">Evolucion</label>
                <asp:DropDownList ID="ddlEvolucion" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
        </div>

        <div class="row mt-4">

            <div class="col-5"></div>
            
            <div class="col-3 mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" runat="server" />
            </div>

        </div>


    </div>
</asp:Content>
