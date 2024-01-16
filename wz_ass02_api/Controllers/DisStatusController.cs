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
    public class DisStatusController : ApiController
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        DisStatus DisStat = new DisStatus();
        // GET api/<controller>
        public List<DisStatus> Get()
        {

            SqlDataAdapter da = new SqlDataAdapter("sp_par_disStatus", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<DisStatus> lststat = new List<DisStatus>();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DisStatus SubStat = new DisStatus();
                    string statdata = dt.Rows[i]["Status"].ToString();
                    if (statdata == "")
                    {
                        statdata = "none";
                        SubStat.status = statdata;
                    }
                    else
                    {
                        SubStat.status = statdata;
                    }
                    
                    
                    lststat.Add(SubStat);
                }
            }
            if (lststat.Count > 0)
            {
                return lststat;
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