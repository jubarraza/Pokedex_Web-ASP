using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokedex_web
{
    public partial class DetallePokemon : System.Web.UI.Page
    {
        public Pokemon pokeSeleccionado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();

            if(Request.QueryString["id"] != null)
            {
                pokeSeleccionado = negocio.Buscar(int.Parse(Request.QueryString["id"]));

                txtID.Text = pokeSeleccionado.Id.ToString();
                txtID.ReadOnly = true;
                txtNombre.Text = pokeSeleccionado.Nombre;
                txtDescripcion.Text = pokeSeleccionado.Descripcion;
                txtTipo.Text = pokeSeleccionado.Tipo.Descripcion;
                txtDebilidad.Text = pokeSeleccionado.Debilidad.Descripcion;
            }

        }
    }
}