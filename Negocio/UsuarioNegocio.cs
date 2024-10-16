using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UsuarioNegocio
    {
       public Usuario Login(string user, string pass)
        {
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.SetearProcedure("spLoguin");
                datos.SetearParametro("@user", user);
                datos.SetearParametro("@pass", pass);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario userAux = new Usuario(user, pass, (int)datos.Lector["TipoUser"] == 2);
                    userAux.Id = (int)datos.Lector["Id"];
                    return userAux;
                }

                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
       }


        public bool UsuarioAdmin(Usuario user)
        {
            if (user.TipoUsuario == TipoUsuario.ADMIN)
            {
                return true;
            }

            return false;
        }

        public int RegistrarUsuario(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearProcedure("registrarUsuario");
                datos.SetearParametro("@user", nuevo.User);
                datos.SetearParametro("@email", nuevo.Email);
                datos.SetearParametro("@pass", nuevo.Password);
                datos.SetearParametro("@fechaNac", nuevo.FechaNacimiento);
                datos.SetearParametro("@tipoUsuario", 1);

                return datos.EjecutarAccionScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
