using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace wz_ass02_api.Controllers
{
    public class UpdateIssueController : ApiController
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        
        [Route("api/UpdateIssue")]
        [HttpGet, HttpPost]
        public IHttpActionResult Put(string Type, string SubType, string Status, string ReportedBy, string ReportedDate, string IssueIDS)
        {
            


            SqlCommand cmd = new SqlCommand("sp_par_IB_UpdateIssue", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.Add("@ReturnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.AddWithValue("@IssueIDS", IssueIDS);
            cmd.Parameters.AddWithValue("@Type", Type);
            cmd.Parameters.AddWithValue("@SubType", SubType);
            cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@ReportedBy", ReportedBy);
            cmd.Parameters.AddWithValue("@ReportedDate", ReportedDate);
            int returnValue = 0;
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                returnValue = (int)cmd.Parameters["@ReturnValue"].Value;
            }



            return Ok();
        }

        // DELETE: api/UpdateIssue/5
        public void Delete(int id)
        {
        }
    }
}