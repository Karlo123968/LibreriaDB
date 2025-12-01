using System;
using MySql.Data.MySqlClient;

namespace LibreriaWebForms
{
    public partial class Alta : System.Web.UI.Page
    {
        MySqlConnection cn = new MySqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["cn"].ConnectionString);

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                string query = "INSERT INTO libros(titulo, autor, editorial, anio, genero, precio, existencias) " +
                               "VALUES(@titulo, @autor, @editorial, @anio, @genero, @precio, @existencias)";

                MySqlCommand cmd = new MySqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@titulo", txtTitulo.Text);
                cmd.Parameters.AddWithValue("@autor", txtAutor.Text);
                cmd.Parameters.AddWithValue("@editorial", txtEditorial.Text);
                cmd.Parameters.AddWithValue("@anio", txtAnio.Text);
                cmd.Parameters.AddWithValue("@genero", txtGenero.Text);
                cmd.Parameters.AddWithValue("@precio", txtPrecio.Text);
                cmd.Parameters.AddWithValue("@existencias", txtExistencias.Text);

                cmd.ExecuteNonQuery();
                lblMensaje.Text = "Libro agregado correctamente";

                cn.Close();
            }
            catch (Exception ex)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Error: " + ex.Message;
            }
        }
    }
}
