using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validate inputs or textboxes in the webform 
            //i.e textbox shoudln't be empty
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.WebForms;
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
                                            "OB-GYN (Gynecologist)",
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

                neighbourhoodDDL.DataSource = neighbourhoods;
                DropDownListSpeciality.DataSource = specialities;

                neighbourhoodDDL.DataBind();
                DropDownListSpeciality.DataBind();


                cityDropDown.DataSource = cities;
                cityDropDown.DataBind();

            }
            DropDownListSpeciality.Items[0].Attributes.Add("disabled", "disabled");
            cityDropDown.Items[0].Attributes.Add("disabled", "disabled");
            neighbourhoodDDL.Items[0].Attributes.Add("disabled", "disabled");

            //***** LOG IN *****

            //here the form postedback its contents in Form[] array .. 
            //we can access it through index or string_index
            //form postback method is important 
            if (!string.IsNullOrEmpty(Request.Form["lgINUserName"]) && !string.IsNullOrEmpty(Request.Form["lgINPASS"]))
            {

                //string x = Request.Form[0];
                string lgUSER1 = Request.Form["lgINUserName"]; //entering lgINUserName textboxt which was sent by form
                string lgPass1 = Request.Form["lgINPASS"];
                //screen alert like javascript
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted " + lgUSER1 + " Successfully')", true);
                
                //check if username is admin user if so go to the admin page
                if (lgPass1 == "0126603725" && lgUSER1 == "admin")
                    Response.Redirect("admin.aspx");
                else
                {
                    SqlConnection conn = new SqlConnection(@"Data Source=MUHAMMAD-PC\SQLEXPRESS;Initial Catalog=doctorsDB;Integrated Security=True;Pooling=False");
                    //first : check if the user exists
                    conn.Open();
                    string check_user_sql_comm = "select count(*) from doctors where email='" + lgUSER1 + "' ";
                    SqlCommand command = new SqlCommand(check_user_sql_comm, conn);
                    int tmp_check_count = Convert.ToInt32(command.ExecuteScalar().ToString());
                    /*
                     * ExecuteScalar: is going to be the type of query which will be returning a single value.
                     * An example would be selecting a count of the number of active users.

                     * ExecuteReader: gives you a data reader back which will allow you to read all of 
                     * the columns of the results a row at a time. An example would be getting all of 
                     * the information for each user in the system so you could display that information.

                     * ExecuteNonQuery: is any SQL which isn't returning values really, 
                     * but is actually performing some form of work like inserting deleting or modifying something.
                     * An example would be updating a user's personal information in the database.
                     */
                    conn.Close();

                    //if found 
                    if (tmp_check_count == 1)
                    {
                        conn.Open();
                        string checkPassword = "select pswD from doctors where email='" + lgUSER1 + "' ";
                        SqlCommand passCoMM = new SqlCommand(checkPassword, conn);
                        string returned_passWord = Convert.ToString(passCoMM.ExecuteScalar().ToString());

                        if (returned_passWord == lgPass1)
                        {
                            Session["New"] = lgUSER1;
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Log in successfully!. Welcome " + lgUSER1 + "! :)')", true);
                        }
                        else
                        {//pop up message
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password Is incorrect!. " + lgUSER1 + "! :)')", true);

                        }
                        conn.Close();
                    }
                    //if not found
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Username. Please Enter a valid userName')", true);
                    }

                }

            }







        }

        protected void TextBoxPass_TextChanged(object sender, EventArgs e)
        {
            // RangeValidator1.ErrorMessage = "";
            // CompareValidator1.ErrorMessage = "";
            // RequiredFieldValidator3.ErrorMessage = "";
        }



        //****** Registration *******
        protected void rgstrBTN_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection(@"Data Source=MUHAMMAD-PC\SQLEXPRESS;Initial Catalog=doctorsDB;Integrated Security=True;Pooling=False");
                conn.Open();
                string insert = "insert into doctors (fname,lname,Addrss,City,neighbourhood,email,speciality,phone,pswD) values (@FNAME,@LNAME,@ADRS,@CITY,@NEIGHB,@EMAIL,@SPECIALITY,@PHONE,@PSWD)";
                SqlCommand command = new SqlCommand(insert, conn);

                //replacing the "@Text" with some values from the text boxes 
                command.Parameters.AddWithValue("@FNAME", FNAMEinp.Value.ToString());
                command.Parameters.AddWithValue("@LNAME", LNAMEinp.Value.ToString());
                command.Parameters.AddWithValue("@ADRS", Addrss_TxtBox.Text.ToString());
                command.Parameters.AddWithValue("@CITY", cityDropDown.SelectedItem.Text.ToString());
                command.Parameters.AddWithValue("@NEIGHB", neighbourhoodDDL.SelectedItem.Text.ToString());
                command.Parameters.AddWithValue("@EMAIL", MAILinp.Value.ToString());
                command.Parameters.AddWithValue("@SPECIALITY", DropDownListSpeciality.SelectedItem.Text.ToString());
                command.Parameters.AddWithValue("@PHONE", phoneTXT.Text.ToString());
                command.Parameters.AddWithValue("@PSWD", TextBoxPass.Text.ToString());

                command.ExecuteNonQuery();
                Response.Redirect("Home Page Drs_Users.aspx");
                Response.Write("Regestration Successfully!");

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());

            }

        }





    }
}