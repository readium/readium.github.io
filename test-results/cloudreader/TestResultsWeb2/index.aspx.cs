using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TestResultsWeb2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GridView1.DataBind();

            string connectionString = "";
            string getExcelSheetName = "";
            //get array of files from Github repo folder         
            //string[] files = Directory.GetFiles(@"C:\Users\walkd\Documents\GitHub\ReadiumTestResults_v4.0\TestResultsWeb2\App_Data");
            string[] files = Directory.GetFiles(@"H:\Readium\Readium-test-files\test-results\cloudreader\spreadsheets\test-results\cloudreader\spreadsheets");
            if (files.Length == 0)
            {
                Response.Write("no files in folder");
            }
            else
            {
                //create datatable and header columns for datatable
                DataTable dtExcelFileRecords = new DataTable();
                DataTable dtExcelRecords = new DataTable();
                dtExcelRecords.Columns.Add("Tester");
                dtExcelRecords.Columns.Add("Date");
                dtExcelRecords.Columns.Add("CR Version");
                dtExcelRecords.Columns.Add("Device");
                dtExcelRecords.Columns.Add("OS");
                dtExcelRecords.Columns.Add("Locale");
                dtExcelRecords.Columns.Add("Browser");
                dtExcelRecords.Columns.Add("Score");
                dtExcelRecords.Columns.Add("View");

                //loop through each file in folder and parse data, thereby populating gridview1
                foreach (string fileName in files)
                {
                    //  set file extension, fileName and fileLocation
                    string fileExtension = Path.GetExtension(@"H:\Readium\Readium-test-files\test-results\cloudreader\spreadsheets\test-results\cloudreader\spreadsheets" + fileName);
                    string fName = Path.GetFileName(fileName);
                    string fileLocation = @"H:\Readium\Readium-test-files\test-results\cloudreader\spreadsheets\test-results\cloudreader\spreadsheets" + fileName;

                    if (fileExtension == ".xls")
                    {
                        connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                      fileName + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (fileExtension == ".xlsx")
                    {
                        connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
                      fileName + ";Extended Properties=\"Excel 12.0;HDR=No;IMEX=2\"";
                    }

                    //establish connection to excel
                    OleDbConnection con = new OleDbConnection(connectionString);
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);

                    try
                    {
                        con.Open();
                        DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                        getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();

                        cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
                        dAdapter.SelectCommand = cmd;
                        dtExcelFileRecords.Clear();
                        dAdapter.Fill(dtExcelFileRecords);

                        if (dtExcelFileRecords.Rows[15][3].ToString() == "")
                        {
                            string tester = dtExcelFileRecords.Rows[5][3].ToString();
                            string date = dtExcelFileRecords.Rows[8][3].ToString();
                            string crVersion = dtExcelFileRecords.Rows[10][3].ToString();
                            string device = dtExcelFileRecords.Rows[16][3].ToString();
                            string os = dtExcelFileRecords.Rows[18][3].ToString();
                            string locale = dtExcelFileRecords.Rows[19][3].ToString();
                            string browser = dtExcelFileRecords.Rows[20][3].ToString();
                            string score = dtExcelFileRecords.Rows[37][2].ToString();

                            string link = ("http://readium.github.io/test-results/cloudreader/spreadsheets/" + fName).ToString();

                            string[] row = new string[] { tester, date, crVersion, device, os, locale, browser, score, link };
                            dtExcelRecords.Rows.Add(row);
                        }
                        else
                        {
                            string tester = dtExcelFileRecords.Rows[5][3].ToString();
                            string date = dtExcelFileRecords.Rows[8][3].ToString();
                            string crVersion = dtExcelFileRecords.Rows[10][3].ToString();
                            string device = dtExcelFileRecords.Rows[17][3].ToString();
                            string os = dtExcelFileRecords.Rows[19][3].ToString();
                            string locale = dtExcelFileRecords.Rows[20][3].ToString();
                            string browser = dtExcelFileRecords.Rows[21][3].ToString();
                            string score = dtExcelFileRecords.Rows[38][2].ToString();

                            string link = ("http://readium.github.io/test-results/cloudreader/spreadsheets/" + fName).ToString();

                            string[] row = new string[] { tester, date, crVersion, device, os, locale, browser, score, link };
                            dtExcelRecords.Rows.Add(row);
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("{0} Exception caught.", ex);
                    }

                    GridView1.DataSource = dtExcelRecords;
                    GridView1.DataBind();
                }
            }
        }
        /// <summary>
        /// Handles the RowDataBound event of the grdStudent control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewRowEventArgs"/> instance containing the event data.</param>
        //public void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {

        //        HyperLink link = (HyperLink)e.Row.FindControl("hl");
        //        link.Text = "Download!";
        //        link.NavigateUrl = "http://readium.github.io/test-results/cloudreader/spreadsheets/spreadsheets/" + e.Row.DataItem;
        //        e.Row.Cells[0].Controls.Add(link);
        //        GridView1.Controls.Add(link);

        //        //HyperLink hl = (HyperLink)e.Row.FindControl("HyperLink2");
        //        //hl.NavigateUrl = "http://readium.github.io/test-results/cloudreader/spreadsheets/spreadsheets/" + this.fileName;
        //        //hl.Text = "Click to View";
        //    }
        //}
        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        if (Path.GetExtension(FileUpload1.PostedFile.FileName) == ".xls" || Path.GetExtension(FileUpload1.PostedFile.FileName) == ".xlsx")
        //        {
        //            String fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //            String fileLocation = Server.MapPath("~/App_Data/" + fileName);
        //            FileUpload1.SaveAs(fileLocation);
        //            System.Windows.Forms.MessageBox.Show("File: " + fileName + " has been uploaded to the site.");
        //        }
        //        else System.Windows.Forms.MessageBox.Show("No Excel file was selected.");
        //    }

        //}
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex; //change page index
            GridView1.DataBind();  // get the data source and bind it again
        }
    }
}