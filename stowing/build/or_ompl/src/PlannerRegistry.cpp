#include <map>
#include <string>
#include <boost/assign/list_of.hpp>
#include <ompl/geometric/planners/kpiece/BKPIECE1.h>
#include <ompl/geometric/planners/est/EST.h>
#include <ompl/geometric/planners/fmt/FMT.h>
#include <ompl/geometric/planners/kpiece/KPIECE1.h>
#include <ompl/geometric/planners/rrt/LazyRRT.h>
#include <ompl/geometric/planners/kpiece/LBKPIECE1.h>
#include <ompl/geometric/planners/pdst/PDST.h>
#include <ompl/geometric/planners/prm/PRM.h>
#include <ompl/geometric/planners/prm/LazyPRM.h>
#include <ompl/geometric/planners/prm/PRMstar.h>
#include <ompl/geometric/planners/rrt/pRRT.h>
#include <ompl/geometric/planners/sbl/pSBL.h>
#include <ompl/geometric/planners/rrt/RRT.h>
#include <ompl/geometric/planners/rrt/RRTConnect.h>
#include <ompl/geometric/planners/rrt/RRTstar.h>
#include <ompl/geometric/planners/sbl/SBL.h>
#include <ompl/geometric/planners/prm/SPARS.h>
#include <ompl/geometric/planners/prm/SPARStwo.h>
#include <ompl/geometric/planners/rrt/TRRT.h>
#include <or_ompl/PlannerRegistry.h>

namespace or_ompl {
namespace registry {

struct BasePlannerFactory {
    virtual ~BasePlannerFactory() { }
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space) = 0;
};

/*
 * Planner Factories
 */
struct BKPIECE1Factory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::BKPIECE1(space);
    }
};
struct ESTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::EST(space);
    }
};
struct FMTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::FMT(space);
    }
};
struct KPIECE1Factory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::KPIECE1(space);
    }
};
struct LazyRRTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::LazyRRT(space);
    }
};
struct LBKPIECE1Factory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::LBKPIECE1(space);
    }
};
struct PDSTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::PDST(space);
    }
};
struct PRMFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::PRM(space);
    }
};
struct LazyPRMFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::LazyPRM(space);
    }
};
struct PRMstarFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::PRMstar(space);
    }
};
struct pRRTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::pRRT(space);
    }
};
struct pSBLFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::pSBL(space);
    }
};
struct RRTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::RRT(space);
    }
};
struct RRTConnectFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::RRTConnect(space);
    }
};
struct RRTstarFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::RRTstar(space);
    }
};
struct SBLFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::SBL(space);
    }
};
struct SPARSFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::SPARS(space);
    }
};
struct SPARStwoFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::SPARStwo(space);
    }
};
struct TRRTFactory : public virtual BasePlannerFactory {
    virtual ompl::base::Planner *create(ompl::base::SpaceInformationPtr space)
    {
        return new ompl::geometric::TRRT(space);
    }
};

/*
 * Planner Registry
 */
typedef std::map<std::string, BasePlannerFactory *> PlannerRegistry;

// The dynamic_cast is necessary to work around a type inference bug when
// using map_list_of on a polymorphic type.
static PlannerRegistry registry = boost::assign::map_list_of
    ("BKPIECE1", dynamic_cast<BasePlannerFactory *>(new BKPIECE1Factory))
    ("EST", dynamic_cast<BasePlannerFactory *>(new ESTFactory))
    ("FMT", dynamic_cast<BasePlannerFactory *>(new FMTFactory))
    ("KPIECE1", dynamic_cast<BasePlannerFactory *>(new KPIECE1Factory))
    ("LazyRRT", dynamic_cast<BasePlannerFactory *>(new LazyRRTFactory))
    ("LBKPIECE1", dynamic_cast<BasePlannerFactory *>(new LBKPIECE1Factory))
    ("PDST", dynamic_cast<BasePlannerFactory *>(new PDSTFactory))
    ("PRM", dynamic_cast<BasePlannerFactory *>(new PRMFactory))
    ("LazyPRM", dynamic_cast<BasePlannerFactory *>(new LazyPRMFactory))
    ("PRMstar", dynamic_cast<BasePlannerFactory *>(new PRMstarFactory))
    ("pRRT", dynamic_cast<BasePlannerFactory *>(new pRRTFactory))
    ("pSBL", dynamic_cast<BasePlannerFactory *>(new pSBLFactory))
    ("RRT", dynamic_cast<BasePlannerFactory *>(new RRTFactory))
    ("RRTConnect", dynamic_cast<BasePlannerFactory *>(new RRTConnectFactory))
    ("RRTstar", dynamic_cast<BasePlannerFactory *>(new RRTstarFactory))
    ("SBL", dynamic_cast<BasePlannerFactory *>(new SBLFactory))
    ("SPARS", dynamic_cast<BasePlannerFactory *>(new SPARSFactory))
    ("SPARStwo", dynamic_cast<BasePlannerFactory *>(new SPARStwoFactory))
    ("TRRT", dynamic_cast<BasePlannerFactory *>(new TRRTFactory));

std::vector<std::string> get_planner_names()
{
    std::vector<std::string> names;
    names.reserve(registry.size());

    PlannerRegistry::const_iterator it;
    for (it = registry.begin(); it != registry.end(); ++it) {
        names.push_back(it->first);
    }

    return names;
}

ompl::base::Planner *create(std::string const &name,
                            ompl::base::SpaceInformationPtr space)
{
    PlannerRegistry::const_iterator const it = registry.find(name);
    if (it != registry.end()) {
        return it->second->create(space);
    } else {
        throw std::runtime_error("Unknown planner '" + name + "'.");
    }
}

} // namespace registry
} // namespace or_ompl
