-- BoilerBankData
local Tank = require('util/BoilerTankData.lua')
BoilerBankData = {bankNumber = 1}

function BoilerBankData:__init__(bankNumber)
    local tank1LavaPump={'electric_motor_4','scrollBehaviorEntity_3'}
    local tank1LavaTanks={'createaddition:liquid_blaze_burner_1','createaddition:liquid_blaze_burner_2'}
    local tank1WaterPump={'electric_motor_6','scrollBehaviorEntity_5'}
    local tank1BoilerStatus={'create_target_3', 1}
    local tank2LavaPump={'electric_motor_7','scrollBehaviorEntity_6'}
    local tank2LavaTanks={'createaddition:liquid_blaze_burner_3','createaddition:liquid_blaze_burner_4'}
    local tank2WaterPump={'electric_motor_8','scrollBehaviorEntity_7'}
    local tank2BoilerStatus={'create_target_3', 5}
    local tank3LavaPump={'electric_motor_9','scrollBehaviorEntity_8'}
    local tank3LavaTanks={'createaddition:liquid_blaze_burner_5','createaddition:liquid_blaze_burner_6'}
    local tank3WaterPump={'electric_motor_10','scrollBehaviorEntity_9'}
    local tank3BoilerStatus={'create_target_3', 9}
    local tank4LavaPump={'electric_motor_11','scrollBehaviorEntity_10'}
    local tank4LavaTanks={'createaddition:liquid_blaze_burner_7','createaddition:liquid_blaze_burner_8'}
    local tank4WaterPump={'electric_motor_12','scrollBehaviorEntity_11'}
    local tank4BoilerStatus={'create_target_3', 13}
    local tank5LavaPump={'electric_motor_4','scrollBehaviorEntity_3'}
    local tank5LavaTanks={'createaddition:liquid_blaze_burner_1','createaddition:liquid_blaze_burner_2'}
    local tank5WaterPump={'electric_motor_6','scrollBehaviorEntity_5'}
    local tank5BoilerStatus={'create_target_3', 1}
    local tank6LavaPump={'electric_motor_7','scrollBehaviorEntity_6'}
    local tank6LavaTanks={'createaddition:liquid_blaze_burner_3','createaddition:liquid_blaze_burner_4'}
    local tank6WaterPump={'electric_motor_8','scrollBehaviorEntity_7'}
    local tank6BoilerStatus={'create_target_3', 5}
    local tank7LavaPump={'electric_motor_9','scrollBehaviorEntity_8'}
    local tank7LavaTanks={'createaddition:liquid_blaze_burner_5','createaddition:liquid_blaze_burner_6'}
    local tank7WaterPump={'electric_motor_10','scrollBehaviorEntity_9'}
    local tank7BoilerStatus={'create_target_3', 9}
    local tank8LavaPump={'electric_motor_11','scrollBehaviorEntity_10'}
    local tank8LavaTanks={'createaddition:liquid_blaze_burner_7','createaddition:liquid_blaze_burner_8'}
    local tank8WaterPump={'electric_motor_12','scrollBehaviorEntity_11'}
    local tank8BoilerStatus={'create_target_3', 13}

    local tanks = {}

    if bankNumber == 1 then
        tanks[1] = Tank (tank1LavaPump, tank1LavaTanks, tank1WaterPump, tank1BoilerStatus)
        tanks[2] = Tank (tank2LavaPump, tank2LavaTanks, tank2WaterPump, tank2BoilerStatus)
        tanks[3] = Tank (tank3LavaPump, tank3LavaTanks, tank3WaterPump, tank3BoilerStatus)
        tanks[4] = Tank (tank4LavaPump, tank4LavaTanks, tank4WaterPump, tank4BoilerStatus)
    elseif bankNumber == 2 then
        tanks[1] = Tank (tank5LavaPump, tank5LavaTanks, tank5WaterPump, tank5BoilerStatus)
        tanks[2] = Tank (tank6LavaPump, tank6LavaTanks, tank6WaterPump, tank6BoilerStatus)
        tanks[3] = Tank (tank7LavaPump, tank7LavaTanks, tank7WaterPump, tank7BoilerStatus)
        tanks[4] = Tank (tank8LavaPump, tank8LavaTanks, tank8WaterPump, tank8BoilerStatus)
    end

    local self = {tanks}
    setmetatable (self, {__index=BoilerBankData})
    return self
end

setmetatable (BoilerBankData, {__call=BoilerBankData.__init__})

function BoilerBankData:getTankData(tankNumber)
    local lavaPumpData = self.tanks[tankNumber].getLavaPumpData()
    local lavaTankData = self.tanks[tankNumber].getLavaTanksData()
    local waterPumpData = self.tanks[tankNumber].getWaterPumpData()
    local boilerBankData = self.tanks[tankNumber].getBoilerStatusData()
    return {lavaPumpData, lavaTankData, waterPumpData, boilerBankData}
end

function BoilerBankData:getBankData()
    local tank1 = {self.tanks[1].getLavaPumpData(), self.tanks[1].getLavaTanksData(), self.tanks[1].getWaterPumpData(), self.tanks[1].getBoilerStatusData()}
    local tank2 = {self.tanks[2].getLavaPumpData(), self.tanks[2].getLavaTanksData(), self.tanks[2].getWaterPumpData(), self.tanks[2].getBoilerStatusData()}
    local tank3 = {self.tanks[3].getLavaPumpData(), self.tanks[3].getLavaTanksData(), self.tanks[3].getWaterPumpData(), self.tanks[3].getBoilerStatusData()}
    local tank4 = {self.tanks[4].getLavaPumpData(), self.tanks[4].getLavaTanksData(), self.tanks[4].getWaterPumpData(), self.tanks[4].getBoilerStatusData()}
    return {tank1, tank2, tank3, tank4}
end

-- TODO generate the setter classes to control the motors and RSC 