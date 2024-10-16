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
            try
            {
                if (user != null)
                {
                    UsuarioNegocio neg = new UsuarioNegocio();
                    return neg.UsuarioAdmin(user);
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
                return false;
            }
           
            
        }

        protected void btnMenuAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuAdmin.aspx", false);
        }
    }
}