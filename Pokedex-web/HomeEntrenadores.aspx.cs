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
    public partial class HomeEntrenadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Se debe iniciar sesion de usuario para acceder a esta pagina");
                Response.Redirect("Error.aspx", false);
            }
        }

        public bool UsuarioAdmin(Usuario user)
        {
            UsuarioNegocio neg = new UsuarioNegocio();
            return neg.UsuarioAdmin(user);
        }

        protected void btnMenuAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuAdmin.aspx", false);
        }
    }
}