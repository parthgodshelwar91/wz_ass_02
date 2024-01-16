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
    public class DisTypeController : ApiController
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        DisType Types = new DisType();
        // GET api/<controller>
        public List<DisType> Get()
        {
            SqlDataAdapter da = new SqlDataAdapter("sp_par_disType", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<DisType> lsttype = new List<DisType>();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DisType Type = new DisType();
                    string tdata = dt.Rows[i]["Type"].ToString();
                    if (tdata == "")
                    {
                        tdata = "none";
                        Type.type = tdata;
                    }
                    else
                    {
                        Type.type = tdata;
                    }                                      
                    
                    lsttype.Add(Type);
                }
            }
            if (lsttype.Count > 0)
            {
                return lsttype;
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