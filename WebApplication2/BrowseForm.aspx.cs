using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data.Sql;
using System.Data;


namespace WebApplication2
{
    public partial class BrowseForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {

                string[] cities = {
                                      "Select your City..",
                                      "Cairo",
                                      "Giza",
                                      "Alexandria",
                                      "Mansoura",
                                      "Aswan"
                                  };


                string[] specialities = {
                                            "Choose Speciality..",
                                            "Primary Care",
                                            "OB-GYN",
                                            "Dermataologist",
                                            "Dentist",
                                            "Ear,Nose and Throat",
                                            "Eye Doctor",
                                            "Psychiatrist",
                                            "Orthopedic Surgeon",
                                            "Rheumatologist",
                                            "Plastic Surgeon",
                                            "Oncologist"
                                        };


                string[] neighbourhoods = {
                                              "Select neighbourhood",
                                              "6th-of-October",
                                              "Abbasia",
                                              "Dokki",
                                              "Manial",
                                              "Maadi",
                                              "Heliopolis",
                                              "Nasr City",
                                              "El-Zamalek",
                                              "New Cairo",
                                              "El-Rehab",
                                              "Ain Shams",
                                              "Shorouk City"
                                          };

                ddlNeighbourhood.DataSource = neighbourhoods;
                ddlSpeciality.DataSource = specialities;

                ddlNeighbourhood.DataBind();
                ddlSpeciality.DataBind();


                ddlCity.DataSource = cities;
                ddlCity.DataBind();

                ddlSpeciality.Items[0].Attributes.Add("disabled", "disabled");
                ddlCity.Items[0].Attributes.Add("disabled", "disabled");
                ddlNeighbourhood.Items[0].Attributes.Add("disabled", "disabled");
            }
         


        }

       
        protected void browseBTN_CLick(object sender, EventArgs e)
        {
            string spec, city, neigh;
            spec = ddlSpeciality.SelectedItem.Text;
            city = ddlCity.SelectedItem.Text;
            neigh = ddlNeighbourhood.SelectedItem.Text;

            
            SqlConnection conn = new SqlConnection(@"Data Source=MUHAMMAD-PC\SQLEXPRESS;Initial Catalog=doctorsDB;Integrated Security=True;Pooling=False");

            string selec_comm = "select * from doctors where speciality=@spec and City=@city ;";
            SqlCommand sqlcom = new SqlCommand(selec_comm, conn);
            sqlcom.Parameters.AddWithValue("@spec", spec);
            sqlcom.Parameters.AddWithValue("@city", city);
            sqlcom.Parameters.AddWithValue("@neigh", neigh);

            //string x = "where speciality=@spec and City=@city and neighbourhood=@neigh";
            conn.Open();
            SqlDataReader dbReader;
            dbReader = sqlcom.ExecuteReader(CommandBehavior.CloseConnection);
            
            DataTable dt = new DataTable();
            dt.Load(dbReader);

            //hint to test store all datareader value in datatable and then send it to another page in session variable
            
            //string y = dt.Rows[0][2].ToString();
            
            Session["datatable"] = dt;
            
            conn.Close();
            Response.Redirect("Browss_Results.aspx");
        }

        




    }
}