using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Prueba
{
    public partial class Form1 : Form
    {
        SqlDataAdapter adapter; DataTable tabCarrera; SqlConnection conexion;

        public Form1()
        {
            InitializeComponent();
            
            String url = "Data Source = 3.128.144.165; Initial Catalog = DB2202601VS; User ID = db2; Password = 123";

            conexion = new SqlConnection(url);
            adapter = new SqlDataAdapter();
            tabCarrera = new DataTable();

            adapter.SelectCommand = new SqlCommand("spCarreraSelect", conexion); adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            adapter.InsertCommand = new SqlCommand(); adapter.InsertCommand.CommandText = "spCarreraInsert";
            adapter.InsertCommand.Connection = conexion; adapter.InsertCommand.CommandType = CommandType.StoredProcedure;
            adapter.InsertCommand.Parameters.Add("@carreraid", SqlDbType.Int, 4, "carreraid");
            adapter.InsertCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 50, "nombre");
            adapter.InsertCommand.Parameters.Add("director", SqlDbType.VarChar, 50, "director");
            adapter.InsertCommand.Parameters["@carreraid"].Direction = ParameterDirection.InputOutput;

            adapter.UpdateCommand = new SqlCommand("spCarreraUpdate", conexion); adapter.UpdateCommand.CommandType = CommandType.StoredProcedure;
            adapter.UpdateCommand.Parameters.Add("@car", SqlDbType.Int, 4, "carreraid");
            adapter.UpdateCommand.Parameters.Add("@nom", SqlDbType.VarChar, 50, "nombre");
            adapter.UpdateCommand.Parameters.Add("@dir", SqlDbType.VarChar, 50, "director");

            adapter.DeleteCommand = new SqlCommand("spCarreraDelete", conexion); adapter.DeleteCommand.CommandType = CommandType.StoredProcedure;
            adapter.DeleteCommand.Parameters.Add("@carreraid", SqlDbType.Int, 4, "carreraid");
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                adapter.Fill(tabCarrera); dataGridView1.DataSource = tabCarrera; dataGridView1.Columns[0].ReadOnly = true;
                dataGridView1.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {

        }
        private void cmdSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                adapter.Update(tabCarrera);
                MessageBox.Show("Datos actualizados correctamente", "Confirmacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
