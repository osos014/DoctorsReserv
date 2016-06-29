using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
 

namespace WebApplication2
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void mydatagridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = mydatagridview.SelectedIndex;

            TextBox1.Text = mydatagridview.Rows[index].Cells[2].Text.ToString();
            TextBox2.Text = mydatagridview.Rows[index].Cells[3].Text.ToString();
            TextBox3.Text = mydatagridview.Rows[index].Cells[4].Text.ToString();
            TextBox4.Text = mydatagridview.Rows[index].Cells[5].Text.ToString();
            TextBox5.Text = mydatagridview.Rows[index].Cells[6].Text.ToString();
            TextBox6.Text = mydatagridview.Rows[index].Cells[7].Text.ToString();
            TextBox7.Text = mydatagridview.Rows[index].Cells[8].Text.ToString();
            TextBox8.Text = mydatagridview.Rows[index].Cells[9].Text.ToString();

        }

      
        protected void Button3_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Row Inserted ! :)')", true);

            SqlConnection conn = new SqlConnection(@"Data Source=MUHAMMAD-PC\SQLEXPRESS;Initial Catalog=doctorsDB;Integrated Security=True;Pooling=False");
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "insert into doctors (fname,lname,Addrss,City,neighbourhood,email,speciality,phone,pswD) values (@FNAME,@LNAME,@ADRS,@CITY,@NEIGHB,@EMAIL,@SPECIALITY,@PHONE,@PSWD)";
            
            command.Parameters.AddWithValue("@FNAME", TextBox1.Text.ToString());
            command.Parameters.AddWithValue("@LNAME", TextBox2.Text.ToString());
            command.Parameters.AddWithValue("@ADRS", TextBox3.Text.ToString());
            command.Parameters.AddWithValue("@CITY", TextBox4.Text.ToString());
            command.Parameters.AddWithValue("@NEIGHB", TextBox5.Text.ToString());
            command.Parameters.AddWithValue("@EMAIL", TextBox6.Text.ToString());
            command.Parameters.AddWithValue("@SPECIALITY", TextBox7.Text.ToString());
            command.Parameters.AddWithValue("@PHONE", TextBox8.Text.ToString());
            command.Parameters.AddWithValue("@PSWD", TextBox9.Text.ToString());

            command.ExecuteNonQuery();

            conn.Close();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}