# EPICS development project based on BL3.2U

## Preface

This report is a progress report of the first phase as of Feb. 2024, and revised upon the development progress accordingly.

## Background

EPICS is widely used in the monitoring and control system in the large scientific and production facilities, because it is scalable to implement the huge number of devices over the ethernet network, user-friendly to code the scripts interfaced with RS232/485/GPIB, stable to run the long-term and minimum-resource operation based on LINUX even in the Raspberry Pi, and reliable to streamline the monitoring and feedback operation among the devices. This repo will collect EPICS information used at BL3.2U in SLRI as a first prototype EPICS monitoring system in the beamline. 

Most of beamline vacuum and optics status are monitored in the LabVIEW-based program currently for the beamline interlock system. The vacuum and temperature status in the end-stations of the beamline are not monitored or stored as a historical record, which plays a critical role in the investigation of problems happened during the user service and electrical failure in the facility. The historical records of vacuum pressure and pumping status in the soft X-ray beamline give us a hint to prevent a human error in the beamline system, and suggest a proper maintenance timing of the vacuum system prior to a significant incident and critical damage.

## Target and plan

In the first stage of EPICS development, we will implement the local network for EPICS monitoring system with 5 input and output controllers (IOCs) at least. In the second stage, we will implement the database of records and establish the analytical procedure of the records. In the third stage, we will connect the local network to the global network of SLRI accesible online. We will test the feed-forward and -back control of the temperture and motion of the sample in the future phase if we have sufficient resources such as the motors, temperature monitors, and so on.

IOCs correspond to the devices under the EPICS control and monitoring system. In the first stage, we connected the 5 IOCs at least in the BL3.2Ua PES end-station based on a serial device server 16-channel, which is currently available from the department in the section. 5 IOCs emcompass the full-range gauge, cold-cathod gauge (CCG), ionization gauge, ion-pump controller, and electrometer/multimeter. Some devices cannot be accessible from the RS232 interface, so the LabVIEW CALab is used to get the record from the IOCs such as the diode-type and thermo-couple temperature monitors.

The network switching hub is also available, so we can connect our serial device servers to the other network such as accelerator EPICS network. The control software section (CSS) established the beamline 3.2 otpics vacuum monitoring for 11 CCG gauges based on the serial device server with the NI LabVIEW DSC server previously, and it is now under control of the accelerator EPICS network to monitor the front-end pressure during the beamline alignment and injection inefficiency. Before the injection inefficiency took place, we successfully established the local EPICS network with two serial device servers from the beamline 3.2 optics vaccum and 3.2Ua end-station monitoring system.

## Resources and information of EPICS

EPICS resources are available online. SLRI held the training of EPICS implementation several times. The User forum encompsses trick and tip to tackle with the technical issues in the serial communication with devices.

### SLRI (internal training)
https://git.slri.or.th/keerati/gsi-fair-documentation/-/blob/master/note/EPICS_refresh_training_2022.md

### Official site
https://epics-controls.org/

https://epics.anl.gov/

### PSI (StreamDevice)
https://paulscherrerinstitute.github.io/StreamDevice/index.html

### KEK (User Forum)
https://cerldev.kek.jp/trac/EpicsUsersJP



## Hardware

Typical configuration of EPICS is based on the serial port communication over the ethernet network. In the initial stage, the EPICS shares within the local network via the switching hub. IOC devices are connected to the serial device server at each end station plus BL control station. PES has a serial device server 16 channels, and 2 more serial device servers will be implemented in PEEM and XPS stations in the following years. BL control station has a serial device server implemented by the control software section (CSS), but the accelerator section takes over the serial device server control. EPICS is primary running in the Raspberry Pi, and CALab 64-bit extends the channel access for the LabVIEW2019 in Windows PC.

### Serial device server: MOXA NPort 5650-16
https://www.moxa.com/en/products/industrial-edge-connectivity/serial-device-servers/general-device-servers/nport-5600-series

### RS232 wiring in DB9
https://deltamotion.com/support/webhelp/rmcwin/Communication_Types/RMC_CPU_RS232_Port/RS_232_Wiring.htm

### RS232 connector pin layout in DB9
https://www.decisivetactics.com/support/view?article=db-9-connector-pinout

### Switching hub: TP-link TL-SG1016 16-port gigabit switch
https://www.tp-link.com/th/business-networking/unmanaged-switch/tl-sg1016d/

### Raspberry Pi
https://www.raspberrypi.com/products/raspberry-pi-3-model-b-plus/


## Software

The following software is useful to develop the IOC communications. The st.cmd file specifies the connection to each device according to the following syntax;
```
sys=System, sec=Section, dev=Device.
```
For example, the CCG gauge at MBE in BL3.2Ua is `sys=BL32Ua`,`sec=MBE`,`dev=CCG`.


### CALab (LabVIEW for EPICS)
CALab is indispenable when the device has an interface only with USB or PCI for the Windows program. It is also useful to preformat the data received prior to sharing the variables.

https://github.com/epics-extensions/CALab


## Serial communication analysis (RS232)

Free program is used to establish the serial communication protocols prior to sharing variable in EPICS. 

### SerialTest
SerialTest is a versatile and multi-platform program for protocols such as serial, TCP, and bluetooth. Periodic command can be sent and received value can be plotted in the graph.

https://github.com/wh201906/SerialTest

### SerialDebug2 (jpn)
SerialDebug2 is available in the Japanese language only and discontinued. However, the basic function is still useful for double check. The HEX and DEC can be mixed as a command string.

http://mdrtech.web.fc2.com/upload/upload.htm

https://zatumemoblog.com/serialdebug2/

### SerialTool
SerialTool can add various CRC as the sum check protocols. The free version is limited in its functions. The website cannot be accessed from SLRI.

https://serialtool.com/


## String convertion

EPICS utilizes the HEX, decimal, and ASCII strings. The references of these strings are listed below.

### Hex to decimal converter
https://www.rapidtables.com/convert/number/hex-to-ascii.html

### ASCII table
http://facweb.cs.depaul.edu/sjost/it212/documents/ascii-pr.htm


## IOC device manual and script

The following devices are ppotential candidates for IOCs in the EPICS monitoring system. The detailed resources are listed below.

### AML PCG1 Vacuum Ion Gauge
The ion gauge is used in the analysis chamber of the PES station. The connection is established, but the string does not match in sometimes.

#### Manual
https://arunmicro.com/documentation/Manual_PGC1.pdf

https://arunmicro.com/products/ion-gauge-controller/

#### Script
https://github.com/mehmetbozdogan/arunNgc2dUhvPressureGauge


### Agilent Digital Multimeter 34401A 6-1/2 digit multimeter

Multimeter is tested as one of IOCs devices. The only one of voltage, current, and registivity can be monitored at a time.

#### Manual
http://instructor.physics.lsa.umich.edu/adv-labs/Tools_Resources/HP%2034401A%20user%27s%20guide.pdf

#### Script

https://github.com/lnls-dig/agilent33521a-epics-ioc/tree/master

https://github.com/epics-modules/ip/blob/6206afedb94db491a385ffd0c66f9223140a503e/ipApp/Db/HP_Agilent_PS66xxA.proto#L4


### Pfeiffer CCG TPG300 and full-range gauge TPG261 controllers

CCG controllers are used in the PES MBE and FEAL chambers. CCG controllers are also connected to the EPICS in the accelerator network. The serial device server can be configured to connect the EPICS in BL3.2U, which was confirmed before the ACC takeover.

#### Manual
http://lmu.web.psi.ch/docu/manuals/bulk_manuals/Pfeiffer/TPG_300.pdf

https://www.idealvac.com/files/ManualsII/Pfeiffer_Single_Gauge_TPG261.pdf

#### Script
https://epics.anl.gov/tech-talk/2021/msg00373.php

https://panda-repo.gsi.de/pandadcs/epics-files/-/tree/master/

https://github.com/ISISComputingGroup/EPICS-TPG/tree/master/TPGSup


### Varian Dual Ion pump controller: 929-7014-M003

The ion pump controller is used in the PES MBE chamber.

#### Manual

https://adms.fnal.gov/vacuum/manuals/varianip/CD_Ion/PDF/900-094/DUAL.pdf

#### Script
https://github.com/epics-modules/ip/blob/master/ipApp/Db/VarianDualIP.db


### Keithley 6482/6514 pico ammeter/system electrometer

Ampmeter monitors the photocurrent from the sample manipulator or gold mesh/plate in the beamline.

#### Manual
https://download.tek.com/manual/6514-901-01(D-May2003)(Instruction).pdf


#### Script
https://github.com/slaclab/Keithley6482/tree/master

### Kodiak Lytron chiller: RC045H03CG3M439

Chiller is used to cool down the cryopump compressor. The connection is established but the communication failed.

#### Manual
https://info.boydcorp.com/hubfs/Thermal/Liquid-Cooling/Boyd-Recirculating-Chiller-Technical-Manual-820-0043.pdf

https://www.boydcorp.com/thermal/liquid-cooling-systems/chillers.html



### Wattsine RF power supply (433MHz-200W-CCFA Solid State Microwave Power Generator)

RF power supply is used in the VUV light source. The connection is established but the communication failed.

#### Manual
https://www.wattsine.com/productview-11-1.html


### Lake Shore Temperature Controller 335

Temperature Controller 335 is used in the cryostat manipulator. The latest 335 model has GPIB or USB interface. USB interface cannot be accessed without the driver from the Lake Shore. The caLab is used to get the temperature from the VI program.

#### Manual
https://www.lakeshore.com/docs/default-source/product-downloads/335_manual.pdf

#### Script
https://github.com/epics-modules/ip/blob/master/ipApp/Db/LakeShore335.db


### NI SCB-68 shielded I/O connector block for the NI multifunction card PCI-6052E

NI SCB-68 is used to monitor the temperature nearby the PES station. The connecting box of the multifunction card has an internal temperature sensor (cold-junction compensation circuitry) to calibrate the inputs from the TC.  The caLab is used to get the temperature from the VI program.

#### Manual
https://biomech.hacettepe.edu.tr/manuals/NI%206052E%20User%20Manual.pdf


## Guide to search the StreamDevice scripts online

First of all, find the template from the Github linked below.

https://github.com/epics-modules/ip/blob/master/ipApp/Db/

Second, search in the tech-talk.

https://epics.anl.gov/

Third, google and search in github.

Fourth, dig into KEK Tobiyama site.

http://ahfb1.kek.jp/~tobiyama/epics/default.html


## Progress and summary

`20240306` 6 devices are connected to the EPICS via the serial device server, and 2 IOCs are connected online via CALab from the Windows PC in the PES station. The serial device server in the beamline control station connects and shares the vacuum pressures from 11 CCG gauges.













