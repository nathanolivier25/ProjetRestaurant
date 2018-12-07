using BDD;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BDDTest
{
    [TestClass]
    public class BDDConnectionTest
    {
        private string db_user = "SÉBASTIEN";
        private string db_name = "Test";

        [TestMethod]
        public void testOpen()
        {
            // ARRANGE
            BDDConnection bdd_connection = null;

            // ACTION
            bdd_connection = new BDDConnection(db_user, db_name);

            // ASSERT
            Assert.AreEqual(bdd_connection.getState(), "Open");
        }

        [TestMethod]
        public void testOpenFail()
        {
            // ARRANGE
            BDDConnection bdd_connection = null;

            try
            {
                // ACTION
                bdd_connection = new BDDConnection(db_user, "Unknown BDD");

                // ASSERT
                Assert.IsTrue(false);
            }
            catch (Exception)
            {
                // ASSERT
                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void testClose()
        {
            // ARRANGE
            BDDConnection bdd_connection = null;

            // ACTION
            bdd_connection = new BDDConnection(db_user, db_name);
            bdd_connection.close();

            // ASSERT
            Assert.AreEqual(bdd_connection.getState(), "Closed");
        }

        [TestMethod]
        public void testCloseDataReader()
        {
            // ARRANGE
            BDDConnection bdd_connection = new BDDConnection(db_user, db_name);

            // ASSERT
            try
            {
                bdd_connection.Data.Close();
                Assert.IsTrue(false);
            }
            catch (Exception)
            {
                Assert.IsTrue(true);
            }

            // ACTION
            bdd_connection.executeQuery("SELECT 2;");

            // ASSERT
            Assert.IsFalse(bdd_connection.Data.IsClosed);

            // ACTION
            bdd_connection.closeDataReader();

            // ASSERT
            Assert.IsTrue(bdd_connection.Data.IsClosed);
        }

        [TestMethod]
        public void testExecuteNonQuery()
        {
            // ARRANGE
            BDDConnection bdd_connection = new BDDConnection(db_user, db_name);
            
            try
            {
                // ACTION
                bdd_connection.executeNonQuery("SELECT 2;");

                // ASSERT
                Assert.IsTrue(true);
            }
            catch (Exception)
            {
                // ASSERT
                Assert.IsTrue(false);
            }

        }

        [TestMethod]
        public void testExecuteQuery()
        {
            // ARRANGE
            BDDConnection bdd_connection = new BDDConnection(db_user, db_name);

            try
            {
                // ACTION
                bdd_connection.executeQuery("SELECT 2+8");

                // ASSERT
                Assert.IsTrue(true);
            }
            catch (Exception)
            {
                // ASSERT
                Assert.IsTrue(false);
            }
        }

        [TestMethod]
        public void testToStringList()
        {
            // ARRANGE
            BDDConnection bdd_connection = new BDDConnection(db_user, db_name);

            // ACTION
            bdd_connection.executeQuery("SELECT 2+6");
            bdd_connection.toStringList();

            // ASSERT
            Assert.AreEqual("8", bdd_connection.getValue(0, 0));
        }
    }
}
