using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public class Util
    {
        public string NewGuid()
        {
            var g = Guid.NewGuid();
            var p = Convert.ToBase64String(g.ToByteArray());
            p = p.Replace("=", "");
            p = p.Replace("+", "");

            return p;
        }

        public string MD5Hash(string input)
        {
            if (input == null) input = string.Empty;
            var md5Hash = MD5.Create();
            // Convert the input string to a byte array and compute the hash. 
            var data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            var sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            foreach (var t in data)
            {
                sBuilder.Append(t.ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }


        public string OTPNumber()
        {
            var rnd = new Random();
            var s1 = rnd.Next(0, 9);
            var s2 = rnd.Next(0, 9);
            var s3 = rnd.Next(0, 9);
            var s4 = rnd.Next(0, 9);
            var s5 = rnd.Next(0, 9);
            var s6 = rnd.Next(0, 9);

            return s1 + s2.ToString() + s3 + s4 + s5 + s6;
        }
    }
}
