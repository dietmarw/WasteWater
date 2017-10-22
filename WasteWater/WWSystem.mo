within WasteWater;
record WWSystem "Global settings for the waste water system to be modelled."


  parameter Types.BioTreatment BioTreat=WasteWater.Types.BioTreatment.ASM1;
      annotation(defaultComponentName="WWS", Icon(graphics={
        Rectangle(
          lineColor={191,95,0},
          fillColor={191,95,0},
          fillPattern=FillPattern.Sphere,
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25), Text(
          extent={{-80,82},{80,-80}},
          lineColor={255,255,255},
          fillPattern=FillPattern.Sphere,
          fillColor={227,170,0},
          textString="%BioTreat"),
        Text(
          extent={{-100,180},{100,120}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          fillColor={227,170,0},
          textString="%name")}));
end WWSystem;
