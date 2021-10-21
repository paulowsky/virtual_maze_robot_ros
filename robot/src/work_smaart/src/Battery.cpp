
#include <ros/ros.h>
#include <stdlib.h>
#include "work_smaart/BatCalc.h"

// class Base{
//     public: 
//     virtual void Battery::decreaseBattery(work_smaart::BatCalc::Request &request, work_smaart::BatCalc::Response &response){
                      
//             if(200 - request.numeroMovements >= request.dist + 5)
//                 response.isWeak = false;
//             else
//                 response.isWeak = true;
            
//         return;
//         }
// }


// class Battery{
//     public:
//         Battery(){
//             totalBattery = 200;
//         }

//     private:
//         int totalBattery;
//         ros::NodeHandle n;
//         ros::ServiceServer service;
// };

bool decreaseBattery(work_smaart::BatCalc::Request &request, work_smaart::BatCalc::Response &response){

    if(200 - request.numeroMovements >= request.dist + 5)
        response.isWeak = false;
    else
        response.isWeak = true;
    return true;
}

int main(int argc, char * argv[])
{
    ros::init(argc, argv, "battery");
    ros::NodeHandle n;
    ros::ServiceServer service = n.advertiseService("battery_service", decreaseBattery);
    ros::spin();
    
    return EXIT_SUCCESS;
}
