using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;
using SalleController;


namespace Model
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

        public People createStaff(paramStaff paramstaff)
        {
            switch (paramstaff)
            {
                case paramStaff.HeadWaiter:
                    return new HeadWaiter(new StrategyHeadWaiter());

                case paramStaff.Chef:
                    return new Chef(new StrategyChef());

                case paramStaff.Cooker:
                    return new Cooker(new StrategyCooker());

                case paramStaff.PasteryCooker:
                    return new PasteryCooker(new StrategyPasteryCooker(), new StrategyCooker());

                case paramStaff.KitchenClerk:
                    return new KitchenClerk(new StrategyKitchenClerk());

                case paramStaff.Dishwasher:
                    return new Dishwasher(new StrategyDishwasher());

                case paramStaff.Clerk:
                    return new Clerk(new StrategyClerk());

                case paramStaff.Waiter:
                    return new Waiter(new StrategyWaiter());

                case paramStaff.Butler:
                    return new Butler(new StrategyButler());

                case paramStaff.ClientGroup:
                    return new ClientGroup(new StrategyClientGroup());
                default:
                    return null;

            }

        }

    }
}
