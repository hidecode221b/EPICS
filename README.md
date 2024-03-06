# EPICS development project based on BL3.2U

## Background

EPICS is widely used in the monitoring and control system in the large facility, because it is scalable to implement the devices over the network, user-friendly to code the scripts interfaced with RS232/485, stable to run the long-term operation in LINUX at low cost, and reliable to streamline the monitoring and operation among the instruments. This repo will collect EPICS information used at the beamline BL3.2U in SLRI as a first protype model. 


## Introduction

### SLRI 
https://git.slri.or.th/keerati/gsi-fair-documentation/-/blob/master/note/EPICS_refresh_training_2022.md

### PSI (StreamDevice)
https://paulscherrerinstitute.github.io/StreamDevice/index.html

### KEK (User Forum)
https://cerldev.kek.jp/trac/EpicsUsersJP



## Hardware

### RS device server NPort 5600 Series
https://www.moxa.com/en/products/industrial-edge-connectivity/serial-device-servers/general-device-servers/nport-5600-series

### RS232 wiring in DB9
https://deltamotion.com/support/webhelp/rmcwin/Communication_Types/RMC_CPU_RS232_Port/RS_232_Wiring.htm

### RS232 connector pin layout in DB9
https://www.decisivetactics.com/support/view?article=db-9-connector-pinout

### Switching hub
https://www.tp-link.com/th/business-networking/unmanaged-switch/tl-sg1016d/

### Raspberry Pi
https://www.raspberrypi.com/products/raspberry-pi-3-model-b-plus/


## Software

### CALab (LabVIEW for EPICS)
https://github.com/epics-extensions/CALab

## Serial communication analysis (RS232)

### SerialTest
https://github.com/wh201906/SerialTest

### SerialDebug2 (jpn)
http://mdrtech.web.fc2.com/upload/upload.htm

https://zatumemoblog.com/serialdebug2/

### SerialTool (CRC16)
https://serialtool.com/

### Hex to decimal converter
https://www.rapidtables.com/convert/number/hex-to-ascii.html

### ASCII table
http://facweb.cs.depaul.edu/sjost/it212/documents/ascii-pr.htm


## IOC device manual and code

### AML PCG1 Vacuum Ion Gauge
https://arunmicro.com/documentation/Manual_PGC1.pdf

### Agilent Digital Multimeter
http://instructor.physics.lsa.umich.edu/adv-labs/Tools_Resources/HP%2034401A%20user%27s%20guide.pdf

### Pfeiffer CCG TPG300 and full-range gauge TPG261 controllers
http://lmu.web.psi.ch/docu/manuals/bulk_manuals/Pfeiffer/TPG_300.pdf

https://www.idealvac.com/files/ManualsII/Pfeiffer_Single_Gauge_TPG261.pdf

https://epics.anl.gov/tech-talk/2021/msg00373.php

https://panda-repo.gsi.de/pandadcs/epics-files/-/tree/master/

https://github.com/ISISComputingGroup/EPICS-TPG/tree/master/TPGSup


### Varian Dual Ion pump controller
https://adms.fnal.gov/vacuum/manuals/varianip/CD_Ion/PDF/900-094/DUAL.pdf

### Keithley 6482 pico ammeter
https://github.com/slaclab/Keithley6482/tree/master

### Keithley 6514 system electrometer
https://download.tek.com/manual/6514-901-01(D-May2003)(Instruction).pdf

### Kodiak Lytron chiller
https://info.boydcorp.com/hubfs/Thermal/Liquid-Cooling/Boyd-Recirculating-Chiller-Technical-Manual-820-0043.pdf

### Wattsine RF power supply
https://www.wattsine.com/

### Lake Shore Temperature Controller 335

The latest 335 model has GPIB or USB interface. USB interface cannot be accessed without the driver from the Lake Shore. The caLab is used to get the temp.

https://www.lakeshore.com/docs/default-source/product-downloads/335_manual.pdf

### NI SCB-68 shielded I/O connector block for the multifunction card

The connecting box of the multifunction card has an internal temperature sensor (cold-junction compensation circuitry) to calibrate the inputs from the TC.  The caLab is used to get the temp.










