#!../bin/linux-aarch64/streamioc

#- You may have to change streamioc to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet "P" "$(P=BL32U)"
epicsEnvSet "R" "$(R=CCG01)"
epicsEnvSet "IP" "$(IP=192.168.127.101)"
epicsEnvSet "S" "$(S=A1)"

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/streamioc.dbd"
streamioc_registerRecordDeviceDriver pdbbase

## TCP port
drvAsynIPPortConfigure("TCPPORT1","192.168.127.254:4001",0,0,0)
drvAsynIPPortConfigure("TCPPORT2","192.168.127.254:4002",0,0,0)
drvAsynIPPortConfigure("TCPPORT3","192.168.127.254:4003",0,0,0)
drvAsynIPPortConfigure("TCPPORT4","192.168.127.254:4004",0,0,0)
drvAsynIPPortConfigure("TCPPORT5","192.168.127.254:4005",0,0,0)

## drvAsynIPPortConfigure("TCPPORT_$(P)_01","$(IP):4001",0,0,0)

## Load record instances
#dbLoadRecords("db/xxx.db","user=bl3")

## TCP port
# dbLoadRecords("spsioc/blank.db","PORT='TCPPORT'")
dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT1',P=BL32Ua,R=MBE_CCG,S=A1")
dbLoadRecords("spsioc/Pfeiffer_TPG256A.db","PORT='TCPPORT2'")
dbLoadRecords("spsioc/VarianDualIP.db","PORT='TCPPORT3',P=BL32Ua,R=MBE_IP,CHAN=1,HIHI=10,HIGH=3")
dbLoadRecords("spsioc/amlGauge.db","PORT='TCPPORT4',sys=BL32Ua,sec=PES,dev=AML")
dbLoadRecords("spsioc/Agilent_volt.db","PORT='TCPPORT5'")

#dbLoadRecords("spsioc/Pfeiffer_TPG300.db","PORT='TCPPORT_$(P)_01',P=$(P),R=CCG01,S=A1")


cd "${TOP}/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=bl3"
