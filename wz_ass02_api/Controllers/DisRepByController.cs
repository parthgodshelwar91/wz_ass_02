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

namespace wz_ass02_api.Controllers
{
    public class DisRepByController : ApiController
    {
        // GET api/<controller>
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        DisRepBy EmpName = new DisRepBy();
        // GET api/<controller>
        public List<DisRepBy> Get()
        {

            SqlDataAdapter da = new SqlDataAdapter("sp_par_disRepBy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<DisRepBy> lstemp = new List<DisRepBy>();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DisRepBy EmpName = new DisRepBy();
                    string empdata = dt.Rows[i]["EmployeeName"].ToString();
                    if (empdata == "")
                    {
                        empdata = "none";
                        EmpName.EmployeeName = empdata;
                    }
                    else
                    {
                        EmpName.EmployeeName = empdata;
                    }


                    lstemp.Add(EmpName);
                }
            }
            if (lstemp.Count > 0)
            {
                return lstemp;
            }
            else
            {
                return null;
            }
        }

            // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
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