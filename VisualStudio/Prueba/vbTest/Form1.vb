Imports System.Data.SqlClient
Imports System.Security.Policy

Public Class Form1
    Dim adapter As SqlDataAdapter
    Dim conexion As SqlConnection
    Dim tabCarrera As DataTable

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        Dim url As String = "Data Source = 3.128.144.165; Initial Catalog = DB2202601VS; User ID = db2; Password = 123"

        conexion = New SqlConnection(url)
        adapter = New SqlDataAdapter
        tabCarrera = New DataTable

        adapter.SelectCommand = New SqlCommand("spCarreraSelect", conexion)
        adapter.SelectCommand.CommandType = CommandType.StoredProcedure

        adapter.InsertCommand = New SqlCommand
        adapter.InsertCommand.CommandText = "spCarreraInsert"
        adapter.InsertCommand.Connection = conexion
        adapter.InsertCommand.CommandType = CommandType.StoredProcedure
        adapter.InsertCommand.Parameters.Add("@carreraid", SqlDbType.Int, 4, "carreraid")
        adapter.InsertCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 50, "nombre")
        adapter.InsertCommand.Parameters.Add("director", SqlDbType.VarChar, 50, "director")
        adapter.InsertCommand.Parameters("@carreraid").Direction = ParameterDirection.InputOutput

        adapter.UpdateCommand = New SqlCommand("spCarreraUpdate", conexion)
        adapter.UpdateCommand.CommandType = CommandType.StoredProcedure
        adapter.UpdateCommand.Parameters.Add("@car", SqlDbType.Int, 4, "carreraid")
        adapter.UpdateCommand.Parameters.Add("@nom", SqlDbType.VarChar, 50, "nombre")
        adapter.UpdateCommand.Parameters.Add("@dir", SqlDbType.VarChar, 50, "director")

        adapter.DeleteCommand = New SqlCommand("spCarreraDelete", conexion)
        adapter.DeleteCommand.CommandType = CommandType.StoredProcedure
        adapter.DeleteCommand.Parameters.Add("@carreraid", SqlDbType.Int, 4, "carreraid")
    End Sub
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            adapter.Fill(tabCarrera)
            dataGridView1.DataSource = tabCarrera
            dataGridView1.Columns(0).ReadOnly = True

            dataGridView1.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub

    Private Sub cmdSalvar_Click(sender As Object, e As EventArgs) Handles cmdSalvar.Click
        Try
            adapter.Update(tabCarrera)
            MsgBox("Datos actualizados correctamente", MsgBoxStyle.Information, "Confirmacion")
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub
End Class
