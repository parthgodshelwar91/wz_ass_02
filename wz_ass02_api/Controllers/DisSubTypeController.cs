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
    public class DisSubTypeController : ApiController
    {
        // GET api/<controller>
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["webapi_con"].ConnectionString);
        DisSubType SubTypes = new DisSubType();
        // GET api/<controller>
        public List<DisSubType> Get()
        {
            SqlDataAdapter da = new SqlDataAdapter("sp_par_disSubType", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<DisSubType> lstsubtype = new List<DisSubType>();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DisSubType SubType = new DisSubType();
                    string stdata = dt.Rows[i]["SubType"].ToString();
                    if (stdata == "")
                    {
                        stdata = "none";
                        SubType.subtype = stdata;
                    }
                    else
                    {
                        SubType.subtype = stdata;
                    }
                    //SubType.subtype = dt.Rows[i]["SubType"].ToString();
                    lstsubtype.Add(SubType);
                }
            }
            if (lstsubtype.Count > 0)
            {
                return lstsubtype;
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