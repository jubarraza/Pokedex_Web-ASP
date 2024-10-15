<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="Pokedex_web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        function showModal() {
            var myModal = new bootstrap.Modal(document.getElementById('ModalConfirmacion'));
            myModal.show();
        }
     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container mt-5">
        <div class="row justify-content-center">

            <!-- Columna izquierda -->
            <div class="col-lg-5 col-md-6 col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                            runat="server" ID="imgPokemon" CssClass="border border-5 mb-4 rounded-5 shadow w-100" />

                        <div class="mb-3">
                            <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" MaxLength="300" />
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- Columna derecha -->
            <div class="col-lg-5 col-md-6 col-sm-12">

                <div class="row mb-3">
                    <div class="col-6">
                        <label for="txtID" class="form-label">Id</label>
                        <asp:TextBox runat="server" ID="txtID" CssClass="form-control" MaxLength="4" />
                    </div>
                    <div class="col-6">
                        <label for="txtNumero" class="form-label">Número</label>
                        <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" MaxLength="4" />
                    </div>
                </div>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" MaxLength="50" />
                </div>

                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" MaxLength="50"/>
                </div>

                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Tipo</label>
                    <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="ddlDebilidad" class="form-label">Debilidad</label>
                    <asp:DropDownList ID="ddlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="ddlEvolucion" class="form-label">Evolución</label>
                    <asp:DropDownList ID="ddlEvolucion" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Botones centrados al final del formulario -->
        <div class="row mt-4">
            <div class="col text-center">
                <asp:Button Text="Guardar" ID="btnAceptar" CssClass="btn btn-primary me-2" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Editar" ID="btnEditar" CssClass="btn btn-success me-2" OnClick="btnEditar_Click" runat="server" />
                <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger me-2" OnClientClick="showModal(); return false" runat="server"/>
                <asp:Button Text="Deshabilitar" ID="btnDeshabilitar" CssClass="btn btn-warning me-2" OnClick="btnDeshabilitar_Click" runat="server"/>
                <asp:Button Text="Habilitar" ID="btnHabilitar" CssClass="btn btn-warning me-2" OnClick="btnHabilitar_Click" runat="server"/>
                <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" runat="server" />
            </div>



            <!-- Modal -->
            <div class="modal fade" id="ModalConfirmacion" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalLabel"> ⛔ Eliminar Pokemon</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>¿Confirma que desea eliminar el Pokemon?</p>
                            <p><strong>Esta accion es irreversible.</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <asp:Button Text="Eliminar Pokemon" CssClass="btn btn-danger" OnClick="btnEliminarConfirmado_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
</asp:Content>
