*** Settings ***
Documentation  This script is used to select/Validate the Roles
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
Suite Teardown    End Web Test


# Note:
# Command to run all the test under tests
##  robot -d results tests
# Command to run all the test under tests/001__RoleEmulator.robot
## robot -d results tests/001__RoleEmulator.robot
# Command to run test based on Tags
##  robot -d results -v environment:prod  tests/001__RoleEmulator.robot


*** Test Cases ***
Role Navigation
    Navigate To Role

Business Unit Validation on Role
    [Template]  Business Validation In Role Emulator
      ${TC5405}
      ${TC5406}
      ${TC5407}
      ${TC5408}
      ${TC5409}
      ${TC5410}
      ${TC5411}
      ${TC5412}
      ${TC5413}
      ${TC5414}
      ${TC5415}
      ${TC5416}
      ${TC5417}
      ${TC5418}
      ${TC5419}
      ${TC5420}
      ${TC5425}
      ${TC5426}
      ${TC5421}
      ${TC5422}
      ${TC5423}
      ${TC5427}
      ${TC5424}
      ${TC5428}
      ${TC5429}
      ${TC5430}
      ${TC5431}
      ${TC5432}
      ${TC5434}
      ${TC5435}
      ${TC5436}
      ${TC5437}
      ${TC5438}
      ${TC5439}
      ${TC5440}
      ${TC5441}
      ${TC5442}
      ${TC5443}
      ${TC5444}
      ${TC5445}
      ${TC5446}
      ${TC5447}
      ${TC5448}
      ${TC5449}
      ${TC5450}
      ${TC5451}
      ${TC5452}
      ${TC5453}
      ${TC5454}
      ${TC5455}
      ${TC5456}
      ${TC5457}
      ${TC5458}
      ${TC5459}
      ${TC5460}
      ${TC5461}
      ${TC5462}
      ${TC5463}
      ${TC5464}
      ${TC5538}
      ${TC5465}
      ${TC5466}
      ${TC5467}
      ${TC5468}
      ${TC5469}
      ${TC5433}
      ${TC5470}
      ${TC5471}
      ${TC5472}
      ${TC5473}
      ${TC5474}
      ${TC5475}
      ${TC5476}
      ${TC5477}
      ${TC5478}
      ${TC5479}
      ${TC5480}
      ${TC5481}
      ${TC5482}
      ${TC5483}
      ${TC5484}
      ${TC5485}
      ${TC5539}
      ${TC5540}
      ${TC5486}
      ${TC5487}
      ${TC5488}
      ${TC5489}
      ${TC5490}
      ${TC5491}
      ${TC5492}
      ${TC5493}
      ${TC5494}
      ${TC5495}
      ${TC5496}
      ${TC5497}
      ${TC5498}
      ${TC5499}
      ${TC5500}
      ${TC5501}
      ${TC5502}
      ${TC5503}
      ${TC5504}
      ${TC5505}
      ${TC5506}
      ${TC5507}
      ${TC5508}
      ${TC5509}
      ${TC5510}
      ${TC5511}
      ${TC5512}
      ${TC5513}
      ${TC5514}
      ${TC5515}
      ${TC5516}
      ${TC5517}
      ${TC5518}
      ${TC5519}
      ${TC5520}
      ${TC5521}
      ${TC5522}
      ${TC5537}
      ${TC5523}
      ${TC5524}
      ${TC5525}
      ${TC5526}
      ${TC5527}
      ${TC5528}
      ${TC5529}
      ${TC5530}
      ${TC5531}
      ${TC5532}
      ${TC5533}
      ${TC5534}
      ${TC5535}
      ${TC5536}
      ${TC5554}
      ${TC5555}
      ${TC5556}
      ${TC5557}
      ${TC5541}
      ${TC5542}
      ${TC5543}
      ${TC5544}
      ${TC5545}
      ${TC5546}
      ${TC5547}
      ${TC5548}
      ${TC5549}
      ${TC5550}
      ${TC5551}
      ${TC5552}
      ${TC5553}

      ${TC5558}
      ${TC5559}
      ${TC5560}
      ${TC5561}
      ${TC5562}
      ${TC5563}
      ${TC5564}
      ${TC5565}
      ${TC5566}
      ${TC5567}
      ${TC5568}
      ${TC5569}
      ${TC5570}
      ${TC5571}
      ${TC5572}
      ${TC5573}
      ${TC5574}
      ${TC5575}
      ${TC5576}
      ${TC5577}
      ${TC5578}

