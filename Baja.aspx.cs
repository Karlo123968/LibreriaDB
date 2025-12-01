using System;
using MySql.Data.MySqlClient;
using System.Data;

namespace LibreriaWebForms
{
    public partial class Baja : System.Web.UI.Page
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
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM libros", cn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);

                cn.Open();
                MySqlCommand cmd = new MySqlCommand("DELETE FROM libros WHERE id=@id", cn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                cn.Close();

                lblMensaje.Text = "Libro eliminado correctamente.";
                CargarLibros();
            }
        }
    }
}
