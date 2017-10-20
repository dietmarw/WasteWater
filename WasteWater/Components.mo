within WasteWater;
package Components "Main components in order to build a WW plant"
  extends Modelica.Icons.Package;
model deni "Denitrification tank"
  extends Interfaces.Tank(useAir=false);
  extends WasteWater.Icons.deni;

  /* tank specific parameters */
  parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank";
  parameter WWSystem.WWType WWtype=WasteWater.WWSystem.WWType.ASM1;
  parameter Boolean Foo;

//    replaceable model ASMx = Interfaces.ASM2d
//      constrainedby Interfaces.ASMbase
//      annotation (choicesAllMatching=true);

Interfaces.ASM1 ASM1 if ASM1true annotation (Placement(transformation(visible=ASM1true,extent={{-10,30},{10,50}})));

//Interfaces.ASM2d ASM2d if ASM2dtrue annotation (Placement(transformation(visible=ASM2dtrue,extent={{-10,-10},{10,10}})));
//Interfaces.ASM2d ASM3 if ASM2dtrue annotation (Placement(transformation(visible=ASM2dtrue, extent={{-10,-50},{10,-30}})));


  protected
  Boolean ASM1true = WWtype==WWSystem.WWType.ASM1;
  Boolean ASM2dtrue = WWtype==WWSystem.WWType.ASM2d;

equation

  /* volume dependent dilution term of each concentration */

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

  connect(ASM1.T, T) annotation (Line(points={{-9,44},{-40,44},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM2d.T, T) annotation (Line(points={{-9,4},{-40,4},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM3.T, T) annotation (Line(points={{-9,-36},{-40,-36},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM1.Out, Out) annotation (Line(points={{10,40},{54,40},{54,0},{100,0}}, color={191,95,0}));
  connect(ASM2d.Out, Out) annotation (Line(points={{10,0},{100,0}}, color={191,95,0}));
  connect(ASM3.Out, Out) annotation (Line(points={{10,-40},{54,-40},{54,0},{100,0}}, color={191,95,0}));
  connect(In, ASM2d.In) annotation (Line(points={{-100,0},{-10,0}}, color={191,95,0}));
  connect(In, ASM1.In) annotation (Line(points={{-100,0},{-20,0},{-20,40},{-10,40}}, color={191,95,0}));
  connect(In, ASM3.In) annotation (Line(points={{-100,0},{-20,0},{-20,-40},{-10,-40}}, color={191,95,0}));
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
