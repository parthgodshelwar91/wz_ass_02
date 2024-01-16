using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace wz_ass02_api.Models
{
    public class IssueTbl
    {
        public int IssueID { get; set; }
        public string Summary { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string SubType { get; set; }
        public string Status { get; set; }
        public string Priority { get; set; }
        public string Severity { get; set; }
    }
}