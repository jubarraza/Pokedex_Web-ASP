using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class PokemonNegocio
    {
        public List<Pokemon> Listar() 
        {
            List<Pokemon> lista = new List<Pokemon>();
            AccesoDatos datos = new AccesoDatos();


            try
            {
                datos.SetearConsulta("SELECT p.Numero, p.Nombre, p.Descripcion, p.UrlImagen, e.Descripcion as Tipo, d.Descripcion as Debilidad, p.IdTipo, p.IdDebilidad, p.Id FROM POKEMONS p INNER JOIN ELEMENTOS e ON p.IdTipo = e.Id INNER JOIN ELEMENTOS d on p.IdDebilidad = d.Id WHERE p.Activo = 1 ORDER BY Numero ASC");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Pokemon aux = new Pokemon();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Numero = datos.Lector.GetInt32(0); //pide especificacion del tipo de dato, asigna columna por indice de la consulta
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["UrlImagen"] is DBNull))
                    {
                        aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    //como no lo hicimos en el contructor de POKEMON creamos el elemento de su composicion
                    aux.Tipo = new Elemento();
                    aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    aux.Debilidad = new Elemento();
                    aux.Debilidad.ID = (int)datos.Lector["IdDebilidad"];
                    aux.Debilidad.Descripcion = (string)datos.Lector["Debilidad"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.CerrarConexion(); }

        }

        public List<Pokemon> ListarConSP()
        {
            List<Pokemon> lista = new List<Pokemon>();
            AccesoDatos datos = new AccesoDatos();


            try
            {
                datos.SetearProcedure("spListar");
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Pokemon aux = new Pokemon();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Numero = datos.Lector.GetInt32(0); //pide especificacion del tipo de dato, asigna columna por indice de la consulta
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["UrlImagen"] is DBNull))
                    {
                        aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    //como no lo hicimos en el contructor de POKEMON creamos el elemento de su composicion
                    aux.Tipo = new Elemento();
                    aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    aux.Debilidad = new Elemento();
                    aux.Debilidad.ID = (int)datos.Lector["IdDebilidad"];
                    aux.Debilidad.Descripcion = (string)datos.Lector["Debilidad"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.CerrarConexion(); }
        }

        public void Agregar(Pokemon nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("INSERT INTO POKEMONS (Numero, Nombre, Descripcion, Activo, IdTipo, IdDebilidad, UrlImagen) VALUES (@Numero, @Nombre, @Descripcion, 1, @IdTipo, @IdDebilidad, @UrlImagen)");
                datos.SetearParametro("@Numero", nuevo.Numero);
                datos.SetearParametro("@Nombre", nuevo.Nombre);
                datos.SetearParametro("@Descripcion", nuevo.Descripcion);
                datos.SetearParametro("@IdTipo", nuevo.Tipo.ID);
                datos.SetearParametro("@IdDebilidad", nuevo.Debilidad.ID);
                datos.SetearParametro("@UrlImagen", nuevo.UrlImagen);
                
                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void AgregarConSP(Pokemon nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearProcedure("storedAltaPokemon");
                datos.SetearParametro("@Numero", nuevo.Numero);
                datos.SetearParametro("@Nombre", nuevo.Nombre);
                datos.SetearParametro("@Descripcion", nuevo.Descripcion);
                datos.SetearParametro("@UrlImagen", nuevo.UrlImagen);
                datos.SetearParametro("@IdTipo", nuevo.Tipo.ID);
                datos.SetearParametro("@IdDebilidad", nuevo.Debilidad.ID);
                datos.SetearParametro("@IdEvolucion", nuevo.Tipo.ID);

                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void Modificar(Pokemon poke)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("UPDATE POKEMONS SET Numero = @Numero, Nombre = @Nombre, Descripcion = @Desc, UrlImagen = @Img, IdTipo = @IdTipo, IdDebilidad = @IdDebilidad where Id = @Id");
                datos.SetearParametro("@Numero", poke.Numero);
                datos.SetearParametro("@Nombre", poke.Nombre);
                datos.SetearParametro("@Desc", poke.Descripcion);
                datos.SetearParametro("@Img", poke.UrlImagen);
                datos.SetearParametro("@IdTipo", poke.Tipo.ID);
                datos.SetearParametro("@IdDebilidad", poke.Debilidad.ID);
                datos.SetearParametro("@Id", poke.Id);

                datos.EjecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally {  datos.CerrarConexion();}
        }

        public void ModificarConSP(Pokemon poke)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearProcedure("storedModificarPokemon");
                datos.SetearParametro("@Numero", poke.Numero);
                datos.SetearParametro("@Nombre", poke.Nombre);
                datos.SetearParametro("@Desc", poke.Descripcion);
                datos.SetearParametro("@Img", poke.UrlImagen);
                datos.SetearParametro("@IdTipo", poke.Tipo.ID);
                datos.SetearParametro("@IdDebilidad", poke.Debilidad.ID);
                datos.SetearParametro("@Id", poke.Id);

                datos.EjecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally { datos.CerrarConexion(); }
        }

        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("DELETE FROM POKEMONS WHERE Id = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EliminarLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("UPDATE POKEMONS SET Activo = 0 WHERE Id = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void RestaurarEliminado(Pokemon poke)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                int id = poke.Id;
                datos.SetearConsulta("UPDATE POKEMONS SET Activo = 1 WHERE Id = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Pokemon> ListarEliminados()
        {
            List<Pokemon> lista = new List<Pokemon>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT p.Numero, p.Nombre, p.Descripcion, p.UrlImagen, e.Descripcion as Tipo, d.Descripcion as Debilidad, p.IdTipo, p.IdDebilidad, p.Id FROM POKEMONS p INNER JOIN ELEMENTOS e ON p.IdTipo = e.Id INNER JOIN ELEMENTOS d on p.IdDebilidad = d.Id WHERE p.Activo = 0 ORDER BY Numero ASC");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Pokemon aux = new Pokemon();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Numero = datos.Lector.GetInt32(0);
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["UrlImagen"] is DBNull))
                    {
                        aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    aux.Tipo = new Elemento();
                    aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    aux.Debilidad = new Elemento();
                    aux.Debilidad.ID = (int)datos.Lector["IdDebilidad"];
                    aux.Debilidad.Descripcion = (string)datos.Lector["Debilidad"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.CerrarConexion(); }

        }

        public List<Pokemon> Filtrar(string campo, string criterio, string filtro)
        {
            List<Pokemon> lista = new List<Pokemon>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT p.Numero, p.Nombre, p.Descripcion, p.UrlImagen, e.Descripcion as Tipo, d.Descripcion as Debilidad, p.IdTipo, p.IdDebilidad, p.Id FROM POKEMONS p INNER JOIN ELEMENTOS e ON p.IdTipo = e.Id INNER JOIN ELEMENTOS d on p.IdDebilidad = d.Id WHERE p.Activo = 1 AND ";
                
                if(campo == "Numero")
                {
                    switch (criterio)
                    {

                        case "Mayor a":

                            consulta += "p.Numero > " + filtro;

                            break;

                        case "Menor a":
                            consulta += "p.Numero < " + filtro;
                            break;

                        case "Igual a":
                            consulta += "p.Numero = " + filtro;
                            break;
                    }

                }
                else
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "p."+ campo + " LIKE '" + filtro + "%'";
                            break;

                        case "Termina con":
                            consulta += "p." + campo + " LIKE '%" + filtro + "'";
                            break;

                        case "Contiene":
                            consulta += "p." + campo + " LIKE '%" + filtro + "%'";
                            break;
                    }
                }

                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Pokemon aux = new Pokemon();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Numero = (int)datos.Lector["Numero"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["UrlImagen"] is DBNull))
                    {
                        aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    aux.Tipo = new Elemento();
                    aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];
                    aux.Debilidad = new Elemento();
                    aux.Debilidad.ID = (int)datos.Lector["IdDebilidad"];
                    aux.Debilidad.Descripcion = (string)datos.Lector["Debilidad"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        public Pokemon Buscar(int id)
        {
            PokemonNegocio negocio = new PokemonNegocio();
            List<Pokemon> lista = negocio.ListarConSP();

            foreach (Pokemon p in lista)
            {
                if (p.Id == id) { 
                    return p;
                }
            }

            return new Pokemon() ;
        }

        public void DeshabilitarPokemon(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("UPDATE POKEMONS SET Activo = 0 WHERE Id = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void HabilitarPokemon(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("UPDATE POKEMONS SET Activo = 1 WHERE Id = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
