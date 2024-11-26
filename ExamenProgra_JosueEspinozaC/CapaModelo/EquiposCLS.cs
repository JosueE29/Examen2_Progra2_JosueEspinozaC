using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenProgra_JosueEspinozaC.CapaModelo
{
    public class EquiposCLS
    {
        public int EquipoID { get; set; }
        public string TipoEquipo { get; set; }
        public string Modelo { get; set; }
        public int UsuarioID { get; set; }
    }
}