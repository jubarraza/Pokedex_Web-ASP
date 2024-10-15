<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPokemon.aspx.cs" Inherits="Pokedex_web.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col">
            <hr />
            <h2>PokeDex</h2>

            <div>
                <asp:ScriptManager runat="server" />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="row">

                            <div class="col-3 mb-3">
                                <label class="form-label">Buscar</label>
                                <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" runat="server" />
                            </div>

                            <div class="col-2 mb-3 text-center mt-4">
                                <asp:CheckBox Text=" Filtro Avanzado" ID="chkFiltroAvanzado" CssClass="form-check form-control-lg" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" AutoPostBack="true" runat="server" />
                            </div>
                        </div>


                        <%if (chkFiltroAvanzado.Checked)
                            {
                        %>

                        <div class="row mb-4">

                            <div class="col-2 mb-3 bg-success-subtle pt-3 pb-3 ms-3">
                                <asp:Label Text="Campo" ID="lblCampo" runat="server" CssClass="form-label" />
                                <asp:DropDownList ID="ddlCampo" runat="server" CssClass="form-control form-select" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="Nombre" />
                                    <asp:ListItem Text="Numero" />
                                    <asp:ListItem Text="Tipo" />
                                    <asp:ListItem Text="Debilidad" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-2 mb-3 bg-success-subtle pt-3 pb-3">
                                <asp:Label Text="Criterio" ID="lblCriterio" runat="server" CssClass="form-label" />
                                <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-control form-select"></asp:DropDownList>
                            </div>

                            <div class="col-3 mb-3 bg-success-subtle pt-3 pb-3">
                                <asp:Label Text="Valor a buscar" ID="lblFiltro" runat="server" CssClass="form-label" />
                                <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
                            </div>

                            <div class="col-2 mb-3 bg-success-subtle pt-3 pb-3">
                                <asp:Label Text="Estado" ID="lblEstado" runat="server" CssClass="form-label" />
                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control form-select">
                                    <asp:ListItem Text="Todos" />
                                    <asp:ListItem Text="Activos" />
                                    <asp:ListItem Text="Inactivos" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-1 mb-3 bg-success-subtle pt-3 pb-3">
                                <asp:Button Text="Buscar" ID="btnBuscarFiltroAvanzado" runat="server" CssClass="btn btn-outline-primary mt-4 card-img rounded text-center" OnClick="btnBuscarFiltroAvanzado_Click" />
                            </div>
                            <div class="col-1 mb-3 bg-success-subtle pt-3 pb-3">
                                <asp:Button Text="Limpiar Filtro" ID="btnLimparFiltroAvz" runat="server" CssClass="btn btn-outline-danger mt-4 card-img rounded text-center" OnClick="btnLimparFiltroAvz_Click" />
                            </div>

                        </div>

                        <%  } %>

                        <asp:GridView ID="dgvPokemons" runat="server" CssClass="table" AutoGenerateColumns="false"
                            DataKeyNames="Id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
                            OnPageIndexChanging="dgvPokemons_PageIndexChanging" AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:BoundField HeaderText="#Nro" DataField="Numero" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                                <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
                                <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                                <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍" />

                            </Columns>
                        </asp:GridView>
                        <a href="DetallePokemon.aspx" class="btn btn-primary">Agregar</a>

                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

        </div>
    </div>

</asp:Content>
