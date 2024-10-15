using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Pokedex_web
{
    public partial class MenuAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (Session["usuario"] == null)
            {
                Session.Add("error", "Se debe iniciar sesion de usuario para acceder a esta pagina");
                Response.Redirect("Error.aspx", false);
            }
            else if (!negocio.UsuarioAdmin((Dominio.Usuario)Session["usuario"]))
            {
                Session.Add("error", "Se debe tener permiso de Admin para acceder a esta pagina");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}