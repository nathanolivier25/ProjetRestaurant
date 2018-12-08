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
                    break;

                case paramStaff.Chef:
                    return new Chef(new StrategyChef());

                    break;

                case paramStaff.Cooker:
                    return new Cooker(new StrategyCooker());

                    break;

                case paramStaff.PasteryCooker:
                    return new PasteryCooker(new StrategyPasteryCooker(), new StrategyCooker());

                    break;

                case paramStaff.KitchenClerk:
                    return new KitchenClerk(new StrategyKitchenClerk());

                    break;

                case paramStaff.Dishwasher:
                    return new Dishwasher(new StrategyDishwasher());

                    break;

                case paramStaff.Clerk:
                    return new Clerk(new StrategyClerk());

                    break;

                case paramStaff.Waiter:
                    return new Waiter(new StrategyWaiter());

                    break;

                case paramStaff.Butler:
                    return new Butler(new StrategyButler());

                    break;

                case paramStaff.ClientGroup:
                    return new ClientGroup(new StrategyClientGroup());

                    break;
                default:
                    return null;

            }

        }

    }
}
