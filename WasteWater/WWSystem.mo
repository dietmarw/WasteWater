within WasteWater;
record WWSystem "Global settings for the waste water system to be modelled."
  extends Modelica.Icons.Record;

  parameter Types.BioTreatment BioTreat=WasteWater.Types.BioTreatment.ASM1;
      annotation(defaultComponentName="WWS");
end WWSystem;
