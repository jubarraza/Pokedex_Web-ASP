using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Pokedex_web
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio pokemonNegocio = new PokemonNegocio();
            Session.Add("listaPokemon", pokemonNegocio.ListarConSP());

            dgvPokemons.DataSource = Session["listaPokemon"];
            dgvPokemons.DataBind();

        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("DetallePokemon.aspx?id=" + id);
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> listaPokemon = (List<Pokemon>)Session["listaPokemon"];

            List<Pokemon> listaFiltrada = listaPokemon.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));

            dgvPokemons.DataSource = listaFiltrada;
            dgvPokemons.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
           txtFiltro.Enabled = !(chkFiltroAvanzado.Checked);

            //carga inicial porque viene Nombre por deafult en el ddlCampos
            ddlCriterio.Items.Add("Contiene");
            ddlCriterio.Items.Add("Comienza con");
            ddlCriterio.Items.Add("Termina con");
        }

        protected void btnBuscarFiltroAvanzado_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocioPoke = new PokemonNegocio();
                dgvPokemons.DataSource = negocioPoke.Filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text, ddlEstado.SelectedItem.ToString());
                dgvPokemons.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                //redirigir a pagina de error
            }
        }

        protected void btnLimparFiltroAvz_Click(object sender, EventArgs e)
        {
            ddlCampo.SelectedIndex = 0;
            ddlCriterio.SelectedIndex = 0;
            txtFiltroAvanzado.Text = "";
            ddlEstado.SelectedIndex = 0;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Numero")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }
    }
}