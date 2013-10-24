using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication1
{
    class Program
    {
        static double CADToUSDRate = 1.0;
        static Random random = new Random(77);

        static void Main(string[] args)
        {
            Location();
            CurrencyRate();
            Address();
        }

        private static void Location()
        {
            using (StreamWriter streamWriter = new StreamWriter("c:\\temp\\location.txt", false, Encoding.GetEncoding(1252)))
            {
                for (int i = 0; i < 100; ++i)
                    streamWriter.WriteLine("INSERT INTO Location (Name, CostRate, Availability) VALUES ('Location{0}', 0, 0);", i + 1);
            }
        }

        private static void CurrencyRate()
        {
            using (StreamWriter streamWriter = new StreamWriter("c:\\temp\\currencyrate.txt", false, Encoding.GetEncoding(1252)))
            {
                DateTime date = new DateTime(2009, 1, 1);
                while (date < DateTime.Today)
                {
                    double rate = GetRandomRate();
                    streamWriter.WriteLine("INSERT INTO currencyrate (CurrencyRateDate,FromCurrencyCode,ToCurrencyCode,AverageRate,EndOfDayRate) VALUES ('{0}', 'CAD', 'USD', round({1},4), round({1},4));", date.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture), rate.ToString(System.Globalization.CultureInfo.InvariantCulture));
                    streamWriter.WriteLine("INSERT INTO currencyrate (CurrencyRateDate,FromCurrencyCode,ToCurrencyCode,AverageRate,EndOfDayRate) VALUES ('{0}', 'USD', 'CAD', round({1},4), round({1},4));", date.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture), (1 / rate).ToString(System.Globalization.CultureInfo.InvariantCulture));
                    date = date.AddDays(1);
                }
            }
        }

        private static double GetRandomRate()
        {
            double rnd = random.NextDouble();
            double variation = (rnd - 0.5) / 100;
            CADToUSDRate -= variation;
            if (CADToUSDRate < 0.9 || CADToUSDRate > 1.1)
                CADToUSDRate += variation * 2;
            return CADToUSDRate;
        }

        private static void Address()
        {
            List<string> streetNames = ReadStringItems(@"C:\Users\Jonathan\Concordia\COMP6521\Project\street_names.txt");
            List<string> streetNamesQuebec = ReadStringItems(@"C:\Users\Jonathan\Concordia\COMP6521\Project\street_names_quebec.txt");
            List<string> CACities = ReadStringItems(@"C:\Users\Jonathan\Concordia\COMP6521\Project\city_california.txt");
            List<string> QCCities = ReadStringItems(@"C:\Users\Jonathan\Concordia\COMP6521\Project\city_quebec.txt");
            List<string> OntCities = ReadStringItems(@"C:\Users\Jonathan\Concordia\COMP6521\Project\city_ontario.txt");
            List<string> BCCities = new List<string>(new string[]{"Vancouver", "Victoria"});
            List<string> ABCities = new List<string>(new string[] { "Edmonton", "Calgary" });
            List<string> NYCities = new List<string>(new string[] { "New York" });
            List<string> MNCities = new List<string>(new string[] { "Minneapolis" });
            List<string> ILCities = new List<string>(new string[] { "Chicago" });
            List<string> WACities = new List<string>(new string[] { "Seattle" });
            random = new Random(1197);
            using (StreamWriter streamWriter = new StreamWriter("c:\\temp\\addresses.sql", false, Encoding.GetEncoding(1252)))
            {
                GenerateAddresses(streamWriter, 2000, streetNames, QCCities, 1, "H1R 3N2");
                GenerateAddresses(streamWriter, 2000, streetNames, OntCities, 2, "K4C 3F2");
                GenerateAddresses(streamWriter, 1000, streetNames, BCCities, 3, "V1K 3S2");
                GenerateAddresses(streamWriter, 1000, streetNames, ABCities, 4, "T5A 5C1");
                GenerateAddresses(streamWriter, 1000, streetNames, NYCities, 5, "90210");
                GenerateAddresses(streamWriter, 1000, streetNames, ILCities, 6, "90210");
                GenerateAddresses(streamWriter, 1000, streetNames, MNCities, 7, "90210");
                GenerateAddresses(streamWriter, 2000, streetNames, CACities, 8, "90210");
                GenerateAddresses(streamWriter, 1000, streetNames, WACities, 9, "90210");
            }
        }

        private static void GenerateAddresses(StreamWriter streamWriter, int num, List<string> streetNames, List<string> cities, int stateId, string postalCode)
        {
            HashSet<string> addresses = new HashSet<string>();
            for (int i = 0; i < num; ++i)
            {
                string streetNumber;
                string streetName;
                string city;
                string address;
                do
                {
                    streetNumber = random.Next(1, 8001).ToString();
                    streetName = streetNames[random.Next(streetNames.Count)];
                    city = cities[random.Next(cities.Count)];
                    address = streetNumber + "|" + streetName + "|" + city;
                } while (addresses.Add(address));

                streamWriter.WriteLine("INSERT INTO address (AddressLine1, AddressLine2, City, StateProvinceID, PostalCode) VALUES ('{0} {1}', null, '{2}', {3}, '{4}');", 
                    streetNumber,
                    streetName,
                    city,
                    stateId,
                    postalCode
                    );
            }
        }

        private static List<string> ReadStringItems(string filename)
        {
            List<string> items = new List<string>();
            using (StreamReader streamReader = new StreamReader(filename, Encoding.GetEncoding(1252)))
            {
                string item;
                while ((item = streamReader.ReadLine()) != null)
                    items.Add(item.Trim());
            }
            return items;
        }
    }
}
