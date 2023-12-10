<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="_1000_SCTR" Source="_1000_SCTRL.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1100_CSYS" Source="_1100_CSYS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1500_PPS" Source="_1500_PPS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1700_HMI" Source="_1700_HMI.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1600_SSYS" Source="_1600_SSYS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1400_SRS" Source="_1400_SRS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1300_CS2" Source="_1300_CS2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="_1200_CS1" Source="_1200_CS1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <Binaries>
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="Library" Source="Libraries.Library.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="runtime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asieccon" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>