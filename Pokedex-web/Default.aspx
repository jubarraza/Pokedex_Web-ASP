<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pokedex_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <div>
        <h1>Bienvenido a tu catalogo Pokemon!</h1>

    </div>


    <div class="row row-cols-1 row-cols-md-6 g-4">

<%--      EJEMPLO FOREACH  <% 
            foreach (Dominio.Pokemon poke in ListaPokemons)
            {
        %>
        <div class="col">
            <div class="card">
                <img src="<%: poke.UrlImagen %>" class="card-img-top" alt="<%: poke.Nombre %>">
                <div class="card-body">
                    <h5 class="card-title"><%: "# " + poke.Numero + " - " + poke.Nombre %> </h5>
                    <p class="card-text"><%: poke.Descripcion %></p>
                    <a href="DetallePokemon.aspx?id=<%: poke.Id %>">Ver Detalle</a>
                </div>
            </div>
        </div>
        <%
            }
        %>--%>

        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>

                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="<%#Eval("Nombre") %>">
                        <div class="card-body">
                            <h5 class="card-title"><%# "# " + Eval("Numero") + " - " + Eval("Nombre") %> </h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <%--<a href="DetallePokemon.aspx?id=<%#Eval("Id") %>">Ver Detalle</a>--%>
                            <asp:Button ID="btnDetalle" runat="server" Text="Ver Detalle" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id") %>' CommandName="PokemonId" OnClick="btnDetalle_Click" />
                            <asp:Button ID="btnEjemplo" runat="server" Text="Ejemplo" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id") %>' CommandName="PokemonId" OnClick="btnEjemplo_Click" />

                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
