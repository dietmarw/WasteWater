within WasteWater;
package Components "Main components in order to build a WW plant"
  extends Modelica.Icons.Package;
model deni "Denitrification tank"
  extends Interfaces.Tank(useAir=false);
  extends WasteWater.Icons.deni;

  /* tank specific parameters */
  inner parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank"
    annotation(Dialog(group="Volume"));

//    replaceable model ASMx = Interfaces.ASM2d
//      constrainedby Interfaces.ASMbase
//      annotation (choicesAllMatching=true);

Interfaces.ASM1 ASM1 if BioTreat == Types.BioTreatment.ASM1 annotation (Placement(transformation(extent={{-10,30},{10,50}})));
Interfaces.ASM1 ASM2d if BioTreat == Types.BioTreatment.ASM2d annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Interfaces.ASM1 ASM3 if BioTreat == Types.BioTreatment.ASM3 annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

  protected
  parameter Types.BioTreatment BioTreat=WWS.BioTreat "Type of biological treatment set in WWS";

equation

  connect(ASM1.T, T) annotation (Line(points={{-9,44},{-40,44},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM2d.T, T) annotation (Line(points={{-9,4},{-40,4},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM3.T, T) annotation (Line(points={{-9,-36},{-40,-36},{-40,40},{-90,40}}, color={0,0,127}));
  connect(ASM1.Out, Out) annotation (Line(points={{10,40},{40,40},{40,0},{100,0}}, color={191,95,0}));
  connect(ASM2d.Out, Out) annotation (Line(points={{10,0},{100,0}}, color={191,95,0}));
  connect(ASM3.Out, Out) annotation (Line(points={{10,-40},{40,-40},{40,0},{100,0}}, color={191,95,0}));
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

model nitri "Nitrification (aerated) tank"
  extends Interfaces.Tank(useAir=true);
  extends Icons.nitri;

 /* tank specific parameters */
  inner parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank";

  // aeration system dependent parameters
  parameter Real alpha=0.7 "Oxygen transfer factor";
  parameter Modelica.SIunits.Length de=4.5 "depth of aeration";
  parameter Real R_air=23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
  WWU.MassConcentration So_sat "Dissolved oxygen saturation";

Interfaces.ASM1 ASM1 if BioTreat == Types.BioTreatment.ASM1 annotation (Placement(transformation(extent={{-10,30},{10,50}})));
Interfaces.ASM1 ASM2d if BioTreat == Types.BioTreatment.ASM2d annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Interfaces.ASM1 ASM3 if BioTreat == Types.BioTreatment.ASM3 annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

  protected
  parameter Types.BioTreatment BioTreat=WWS.BioTreat "Type of biological treatment set in WWS";


  public
    WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
equation

  // Temperature dependent oxygen saturation by Simba
  So_sat =13.89 + (-0.3825 + (0.007311 - 0.00006588*T)*T)*T;

  // extends the Oxygen differential equation by an aeration term
  // aeration [mgO2/l]; AirIn.Q_air needs to be in
  // Simulationtimeunit [m3*day^-1]
  aeration = (alpha*(So_sat - So)/So_sat*AirIn.Q_air*R_air*de)/V;
  // aeration = Kla * (So_sat - So);

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

    connect(T, ASM1.T) annotation (Line(points={{-90,40},{-40,40},{-40,44},{-9,44}}, color={0,0,127}));
    connect(T, ASM2d.T) annotation (Line(points={{-90,40},{-40,40},{-40,4},{-9,4}}, color={0,0,127}));
    connect(T, ASM3.T) annotation (Line(points={{-90,40},{-40,40},{-40,-36},{-9,-36}}, color={0,0,127}));
    connect(ASM1.In, In) annotation (Line(points={{-10,40},{-20,40},{-20,0},{-100,0}}, color={191,95,0}));
    connect(ASM2d.In, In) annotation (Line(points={{-10,0},{-100,0}}, color={191,95,0}));
    connect(ASM3.In, In) annotation (Line(points={{-10,-40},{-20,-40},{-20,0},{-100,0}}, color={191,95,0}));
    connect(ASM1.AirIn, AirIn) annotation (Line(points={{0,30},{0,20},{20,20},{20,-80},{0,-80},{0,-100}}, color={28,108,200}));
    connect(ASM2d.AirIn, AirIn) annotation (Line(points={{0,-10},{0,-20},{20,-20},{20,-80},{0,-80},{0,-100}}, color={28,108,200}));
    connect(ASM3.AirIn, AirIn) annotation (Line(points={{0,-50},{0,-100}}, color={28,108,200}));
    connect(ASM1.Out, Out) annotation (Line(points={{10,40},{40,40},{40,0},{100,0}}, color={191,95,0}));
    connect(ASM2d.Out, Out) annotation (Line(points={{10,0},{100,0}}, color={191,95,0}));
    connect(ASM3.Out, Out) annotation (Line(points={{10,-40},{40,-40},{40,0},{100,0}}, color={191,95,0}));
   annotation (
    Documentation(info="This component models the ASM1 processes and reactions taking place in an aerated (nitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

        - all soichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V     - volume of the tank [m3]
  alpha - oxygen transfer factor
  de    - depth of the aeration system [m]
  R_air - specific oxygen feed factor [g O2/(m3*m)]
"));
end nitri;
end Components;
