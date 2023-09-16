-- BoilerTankData
BoilerTankData = {lavaPump={}, lavaTanks={}, waterPump={}, boilerStatus={}}

function BoilerTankData:__init__(baeeClass, data)
    local lavaPumpEM = peripheral.wrap(data['lavaPump']['electricMotor'])
    local lavaPumpRSC = peripheral.wrap(data['lavaPump']['rotationalSpeedController'])
    local lavaTanksLBBInner = peripheral.wrap(data['lavaTanks']['inner'])
    local lavaTanksLBBOuter = peripheral.wrap(data['lavaTanks']['outer'])
    local waterPumpEM = peripheral.wrap(data['waterPump']['electricMotor'])
    local waterPumpRSC = peripheral.wrap(data['waterPump']['rotationalSpeedController'])
    local boilerStatusDL = peripheral.wrap(data['boilerStats']['displayLink'])
    local boilerStatusStartLine = data['boilerStats']['startLine']
    local self = {lavaPumpEM, lavaPumpRSC, lavaTanksLBBInner, lavaTanksLBBOuter, waterPumpEM, waterPumpRSC, boilerStatusDL, boilerStatusStartLine}
    setmetatable (self, {__index=BoilerTankData})
    return self
end

setmetatable (BoilerTankData, {__call=BoilerTankData.__init__})

function BoilerTankData:getLavaPumpData()
    local motorSpeed = self.lavaPumpEM.getSpeed()
    local motorStress =  self.lavaPumpEM.getStressCapacity()
    local motorConsumption = self.lavaPumpEM.getEnergyConsumption()
    local rscSpeed = self.lavaPumpRSC.getTargetSpeed()
    return {motorSpeed, motorStress, motorConsumption, rscSpeed}
end

function BoilerTankData:setLavaPumpData(motorSpeed, rscSpeed)
    self.lavaPumpEM.setSpeed(motorSpeed)
    self.lavaPumpRSC.setTargetSpeed(rscSpeed)
end

function BoilerTankData:getLavaTanksData()
    local inner = self.lavaTanksLBBInner.tanks()
    local outer = self.lavaTanksLBBOuter.tanks()
    return {inner['amount'], outer['amount']}
end

function BoilerTankData:getWaterPumpData()
    local motorSpeed = self.waterPumpEM.getSpeed()
    local motorStress =  self.waterPumpEM.getStressCapacity()
    local motorConsumption = self.waterPumpRSC.getEnergyConsumption()
    local rscSpeed = self.lavaPumpRSC.getTargetSpeed()
    return {motorSpeed, motorStress, motorConsumption, rscSpeed}
end

function BoilerTankData:setWaterPumpData(motorSpeed, rscSpeed)
    self.waterPumpEM.setSpeed(motorSpeed)
    self.waterPumpRSC.setTargetSpeed(rscSpeed)
end

function BoilerTankData:getBoilerStatusData()
    return {self.boilerStatusDL.getLine(self.boilerStatusStartLine), self.boilerStatusDL.getLine(self.boilerStatusStartLine+1), self.boilerStatusDL.getLine(self.boilerStatusStartLine+2), self.boilerStatusDL.getLine(self.boilerStatusStartLine+3)}
end