using System;
using MySql.Data.MySqlClient;
using System.Data;

namespace LibreriaWebForms
{
    public partial class Consulta : System.Web.UI.Page
    {
        MySqlConnection cn = new MySqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["cn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarLibros();
        }

        private void CargarLibros(string filtro = "")
        {
            cn.Open();

            string sql = "SELECT * FROM libros";

            if (filtro != "")
                sql += " WHERE titulo LIKE @f OR autor LIKE @f";

            MySqlCommand cmd = new MySqlCommand(sql, cn);

            if (filtro != "")
                cmd.Parameters.AddWithValue("@f", "%" + filtro + "%");

            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            cn.Close();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarLibros(txtBuscar.Text.Trim());
        }
    }
}
