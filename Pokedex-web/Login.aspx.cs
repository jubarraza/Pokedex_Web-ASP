using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokedex_web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario user = (Usuario)Session["usuario"];
                lblUsuarioLogueado.Text = "Ya se encuentra logueado con el usuario: " + user.User;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocioE = new UsuarioNegocio();
                Usuario user = negocioE.Login(txtUsuario.Text, txtPass.Text);

                if (user != null)
                {
                    Session.Add("usuario", user);
                    Response.Redirect("HomeEntrenadores.aspx", false);

                }
                else
                {
                    Session.Add("error", "User o Contraseña incorrecto");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("usuario");
                Response.Redirect("Login.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            
        }
    }
}