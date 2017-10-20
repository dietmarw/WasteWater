within WasteWater;
package Components "Main components in order to build a WW plant"
  extends Modelica.Icons.Package;
model deni "Denitrification tank"
  //denitrification tank based on the ASM1 model

  extends WasteWater.Icons.deni;
  extends ASM1.Interfaces.ASM1base;

  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank";

    replaceable Interfaces.ASM1 aSM1_1 constrainedby Interfaces.ASMbase annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
    Interfaces.WWFlow Out1(FilledIcon=false) annotation (Placement(transformation(extent={{54,-14},{74,6}})));
equation

  aeration = 0;
  // no aeration in this tank //

  // volume dependent dilution term of each concentration

  inputSi = (In.Si - Si)*In.Q/V;
  inputSs = (In.Ss - Ss)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXbh = (In.Xbh - Xbh)*In.Q/V;
  inputXba = (In.Xba - Xba)*In.Q/V;
  inputXp = (In.Xp - Xp)*In.Q/V;
  inputSo = (In.So - So)*In.Q/V;
  inputSno = (In.Sno - Sno)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSnd = (In.Snd - Snd)*In.Q/V;
  inputXnd = (In.Xnd - Xnd)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;

    connect(aSM1_1.Out, Out1) annotation (Line(points={{12,0},{30,0},{30,-8},{64,-8},{64,-4}}, color={191,95,0}));
  annotation (
    Documentation(info="This component models the ASM1 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V - volume of the tank [m3]
"));
end deni;
end Components;
