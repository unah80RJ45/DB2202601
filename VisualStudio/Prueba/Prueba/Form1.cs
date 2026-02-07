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
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                String url = "Server = 3.128.144.165; DataBase = DB2202601; UID = db2; PWD = 123";
                SqlConnection conexion = new SqlConnection(url);
                SqlDataAdapter adapter = new SqlDataAdapter("spFactura", conexion);
                DataTable tabFactura = new DataTable();
               
                if (chkCiudad.Checked)
                    adapter.SelectCommand.Parameters.AddWithValue("@ciudad", txtCodigo.Text);
                else
                    adapter.SelectCommand.Parameters.AddWithValue("@cliente", txtCodigo.Text);

                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                adapter.Fill(tabFactura);
                dataGridView1.DataSource = tabFactura;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
