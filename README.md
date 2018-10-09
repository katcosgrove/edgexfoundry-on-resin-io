Main Author:  Ben Harosh

Acknowledgments: Jim White

This project is intened to deploy the Edgex Foundry framework for IoT edge computing on a Resin.io framework that is running on the ResinOS (arm32v7 kernel).

The main challenge is that the Edgex Foundry framework was built for 64-bit based OS while Resin.io is running on ResinOS which is running ARM 32-bit linux OS. For example, a big challenge is finding a 32-bit mongoDB version that will run on the ARM 32-bit OS.

The specific Edgex Foundry version that we are trying to install on the Resin.io is the golang version that can be found here:
https://www.edgexfoundry.org/

More information on the EdgeX Foundry project can be found here:
edgex foundry git: https://github.com/edgexfoundry
edgex foundry gollang git: https://github.com/edgexfoundry/edgex-go

More information on Resin.io can be found here:
https://resin.io/
resin.io git: https://github.com/resin-io


