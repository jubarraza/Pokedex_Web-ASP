using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pokemon
    {
        public int Id { get; set; } 

        [DisplayName("Número")] //tiene que ir inmediato arriba de la propiedad que queremos renombrar
        public int Numero { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        [DisplayName("Url Imagen")]
        public string UrlImagen { get; set; }

        public Elemento Tipo { get; set; }

        public Elemento Debilidad { get; set; }

        //public Pokemon Evolucion { get; set; };
    }
}
