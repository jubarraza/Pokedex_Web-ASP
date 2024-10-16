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
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                user.User = txtUsuario.Text;
                user.Email = txtEmail.Text;
                user.Password = txtPass.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                user.TipoUsuario = TipoUsuario.ENTRENADOR;

                user.Id = negocio.RegistrarUsuario(user);

                Response.Redirect("Login.aspx?register=success", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}