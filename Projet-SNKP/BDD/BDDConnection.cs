using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    public class BDDConnection
    {
        private string connection_string = "";
        private SqlConnection connection = null;
        private SqlCommand command = null;
        private SqlDataReader data = null;
        private RestaurantQueries queries = null;
        private QueriesKitchen queriesKitchen = null;
        private List<List<string>> data_list = null;
        private bool has_data = false;

        public BDDConnection(string data_source, string database)
        {
            // Initialize the BDD connection string
            this.connection_string =
                "Data Source = " + data_source +
                "; Initial Catalog = " + database + "; Integrated Security = True";
            this.open();

            this.queries = new RestaurantQueries();
            this.queriesKitchen = new QueriesKitchen();
        }

        public void open()
        {
            // Initialize the SQL connection
            this.connection = new SqlConnection(this.connection_string);
            try
            {
                // Try to connect
                this.connection.Open();
                //Console.WriteLine("Connected to BDD");
            }
            catch (Exception)
            {
                // If the connection failed ...
                Console.WriteLine("BDD connection failed");
            }
        }

        public string getState()
        {
            return this.connection.State.ToString();
        }

        // Close the BDD connection
        public void close()
        {
            this.connection.Close();
        }

        // Try to close the SqlDataReader if it's already open
        public void closeDataReader()
        {
            try
            {
                this.data.Close();
            }
            catch (Exception)
            {

            }
        }

        // Execute a query that does not wait for a result
        public void executeNonQuery(string query)
        {
            this.prepareCommand(query);
            this.closeDataReader();
            this.command.ExecuteNonQuery();
        }

        // Execute a query and store the result in <data>
        public List<List<string>> executeQuery(string query)
        {
            this.prepareCommand(query);
            this.closeDataReader();
            this.data = this.command.ExecuteReader();

            try
            {
                this.data.Read();
                this.data.GetValue(0);
                this.has_data = true;
            }
            catch (InvalidOperationException)
            {
                this.has_data = false;
            }
            return this.toStringList();
        }

        // Prepare the SQL command with <query> as command text
        public void prepareCommand(string query)
        {
            this.command = this.connection.CreateCommand();
            this.command.CommandText = query;
        }

        // Insert the SqlDataReader in a List of string values
        public List<List<string>> toStringList()
        {
            this.closeDataReader();
            this.data = this.command.ExecuteReader();
            this.data_list = new List<List<string>>();
            while (this.data.Read())
            {
                List<string> row_list = new List<string>();
                for (int i = 0; i < this.data.FieldCount; i++)
                {
                    row_list.Add(this.data[i].ToString());
                }
                data_list.Add(row_list);
            }
            return data_list;
        }

        // Return of string value of a specify index
        public string getValue(int row, int column)
        {
            return this.data_list[row][column];
        }

        // Return the SqlDataReader
        public SqlDataReader Data
        {
            get { return this.data; }
        }

        // Return true if the query has return a dataset
        public Boolean hasData()
        {
            return this.has_data;
        }

        public RestaurantQueries Queries
        {
            get { return this.queries; }
        }
        public QueriesKitchen QueriesKitchen
        {
            get { return this.queriesKitchen; }
        }
    }
}
