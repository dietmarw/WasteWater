within WasteWater;
package Components "Main components in order to build a WW plant"
  extends Modelica.Icons.Package;
model Deni "Denitrification tank"
  extends Interfaces.Tank(useAir=false);
  extends WasteWater.Icons.deni;

//    replaceable model ASMx = Interfaces.ASM2d
//      constrainedby Interfaces.ASMbase
//      annotation (choicesAllMatching=true);

Interfaces.ASM1 ASM1(V=V) if
                        BioTreat == Types.BioTreatment.ASM1 annotation (Placement(transformation(extent={{-10,30},{10,50}})));
Interfaces.ASM1 ASM2d(V=V) if
                         BioTreat == Types.BioTreatment.ASM2d annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Interfaces.ASM1 ASM3(V=V) if
                        BioTreat == Types.BioTreatment.ASM3 annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

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
end Deni;

model Mixer3 "Mixer of 3 flows"

  extends WasteWater.Icons.mixer3;
  Interfaces.WWFlow In1 annotation (Placement(transformation(extent={{-110,25},{-90,45}})));
  Interfaces.WWFlow In2 annotation (Placement(transformation(extent={{-110,-15},{-90,5}})));
  Interfaces.WWFlow In3 annotation (Placement(transformation(extent={{-110,-55},{-90,-35}})));
  Interfaces.WWFlow Out annotation (Placement(transformation(extent={{90,-14},{110,6}})));
equation

  In1.Q + In2.Q + In3.Q + Out.Q = 0;
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q + In3.Si*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Ss = (In1.Ss*In1.Q + In2.Ss*In2.Q + In3.Ss*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q + In3.Xi*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q + In3.Xs*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xbh = (In1.Xbh*In1.Q + In2.Xbh*In2.Q + In3.Xbh*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Xba = (In1.Xba*In1.Q + In2.Xba*In2.Q + In3.Xba*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Xp = (In1.Xp*In1.Q + In2.Xp*In2.Q + In3.Xp*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.So = (In1.So*In1.Q + In2.So*In2.Q + In3.So*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Sno = (In1.Sno*In1.Q + In2.Sno*In2.Q + In3.Sno*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q + In3.Snh*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Snd = (In1.Snd*In1.Q + In2.Snd*In2.Q + In3.Snd*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Xnd = (In1.Xnd*In1.Q + In2.Xnd*In2.Q + In3.Xnd*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q + In3.Salk*In3.Q)/(In1.Q + In2.Q
     + In3.Q);

  annotation (
    Documentation(info=
          "This component mixes 3 flows of wastewater (ASM1) of different concentration and different amount."));
end Mixer3;

model WWSource "Wastewater source"

  extends WasteWater.Icons.WWSource;
  Interfaces.WWFlow Out annotation (Placement(transformation(extent={{88,-80},{108,-60}})));
  Modelica.Blocks.Interfaces.RealInput data[14]
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation

  Out.Q =-data[1];
  Out.Si =data[2];
  Out.Ss =data[3];
  Out.Xi =data[4];
  Out.Xs =data[5];
  Out.Xbh =data[6];
  Out.Xba =data[7];
  Out.Xp =data[8];
  Out.So =data[9];
  Out.Sno =data[10];
  Out.Snh =data[11];
  Out.Snd =data[12];
  Out.Xnd =data[13];
  Out.Salk =data[14];

  annotation (
    Documentation(info="This component provides all ASM1 data at the influent of a wastewater treatment plant.
The dimension of InPort is 14.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 Si  [g COD/m3]
  3 Ss  [g COD/m3]
  4 Xi  [g COD/m3]
  5 Xs  [g COD/m3]
  6 Xbh [g COD/m3]
  7 Xba [g COD/m3]
  8 Xp  [g COD/m3]
  9 So  [g O2/m3]
 10 Sno [g N/m3]
 11 Snh [g N/m3]
 12 Snd [g N/m3]
 13 Xnd [g N/m3]
 14 Salk[mmol/l]
"));
end WWSource;

model SludgeSink "Wastesludge sink"
    import WasteWater;
  // only for graphical termination in diagram layer, no equation needed

  extends WasteWater.Icons.SludgeSink;
  WasteWater.Interfaces.WWFlow
                          In annotation (Placement(transformation(extent={{-110,-22},{-90,-2}}), iconTransformation(extent={{-110,-22},{-90,-2}})));
  annotation (
    Documentation(info="This component terminates the waste sludge stream of an ASM1 wastewater treatment plant model.
Storage or further sludge treatment is not jet considered."));
end SludgeSink;

model Divider2 "Flowdivider"

    // divides one flow of wastewater into 2 Flows; one amount needs to be specified

  extends WasteWater.Icons.divider2;
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.WWFlow Out1 annotation (Placement(transformation(extent={{90,12},{110,32}})));
  Interfaces.WWFlow Out2 annotation (Placement(transformation(extent={{90,-34},{110,-14}})));
equation

  In.Q + Out1.Q + Out2.Q = 0;

  Out1.Si = In.Si;
  Out1.Ss = In.Ss;
  Out1.Xi = In.Xi;
  Out1.Xs = In.Xs;
  Out1.Xbh = In.Xbh;
  Out1.Xba = In.Xba;
  Out1.Xp = In.Xp;
  Out1.So = In.So;
  Out1.Sno = In.Sno;
  Out1.Snh = In.Snh;
  Out1.Snd = In.Snd;
  Out1.Xnd = In.Xnd;
  Out1.Salk = In.Salk;

  Out2.Si = In.Si;
  Out2.Ss = In.Ss;
  Out2.Xi = In.Xi;
  Out2.Xs = In.Xs;
  Out2.Xbh = In.Xbh;
  Out2.Xba = In.Xba;
  Out2.Xp = In.Xp;
  Out2.So = In.So;
  Out2.Sno = In.Sno;
  Out2.Snh = In.Snh;
  Out2.Snd = In.Snd;
  Out2.Xnd = In.Xnd;
  Out2.Salk = In.Salk;

  annotation (
    Documentation(info=
          "This component divides one ASM1 wastewater flow into two ASM1 wastewater flows."));
end Divider2;

model EffluentSink "Receiving water (river)"
  // only for graphical termination in diagram layer, no equation needed

  extends WasteWater.Icons.EffluentSink;
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
  annotation (
    Documentation(info="This component terminates an ASM1 wastewater treatment plant model e.g. the wastewater flow to the receiving water.
"));
end EffluentSink;

  model SecClarModKrebs "ASM1 Secondary Settling Tank Model based on Krebs"

    extends WasteWater.Icons.SecClarKrebs;
    import WWSC = WasteWater.ASM1.SecClar.Krebs.Interfaces;
    extends WWSC.SCVar;
    extends WWSC.ratios;

    import SI = Modelica.SIunits;
    package WI = WasteWater.ASM1.Interfaces;
    package WWU = WasteWater.Types;
    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.SludgeVolumeIndex ISV=130 "Sludge Volume Index";
    Real te "thickening time in sludge layer in [d]";
    SI.Length hs "height of sludge layer";
    SI.Length he "height of excess layer";
    Interfaces.WWFlow
                    Feed annotation (Placement(transformation(extent={{-110,4},{-90,24}}), iconTransformation(extent={{-110,4},{-90,24}})));
    Interfaces.WWFlow Effluent
                              annotation (Placement(transformation(extent={{92,
              47},{112,67}})));
    Interfaces.WWFlow Return
                            annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}})));
    Interfaces.WWFlow Waste
                           annotation (Placement(transformation(extent={{20,
              -106},{40,-86}})));
  equation

    // total sludge concentration in clarifier feed
    Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

    // ratios of solid components
    rXs = Feed.Xs/Xf;
    rXbh = Feed.Xbh/Xf;
    rXba = Feed.Xba/Xf;
    rXp = Feed.Xp/Xf;
    rXi = Feed.Xi/Xf;
    rXnd = Feed.Xnd/Xf;

    /* following expression is only for steady state initial equation of XB and is necessary
     to calculate hs, if there would be problems with "initial()" in your modelica version
     leave out this term and initial XB (or hs) manually e.g. via script-file */
  //   if initial() then
  //     XB = Feed.Q/(0.7*(-(Return.Q + Waste.Q)))*Xf;
  //   end if;

    //thickening time in sludge layer in [d]
    te = 5/7*Asc*hs/(-(Return.Q + Waste.Q));

    //sludge concentration in sludge layer (unit of time in [h]) in [g/m3]
    XB = (1000/ISV*((te*24)^(1/3)))*1000;

    //sludge concentration of return
    XR = 0.7*XB;

    //ODE of height of sludge layer
    der(hs) = (Feed.Q*Xf - (-(Return.Q + Waste.Q))*XR)/(Asc/2*XB);

    //height of excess layer
    he = hsc - hs;

    // ODE of soluble components in first stirrer tank of the excess layer
    der(Si1) = (Feed.Q*Feed.Si - (-Effluent.Q)*Si1 - (-(Waste.Q + Return.Q))*
      Si1)/(Asc*he/2);
    der(Ss1) = (Feed.Q*Feed.Ss - (-Effluent.Q)*Ss1 - (-(Waste.Q + Return.Q))*
      Ss1)/(Asc*he/2);
    der(So1) = (Feed.Q*Feed.So - (-Effluent.Q)*So1 - (-(Waste.Q + Return.Q))*
      So1)/(Asc*he/2);
    der(Sno1) = (Feed.Q*Feed.Sno - (-Effluent.Q)*Sno1 - (-(Waste.Q + Return.Q))
      *Sno1)/(Asc*he/2);
    der(Snh1) = (Feed.Q*Feed.Snh - (-Effluent.Q)*Snh1 - (-(Waste.Q + Return.Q))
      *Snh1)/(Asc*he/2);
    der(Snd1) = (Feed.Q*Feed.Snd - (-Effluent.Q)*Snd1 - (-(Waste.Q + Return.Q))
      *Snd1)/(Asc*he/2);
    der(Salk1) = (Feed.Q*Feed.Salk - (-Effluent.Q)*Salk1 - (-(Waste.Q + Return.
      Q))*Salk1)/(Asc*he/2);

    // ODE of soluble components in second stirrer tank of the excess layer
    der(Si2) = ((-Effluent.Q)*Si1 - (-Effluent.Q)*Si2)/(Asc*he/2);
    der(Ss2) = ((-Effluent.Q)*Ss1 - (-Effluent.Q)*Ss2)/(Asc*he/2);
    der(So2) = ((-Effluent.Q)*So1 - (-Effluent.Q)*So2)/(Asc*he/2);
    der(Sno2) = ((-Effluent.Q)*Sno1 - (-Effluent.Q)*Sno2)/(Asc*he/2);
    der(Snh2) = ((-Effluent.Q)*Snh1 - (-Effluent.Q)*Snh2)/(Asc*he/2);
    der(Snd2) = ((-Effluent.Q)*Snd1 - (-Effluent.Q)*Snd2)/(Asc*he/2);
    der(Salk2) = ((-Effluent.Q)*Salk1 - (-Effluent.Q)*Salk2)/(Asc*he/2);

    // volume flow rates
    Feed.Q + Effluent.Q + Return.Q + Waste.Q = 0;

    // effluent, solid and soluble components (ASM1)
    Effluent.Si = Si2;
    Effluent.Ss = Ss2;
    Effluent.So = So2;
    Effluent.Sno = Sno2;
    Effluent.Snh = Snh2;
    Effluent.Snd = Snd2;
    Effluent.Salk = Salk2;
    Effluent.Xi = 0.0*XR;
    Effluent.Xs = 0.0*XR;
    Effluent.Xbh = 0.0*XR;
    Effluent.Xba = 0.0*XR;
    Effluent.Xp = 0.0*XR;
    Effluent.Xnd = 0.0*XR;

    // return sludge flow, solid and soluble components (ASM1)
    Return.Si = Si1;
    Return.Ss = Ss1;
    Return.So = So1;
    Return.Sno = Sno1;
    Return.Snh = Snh1;
    Return.Snd = Snd1;
    Return.Salk = Salk1;
    Return.Xi = rXi*XR;
    Return.Xs = rXs*XR;
    Return.Xbh = rXbh*XR;
    Return.Xba = rXba*XR;
    Return.Xp = rXp*XR;
    Return.Xnd = rXnd*XR;

    // waste sludge flow, solid and soluble components (ASM1)
    Waste.Si = Si1;
    Waste.Ss = Ss1;
    Waste.So = So1;
    Waste.Sno = Sno1;
    Waste.Snh = Snh1;
    Waste.Snd = Snd1;
    Waste.Salk = Salk1;
    Waste.Xi = rXi*XR;
    Waste.Xs = rXs*XR;
    Waste.Xbh = rXbh*XR;
    Waste.Xba = rXba*XR;
    Waste.Xp = rXp*XR;
    Waste.Xnd = rXnd*XR;
    annotation (
      Documentation(info="This component models an ASM1 secondary clarifier based on Krebs conceptional model.
It consists of two compartments: a \"sludge-bed\" and a clear water zone above.

Parameters:
  hsc -  height of clarifier [m]
  Asc -  surface area of secondary clarifier [m2]
  ISV -  Sludge Volume Index [ml/g]
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-90,80},{92,14}},
            lineColor={0,0,255},
            lineThickness=0.5),
          Rectangle(
            extent={{-90,14},{92,-86}},
            lineColor={0,0,255},
            lineThickness=0.5),
          Polygon(
            points={{-8,-20},{-8,-38},{-16,-38},{0,-48},{16,-38},{8,-38},{8,-20},
                {-8,-20}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,34},{-8,54},{-16,54},{0,64},{16,54},{8,54},{8,34},{-8,
                34}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Text(extent={{-90,78},{-34,66}}, textString=
                                               "top_layer"),
          Text(extent={{-90,20},{-30,-16}}, textString=
                                                "bottom_layer"),
          Line(
            points={{-90,48},{92,48}},
            color={0,0,255},
            pattern=LinePattern.Dash)}));
  end SecClarModKrebs;

model Nitri "ASM1 nitrification tank"
  // nitrification (aerated) tank, based on the ASM1 model

  extends WasteWater.Icons.nitri;
  extends ASM1.Interfaces.ASM1base;

  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of nitrification tank";

  // aeration system dependent parameters
  parameter Real alpha=0.7 "Oxygen transfer factor";
  parameter Modelica.SIunits.Length de=4.5 "depth of aeration";
  parameter Real R_air=23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
  WWU.MassConcentration So_sat "Dissolved oxygen saturation";

  ASM1.Interfaces.AirFlow AirIn annotation (Placement(transformation(extent={{-5,-103},{5,-93}})));
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
end Nitri;

model Blower "Blower for the aeration of the nitrification tanks"
  extends WasteWater.Icons.blower;

  parameter WWU.VolumeFlowRate Q_max=20000 "maximum blower capacity";
  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum blower capacity";

  Interfaces.AirFlow AirOut annotation (Placement(transformation(extent={{-10,90},{10,110}}), iconTransformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(
        origin={110,-30},
        extent={{-10,-10},{10,10}},
        rotation=180)));

  protected
  Real H "Help variable to reduce expressions";

equation

  H = 0.5*(-Q_min + Q_max) + u*0.5*(-Q_min + Q_max) + Q_min;
  AirOut.Q_air = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H);

  annotation (
    Documentation(info="This component models a blower of a wastewater treatment plant which generates an airflow that is needed
for the nitrification.
The blower is connected to the nitrification tank.
The airflow is controlled by a signal u (-1 <= u <= 1).

Parameter:

  Qmax - maximum blower capacity [m3 Air/d], this is produced when the control signal u is 1 or greater.
  Qmin - minimum blower capacity [m3 Air/d], this is produced when the control signal u is -1 or below.

"));
end Blower;

model Pump "ASM1 wastewater pump"

  extends WasteWater.Icons.pump;
  package WWU = WasteWater.Types;

  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum pump capacity";
  parameter WWU.VolumeFlowRate Q_max=20000 "maximum pump capacity";

  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,-43},{-90,-23}})));
  Interfaces.WWFlow Out annotation (Placement(transformation(extent={{90,18},{110,38}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-100,16},{-80,36}})));

  protected
   Real H "Help variable to reduce expressions";

equation

  H = 0.5*(-Q_min + Q_max) + u*0.5*(-Q_min + Q_max) + Q_min;
  Out.Q = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H);

  Out.Q + In.Q = 0;
  Out.Si = In.Si;
  Out.Ss = In.Ss;
  Out.Xi = In.Xi;
  Out.Xs = In.Xs;
  Out.Xbh = In.Xbh;
  Out.Xba = In.Xba;
  Out.Xp = In.Xp;
  Out.So = In.So;
  Out.Sno = In.Sno;
  Out.Snh = In.Snh;
  Out.Snd = In.Snd;
  Out.Xnd = In.Xnd;
  Out.Salk = In.Salk;

  annotation (
    Documentation(info="This component models an ASM1 wastewater pump. It generates a wastewater flow
that is controlled by the signal u (-1 <= u <=1).

Parameter:

  Qmax - maximum pump capacity [m3/d], this is produced when the control signal u is 1 or greater.
  Qmin - minimum pump capacity [m3/d], this is produced when the control signal u is -1 or below.

"));
end Pump;
end Components;
