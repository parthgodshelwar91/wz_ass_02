using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using wz_ass02_api.Models;
//using wz_ass02_api.Models.Projec

namespace wz_ass02_api.Controllers
{
    public class ValuesController : ApiController
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        Projects proj = new Projects();
        // GET api/<controller>
        public List<Projects> GetAll()
        {
            SqlDataAdapter da = new SqlDataAdapter("sp_par_product", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            List< Projects > lstproj = new List<Projects>();
            if(dt.Rows.Count > 0)
            {
                for(int i=0; i<dt.Rows.Count; i++)
                {
                    Projects proj = new Projects();
                    proj.ProjectName = dt.Rows[i]["ProjectName"].ToString();
                    proj.ProjectId = Convert.ToInt32(dt.Rows[i]["ProjectId"].ToString());
                    lstproj.Add(proj);
                }
            }
            if(lstproj.Count > 0)
            {
                return lstproj;
            }
            else
            {
                return null;
            }
        }

        // GET api/<controller>/5
        IssueTbl tbl = new IssueTbl();
        public List<IssueTbl> Get(int id)
        {
            
            SqlDataAdapter da = new SqlDataAdapter("sp_par_distbl_by_id", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@ProjectID", id);
            DataTable dt = new DataTable();            
            da.Fill(dt);
            List<IssueTbl> lsttbl = new List<IssueTbl>();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    IssueTbl tbl = new IssueTbl();
                    tbl.IssueID = Convert.ToInt32(dt.Rows[i]["IssueID"]);
                    //proj.ProjectName = dt.Rows[i]["ProjectName"].ToString();
                    tbl.Summary = (dt.Rows[i]["Summary"].ToString());
                    tbl.Description = dt.Rows[i]["Description"].ToString();
                    tbl.Type = dt.Rows[i]["Type"].ToString();
                    tbl.SubType = dt.Rows[i]["SubType"].ToString();
                    tbl.Status = dt.Rows[i]["Status"].ToString();
                    tbl.Priority = dt.Rows[i]["Priority"].ToString();
                    tbl.Severity = dt.Rows[i]["Severity"].ToString();
                    lsttbl.Add(tbl);

                }
                
            }
            if (lsttbl.Count > 0)
            {
                return lsttbl;
            }
            else
            {
                return null;
            }


        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}