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
            txtID.Enabled = false;

            try
            {
                if (!IsPostBack)
                {
                    //Carga de pantalla INICIAL
                    ElementoNegocio negocioElemento = new ElementoNegocio();

                    ddlTipo.DataSource = negocioElemento.listar();
                    ddlTipo.DataValueField = "ID";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    ddlDebilidad.DataSource = negocioElemento.listar();
                    ddlDebilidad.DataValueField = "ID";
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();

                    PokemonNegocio negocioPoke = new PokemonNegocio();
                    ddlEvolucion.DataSource = negocioPoke.ListarConSP();
                    ddlEvolucion.DataValueField = "Id";
                    ddlEvolucion.DataTextField = "Nombre";
                    ddlEvolucion.DataBind();



                    //REVISA SI ES MODIFICACION Y PRECARGA DATOS    
                    if (Request.QueryString["id"] != null)
                    {
                        pokeSeleccionado = negocioPoke.Buscar(int.Parse(Request.QueryString["id"]));

                        txtID.Text = pokeSeleccionado.Id.ToString();
                        txtNumero.Text = pokeSeleccionado.Numero.ToString();
                        txtNombre.Text = pokeSeleccionado.Nombre;
                        txtDescripcion.Text = pokeSeleccionado.Descripcion;
                        txtImagenUrl.Text = pokeSeleccionado.UrlImagen;
                        ddlTipo.SelectedValue = pokeSeleccionado.Tipo.ID.ToString();
                        ddlDebilidad.SelectedValue = pokeSeleccionado.Debilidad.ID.ToString();
                        //falta el ddlEvolucion
                        txtImagenUrl_TextChanged(sender, e);
                    }
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
                //redireccionar a una pantalla de error
                throw;
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtImagenUrl.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.ID = int.Parse(ddlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.ID = int.Parse(ddlDebilidad.SelectedValue);

                if(Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtID.Text);
                    negocio.ModificarConSP(nuevo);
                }
                else
                {
                    negocio.AgregarConSP(nuevo);
                }

                Response.Redirect("ListaPokemon.aspx", false);

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaPokemon.aspx", false);
        }
    }
}