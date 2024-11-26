using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using ExamenProgra_JosueEspinozaC.CapaLogica;
using ExamenProgra_JosueEspinozaC.CapaModelo;

namespace ExamenProgra_JosueEspinozaC.Vistas_Examen
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
            LlenarGridTecnico();
            LlenarGridEquipos();
        }
        protected void LlenarGrid()
        {
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Usuarios"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                        }
                    }
                }
            }
        }
        protected void LlenarGridTecnico()
        {
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Tecnicos"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                GridViewTecnicos.DataSource = dt;
                                GridViewTecnicos.DataBind();
                            }
                        }
                    }
                }
            }
        }
        protected void LlenarGridEquipos()
        {
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Equipos"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                GridViewEquipos.DataSource = dt;
                                GridViewEquipos.DataBind();
                            }
                        }
                    }
                }
            }
        }

        protected void BAgregar_Click(object sender, EventArgs e)
        {
            int usuarioID;
            string nombre = NameTextBox.Text;
            string correo = AddressTextBox.Text;
            int telefono;

            if (!int.TryParse(IDTextBox.Text, out usuarioID))
            {
                Response.Write("<script>alert('El ID del usuario debe ser un número válido.');</script>");
                return;
            }
            //Validaciones para comprobar que el #telefono si sea un numero o dato valido
            if (!int.TryParse(TelefonoTextBox.Text, out telefono))
            {
                Response.Write("<script>alert('El teléfono debe ser un número válido.');</script>");
                return;
            }

            int resultado = CapaLogica.Usuarios.AgregarUsuarios(usuarioID, nombre, correo, telefono);

            if (resultado > 0)
            {

                Response.Write("<script>alert('Usuario agregado exitosamente.');</script>");

                LlenarGrid();


                IDTextBox.Text = "";
                NameTextBox.Text = "";
                AddressTextBox.Text = "";
                TelefonoTextBox.Text = "";
            }
            else
            {
       
                Response.Write("<script>alert('Ocurrió un error al agregar el usuario. Verifique los datos.');</script>");
            }
        }

        protected void BorrarB_Click(object sender, EventArgs e)
        {
            int usuarioID;

            if (!int.TryParse(IDTextBox.Text, out usuarioID))
            {
                Response.Write("<script>alert('El ID del usuario debe ser un número válido.');</script>");
                return;
            }

            int resultado = CapaLogica.Usuarios.EliminarUsuario(usuarioID);

            if (resultado > 0)
            {
    
                Response.Write("<script>alert('Usuario eliminado exitosamente.');</script>");
                 // Cada vez que se realice un cambio se actualizara la tabla
                LlenarGrid();

                IDTextBox.Text = "";
            }
            else
            {
                // Mostramos un mensaje de error
                Response.Write("<script>alert('Ocurrió un error al eliminar el usuario. Verifique el ID.');</script>");
            }

        }
        protected void TecBAgregar_Click(object sender, EventArgs e)
        {
            int TecnicoID;
            string NombreTecnicos = NameTecTextBox.Text;
            string Especialidad = EspecialidadTextBox.Text;

            // Validamos que el ID sea un # valido
            if (!int.TryParse(IDTecTextBox.Text, out TecnicoID))
            {
                Response.Write("<script>alert('El ID del tecnico debe ser un número válido.');</script>");
                return;
            }

            // Llamamos al metodo para agregar los datos a la base de datos
            int resultado = CapaLogica.Tecnicos.AgregarTecnicos(TecnicoID, NombreTecnicos, Especialidad);

            if (resultado > 0)
            {

                Response.Write("<script>alert('Tecnico agregado exitosamente.');</script>");

                LlenarGridTecnico();


                IDTecTextBox.Text = "";
                NameTecTextBox.Text = "";
                EspecialidadTextBox.Text = "";
            }
            else
            {

                Response.Write("<script>alert('Ocurrió un error al agregar al tecnico. Verifique los datos.');</script>");
            }
        }
        protected void TecBorrarB_Click(object sender, EventArgs e) /**/
        {
            int TecnicoID;

        
            if (!int.TryParse(IDTecTextBox.Text, out TecnicoID))
            {
                Response.Write("<script>alert('El ID del tecnico debe ser un número válido.');</script>");
                return;
            }

            int resultado = CapaLogica.Tecnicos.borrar_tecnico(TecnicoID);

            if (resultado > 0)
            {
                Response.Write("<script>alert('Tecnico eliminado exitosamente.');</script>");

                LlenarGridTecnico();

                IDTecTextBox.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Ocurrió un error al eliminar al tecnico. Verifique el ID.');</script>");
            }
        }
        protected void EquiBAgregar_Click(object sender, EventArgs e)
        {
            // Debido a errores buscamos directamente los datos recuperando la informacion
            int EquipoID;
            string TipoEquipo = TipoEquipoTextBox.Text;
            string Modelo = ModeloTextBox.Text;

            // Validamos que el ID sea el correcto o sea un # invalido
            if (!int.TryParse(IDEquipoTextBox.Text, out EquipoID))
            {
                Response.Write("<script>alert('El ID del Equipo debe ser un número válido.');</script>");
                return;
            }

            // Llamamos al metodo necesario para agregar los datos
            int resultado = CapaLogica.Equipos.IngresarEquipo(EquipoID, TipoEquipo, Modelo);

            if (resultado > 0)
            {

                Response.Write("<script>alert('Equipo agregado exitosamente.');</script>");

                LlenarGridEquipos();

                /*Limpiamos los textbox*/
                IDEquipoTextBox.Text = "";
                TipoEquipoTextBox.Text = "";
                ModeloTextBox.Text = "";
            }
            else
            {
                /*En caso de no ser ninguno de los posibles otros casos dara error*/
                Response.Write("<script>alert('Ocurrió un error al agregar el equipo al sistema. Verifique los datos.');</script>");
            }
        }
        protected void EquiBBorrar_Click(object sender, EventArgs e) /*Creamos la clase para borrar mediante el boton EquiBBorrar*/
        {
            int EquipoID;

            // Validamos que el ID sea el correcto o sea un # invalido
            if (!int.TryParse(IDEquipoTextBox.Text, out EquipoID))
            {
                Response.Write("<script>alert('El ID del Equipo debe ser un número válido.');</script>");
                return;
            }

            int resultado = CapaLogica.Equipos.BorrarEquipo(EquipoID);

            if (resultado > 0)
            {
                Response.Write("<script>alert('Equipo eliminado exitosamente.');</script>");

                LlenarGridEquipos();

                IDEquipoTextBox.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Ocurrió un error al eliminar el Equipo del sistema. Verifique el ID.');</script>");
            }
        }
    }
}
    
    
