using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;  

namespace Pokedex_web
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Pokemon> ListaPokemons { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio pokemonNegocio = new PokemonNegocio();
            ListaPokemons = pokemonNegocio.ListarConSP();

            if (!IsPostBack)
            {
                //configuracion de Repeater
                repRepetidor.DataSource = ListaPokemons;
                repRepetidor.DataBind();
            }
            
        }

        protected void btnEjemplo_Click(object sender, EventArgs e)
        {
            string valorID = ((Button)sender).CommandArgument;
        }
    }
}