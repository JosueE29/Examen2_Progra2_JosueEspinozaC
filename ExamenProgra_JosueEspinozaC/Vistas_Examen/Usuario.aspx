<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ExamenProgra_JosueEspinozaC.Vistas_Examen.Usuario" %>
/
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Catálogo de Usuarios</title>
        <style>
        body {
            font-family: Arial, sans-serif;/*Aplicamos un tipo distinto de fuente a la pagina*/
            background-color: #b3e5fc; /*Aplicamos color a la pagina en este caso Celeste*/
            margin: 0;/*Marcamos el margen y el relleno en 0*/
            padding: 0;
            display: flex;
            justify-content: center; /* Centramos horizontalmente de manera justificada */
            align-items: center; /* Centramos los items de manera alineada */
            min-height: 100vh; /*Aplicamos un valor minimo en la altura el cual es toda la pantalla*/
        }

        .main-container {
            width: 100%; /* Ajustamos el tamaño del main container*/
            display: flex;
            flex-direction: column;
            align-items: center; /* Centramos de manera alineada*/
            gap: 20px;/*Aplicamos un espacio de 20px entre los elementos secundarios de la pagina*/
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 15px auto; /* Centramos horizontalmente */
            width: 90%; /* Ajustamos el ancho al 90% de la ventana */
            max-width: 1200px; /* aplicamos un Ancho máximo */
            text-align: center; /* Alinea el texto al centro para darle mejor estetica a la pagina :D */
        }
        h2 { /*Este apartado solo centra y aplica un valor de 20px entre las etiquetas h2*/
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        .input-field {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            text-align: left;
        }
        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Catálogo de Usuarios</h2>

            <asp:GridView ID="GridView1" CssClass="grid-view" runat="server"></asp:GridView>

            <label for="IDTextBox">ID:</label>
            <asp:TextBox ID="IDTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="NameTextBox">Nombre:</label>
            <asp:TextBox ID="NameTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="AddressTextBox">Correo Electrónico:</label>
            <asp:TextBox ID="AddressTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="TelefonoTextBox">Teléfono:</label>
            <asp:TextBox ID="TelefonoTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <asp:Button ID="BAgregar" runat="server" CssClass="btn" Text="Agregar" OnClick="BAgregar_Click" />
            <asp:Button ID="BorrarB" runat="server" CssClass="btn" Text="Borrar" OnClick="BorrarB_Click" />
        </div>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
            <div class="container">
            <h2>Catálogo de Tecnicos</h2>

            <asp:GridView ID="GridViewTecnicos" CssClass="grid-view" runat="server"></asp:GridView>

            <label for="TecTextBox">ID:</label>
            <asp:TextBox ID="IDTecTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="NameTecTextBox">Nombre:</label>
            <asp:TextBox ID="NameTecTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="EspecialidadTextBox">Especialidad:</label>
            <asp:TextBox ID="EspecialidadTextBox" CssClass="input-field" runat="server"></asp:TextBox>


            <asp:Button ID="TecBAgregar" runat="server" CssClass="btn" Text="Agregar" OnClick="TecBAgregar_Click" />
            <asp:Button ID="TecBorrarB" runat="server" CssClass="btn" Text="Borrar" OnClick="TecBorrarB_Click" />
        </div>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
            <div class="container">
            <h2>Catálogo de Equipos</h2>

            <asp:GridView ID="GridViewEquipos" CssClass="grid-view" runat="server"></asp:GridView>

            <label for="IDEquipoTextBox">ID:</label>
            <asp:TextBox ID="IDEquipoTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="TipoEquipoTextBox ">Nombre:</label>
            <asp:TextBox ID="TipoEquipoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="ModeloTextBox">Modelo:</label>
            <asp:TextBox ID="ModeloTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <asp:Button ID="EquiBAgregar" runat="server" CssClass="btn" Text="Agregar" OnClick="EquiBAgregar_Click" />
            <asp:Button ID="EquiBBorrar" runat="server" CssClass="btn" Text="Borrar" OnClick="EquiBBorrar_Click" />
        </div>
    </form>
</body>
</html>
