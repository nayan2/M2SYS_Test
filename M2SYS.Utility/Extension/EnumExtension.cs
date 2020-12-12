using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace M2SYS.Utility.Extension
{
    public static class EnumExtension
    {
        public static List<KeyValuePair<int, string>> GetKeyValues(Type enumType)
        {
            try
            {
                var data = new List<KeyValuePair<int, string>>();
                if (enumType.IsEnum)
                {
                    data.AddRange(from object e in enumType.GetEnumValues() let val = GetDescription(enumType, e.ToString()) select new KeyValuePair<int, string>(Convert.ToInt32(e), val ?? string.Join(" ", Regex.Split(e.ToString() ?? string.Empty, @"([A-Z]?[a-z]+)").Where(str => !string.IsNullOrEmpty(str)))));
                    return data;
                }
                return null;
            }
            catch (Exception e)
            {
                throw new Exception("Invalid Enum", e);
            }
        }

        public static string GetDescription(Type enumType, string name)
        {
            var filedName = enumType.GetFields().FirstOrDefault(x => x.Name == name);
            if (filedName == null) return null;
            
            var attr = Attribute.GetCustomAttribute(filedName, typeof(DescriptionAttribute)) as DescriptionAttribute;
            return attr?.Description;
        }
    }
}