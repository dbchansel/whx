using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace DTcms.Web.tools
{
    public class CommonData
    {
        /// <summary>
        /// 返回json格式数据
        /// </summary>
        /// <param name="data">数据</param>
        protected void JsonResult(HttpContext context,object data)
        {
            if (data is DataTable)
            {
                foreach (DataColumn dc in ((DataTable)data).Columns)
                {
                    dc.ColumnName = dc.ColumnName.ToLower();
                }
            }
            else if (data != null && data.GetType().GetProperty("pagedata") != null)
            {
                DataTable dt = (DataTable)data.GetType().GetProperty("pagedata").GetValue(data, null);
                foreach (DataColumn dc in dt.Columns)
                {
                    dc.ColumnName = dc.ColumnName.ToLower();
                }
            }
            IsoDateTimeConverter timeConverter = new IsoDateTimeConverter { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" };
            context.Response.Write(AESEncrypt(JsonConvert.SerializeObject(data, Formatting.Indented, timeConverter)));
            context.Response.End();

        }
        /// <summary>  
        /// AES加密算法  
        /// </summary>  
        /// <param name="input">明文字符串</param>  
        /// <returns>返回加密后的字符串</returns>  
        public static string AESEncrypt(string input)
        {
            string iv = "1234567890000000";//16位    
            string key = "12345678900000001234567890000000"; //32
            byte[] keyBytes = Encoding.UTF8.GetBytes(key.Substring(0, 32));
            using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
            {
                aesAlg.Key = keyBytes;
                aesAlg.IV = Encoding.UTF8.GetBytes(iv.Substring(0, 16));

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(input);
                        }
                        byte[] data = msEncrypt.ToArray();

                        StringBuilder sb = new StringBuilder(data.Length * 3);
                        foreach (byte b in data)
                        {
                            //16进制数字
                            sb.Append(Convert.ToString(b, 16).PadLeft(2, '0'));
                        }
                        return sb.ToString().ToUpper();
                    }
                }
            }
        }

        /// <summary>  
        /// AES解密  
        /// </summary>  
        /// <param name="input">密文字符串</param>  
        /// <returns>返回解密后的字符串</returns>  
        public static string AESDecrypt(string input)
        {
            string iv = "1234567890000000";//16位    
            string key = "12345678900000001234567890000000"; //32
            input = input.Replace(" ", "");
            byte[] inputBytes = new byte[input.Length / 2];
            for (int i = 0; i < input.Length; i += 2)
            {
                inputBytes[i / 2] = (byte)Convert.ToByte(input.Substring(i, 2), 16);
            }
            byte[] keyBytes = Encoding.UTF8.GetBytes(key.Substring(0, 32));
            using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
            {
                aesAlg.Key = keyBytes;
                aesAlg.IV = Encoding.UTF8.GetBytes(iv.Substring(0, 16));

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
                using (MemoryStream msEncrypt = new MemoryStream(inputBytes))
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srEncrypt = new StreamReader(csEncrypt))
                        {
                            return srEncrypt.ReadToEnd();
                        }
                    }
                }
            }
        }
    }
}