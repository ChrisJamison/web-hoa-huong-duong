using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class CustomerEntity
    {
        public int Customer_ID { get; set; }
        [Required]
        public string fullname { get; set; }
        [Required]
        [Phone]
        public string phone { get; set; }
        [Required]
        public string address { get; set; }
        [Required]
        public string province { get; set; }
        [Required]
        public string district { get; set; }
        [Required]
        public string ward { get; set; }

        public DateTime? LastDateAccess { get; set; }
        public string IdentifyCardNumber { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
