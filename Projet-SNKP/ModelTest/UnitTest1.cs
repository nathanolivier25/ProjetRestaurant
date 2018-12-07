using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ModelConsole;

namespace ModelTest
{
    [TestClass]
    public class UnitTest1
    {


        [TestMethod]
        public void TestMethod1()
        {
            FactoryPeople factory = new FactoryPeople();

            //factory = factory.createStaff(FactoryPeople.paramStaff.Cooker);
            People factoryTest = factory.createStaff(FactoryPeople.paramStaff.Cooker);
            Assert.AreEqual(factoryTest, new Cooker());



        }
    }
}
