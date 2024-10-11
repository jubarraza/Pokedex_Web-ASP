<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPokemon.aspx.cs" Inherits="Pokedex_web.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col">
            <hr />
            <h2>PokeDex</h2>

            <div>
                <asp:GridView ID="dgvPokemons" runat="server" CssClass="table" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
                    OnPageIndexChanging="dgvPokemons_PageIndexChanging" AllowPaging="true" PageSize="10">
                    <Columns>
                        <asp:BoundField HeaderText="#Nro" DataField="Numero" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                        <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
                        <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍" />
                       
                    </Columns>
                </asp:GridView>
                <a href="DetallePokemon.aspx" class="btn btn-primary">Agregar</a>
            </div>

        </div>
    </div>

</asp:Content>
