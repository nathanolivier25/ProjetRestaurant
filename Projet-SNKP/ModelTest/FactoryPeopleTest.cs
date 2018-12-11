using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using SalleController;

namespace ModelTest
{
    [TestClass]
    public class FactoryPeopleTest
    {
        // ARRANGE
        FactoryPeople factory_people = new FactoryPeople();
        People people = null;

        [TestMethod]
        public void testCreateStaff_HeadWaiter()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.HeadWaiter, null);
            
            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.HeadWaiter");
        }

        [TestMethod]
        public void testCreateStaff_Chef()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Chef, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Chef");
        }

        [TestMethod]
        public void testCreateStaff_Cooker()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Cooker, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Cooker");
        }

        [TestMethod]
        public void testCreateStaff_PasteryCooker()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.PasteryCooker, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.PasteryCooker");
        }

        [TestMethod]
        public void testCreateStaff_KitchenClerk()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.KitchenClerk, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.KitchenClerk");
        }

        [TestMethod]
        public void testCreateStaff_Dishwasher()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Dishwasher, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Dishwasher");
        }

        [TestMethod]
        public void testCreateStaff_Clerk()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Clerk, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Clerk");
        }

        [TestMethod]
        public void testCreateStaff_Waiter()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Waiter, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Waiter");
        }

        [TestMethod]
        public void testCreateStaff_Butler()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.Butler, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.Butler");
        }

        [TestMethod]
        public void testCreateStaff_ClientGroup()
        {
            // ACTION
            people = factory_people.createStaff(FactoryPeople.paramStaff.ClientGroup, null);

            // ASSERT
            Assert.AreEqual(people.GetType().FullName, "Model.ClientGroup");
        }
    }
}
