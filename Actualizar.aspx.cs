using System;
using MySql.Data.MySqlClient;

namespace LibreriaWebForms
{
    public partial class Actualizar : System.Web.UI.Page
    {
        MySqlConnection cn = new MySqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["cn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarLibros();
        }

        private void CargarLibros()
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT id, titulo FROM libros", cn);
            MySqlDataReader dr = cmd.ExecuteReader();

            ddlLibros.DataSource = dr;
            ddlLibros.DataTextField = "titulo";
            ddlLibros.DataValueField = "id";
            ddlLibros.DataBind();

            cn.Close();
        }

        protected void ddlLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM libros WHERE id=@id", cn);
            cmd.Parameters.AddWithValue("@id", ddlLibros.SelectedValue);
            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtTitulo.Text = dr["titulo"].ToString();
                txtAutor.Text = dr["autor"].ToString();
                txtEditorial.Text = dr["editorial"].ToString();
                txtAnio.Text = dr["anio"].ToString();
                txtGenero.Text = dr["genero"].ToString();
                txtPrecio.Text = dr["precio"].ToString();
                txtExistencias.Text = dr["existencias"].ToString();
            }

            cn.Close();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            cn.Open();

            string sql = @"UPDATE libros SET 
                titulo=@titulo, autor=@autor, editorial=@editorial,
                anio=@anio, genero=@genero, precio=@precio, existencias=@existencias
                WHERE id=@id";

            MySqlCommand cmd = new MySqlCommand(sql, cn);

            cmd.Parameters.AddWithValue("@titulo", txtTitulo.Text);
            cmd.Parameters.AddWithValue("@autor", txtAutor.Text);
            cmd.Parameters.AddWithValue("@editorial", txtEditorial.Text);
            cmd.Parameters.AddWithValue("@anio", txtAnio.Text);
            cmd.Parameters.AddWithValue("@genero", txtGenero.Text);
            cmd.Parameters.AddWithValue("@precio", txtPrecio.Text);
            cmd.Parameters.AddWithValue("@existencias", txtExistencias.Text);
            cmd.Parameters.AddWithValue("@id", ddlLibros.SelectedValue);

            cmd.ExecuteNonQuery();

            cn.Close();

            lblMensaje.Text = "Libro actualizado correctamente.";
        }
    }
}
