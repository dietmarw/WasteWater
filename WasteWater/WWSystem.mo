within WasteWater;
record WWSystem "Global settings for the waste water system to be modelled."
  extends Modelica.Icons.Record;
 type WWType = enumeration(
      ASM1 "ASM1",
      ASM2d "ASM2d",
      ASM3 "ASM3") "Type of WWSystem";

      parameter WWType WWtype=WasteWater.WWSystem.WWType.ASM1;
      annotation(defaultComponentName="WWS");
end WWSystem;
