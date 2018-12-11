using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;
using SalleController;


namespace Launcher
{
    public class FactoryPeople
    {
        public enum paramStaff
        {
            HeadWaiter,
            Chef,
            Cooker,
            PasteryCooker,
            KitchenClerk,
            Dishwasher,
            Clerk,
            Waiter,
            Butler,
            ClientGroup
        };

        public People createStaff(paramStaff paramstaff, BDDConnection bdd_connection)
        {
            switch (paramstaff)
            {
                case paramStaff.HeadWaiter:
                    return new HeadWaiter(new StrategyHeadWaiter(bdd_connection), bdd_connection);

                case paramStaff.Chef:
                    return new Chef(new StrategyChef(bdd_connection), bdd_connection);

                case paramStaff.Cooker:
                    return new Cooker(new StrategyCooker(bdd_connection), bdd_connection);

                case paramStaff.PasteryCooker:
                    return new PasteryCooker(new StrategyPasteryCooker(bdd_connection), bdd_connection);

                case paramStaff.KitchenClerk:
                    return new KitchenClerk(new StrategyKitchenClerk(bdd_connection), bdd_connection);

                case paramStaff.Dishwasher:
                    return new Dishwasher(new StrategyDishwasher(bdd_connection), bdd_connection);

                case paramStaff.Clerk:
                    return new Clerk(new StrategyClerk(bdd_connection), bdd_connection);

                case paramStaff.Waiter:
                    return new Waiter(new StrategyWaiter(bdd_connection), bdd_connection);

                case paramStaff.Butler:
                    return new Butler(new StrategyButler(bdd_connection), bdd_connection);

                case paramStaff.ClientGroup:
                    return new ClientGroup(new StrategyClientGroup(bdd_connection), bdd_connection);
                default:
                    return null;

            }

        }

    }
}
