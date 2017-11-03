within WasteWater;
package Components "Main components in order to build a WW plant"
  extends Modelica.Icons.Package;
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

model Deni "Denitrification tank"
  extends WasteWater.Icons.deni;
  /* tank specific parameters */
  parameter Modelica.SIunits.Volume V(start=1000) "Volume of denitrification tank"
    annotation(Dialog(group="Tank"));

//    replaceable model ASMx = Interfaces.ASM2d
//      constrainedby Interfaces.ASMbase
//      annotation (choicesAllMatching=true);

Interfaces.ASM1 ASM1(V=V) if BioTreat == Types.BioTreatment.ASM1
  annotation (Placement(transformation(extent={{-10,30},{10,50}})));
Interfaces.ASM1 ASM2d(V=V) if BioTreat == Types.BioTreatment.ASM2d
  annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Interfaces.ASM1 ASM3(V=V) if BioTreat == Types.BioTreatment.ASM3
  annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

Interfaces.WWFlow In
  annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
Interfaces.WWFlow Out
  annotation (Placement(transformation(extent={{90,-10},{110,10}})));
Interfaces.WWFlow MeasurePort "Just a simple connector to the outport" annotation (Placement(transformation(extent={{54,34},{66,46}})));
Modelica.Blocks.Interfaces.RealInput T
   annotation (Placement(transformation(extent={{-100,30},{-80,50}})));

outer WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

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
  connect(Out, MeasurePort) annotation (Line(points={{100,0},{80,0},{80,40},{60,40}}, color={191,95,0}));
  annotation (
    Documentation(info="This component models the ASM1 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V - volume of the tank [m3]
"));
end Deni;

model Nitri "Nitrification tank"
  extends WasteWater.Icons.nitri;
  /* tank specific parameters */
  parameter Modelica.SIunits.Volume V(start=1000) "Volume of denitrification tank"
    annotation(Dialog(group="Tank"));

//    replaceable model ASMx = Interfaces.ASM2d
//      constrainedby Interfaces.ASMbase
//      annotation (choicesAllMatching=true);

Interfaces.ASM1 ASM1(V=V, useAir=true) if
                             BioTreat == Types.BioTreatment.ASM1
  annotation (Placement(transformation(extent={{-10,30},{10,50}})));
Interfaces.ASM1 ASM2d(V=V, useAir=true) if
                              BioTreat == Types.BioTreatment.ASM2d
  annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Interfaces.ASM1 ASM3(V=V, useAir=true) if
                             BioTreat == Types.BioTreatment.ASM3
  annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

Interfaces.WWFlow In
  annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
Interfaces.WWFlow Out
  annotation (Placement(transformation(extent={{90,-10},{110,10}})));
Modelica.Blocks.Interfaces.RealInput T
   annotation (Placement(transformation(extent={{-100,30},{-80,50}})));

outer WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

  Interfaces.AirFlow AirIn annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Interfaces.WWFlow MeasurePort "Just a simple connector to the outport" annotation (Placement(transformation(extent={{54,34},{66,46}})));

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
  connect(AirIn, ASM3.AirIn) annotation (Line(points={{0,-100},{0,-50}}, color={28,108,200}));
  connect(AirIn, ASM2d.AirIn) annotation (Line(points={{0,-100},{0,-10}}, color={28,108,200}));
  connect(AirIn, ASM1.AirIn) annotation (Line(points={{0,-100},{0,30}}, color={28,108,200}));
  connect(Out, MeasurePort) annotation (Line(points={{100,0},{80,0},{80,40},{60,40}}, color={191,95,0}));
  annotation (
    Documentation(info="This component models the ASM1 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V - volume of the tank [m3]
"));
end Nitri;

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

model EffluentSink "Receiving water (river)"
  // only for graphical termination in diagram layer, no equation needed

  extends WasteWater.Icons.EffluentSink;
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
  annotation (
    Documentation(info="This component terminates an ASM1 wastewater treatment plant model e.g. the wastewater flow to the receiving water.
"));
end EffluentSink;

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
  AirOut.Q_air = (if H > Q_max then Q_max else if H < Q_min then Q_min else H);

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

  package WIP
    extends Modelica.Icons.InternalPackage;
    model ASM1SmallPlantRun_wip "Small WWTP Configuration"
      extends Modelica.Icons.Example;

      //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
      //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark

      Components.EffluentSink
                        Effluent annotation (Placement(transformation(extent={{90,-32},{110,-12}})));
      Components.SludgeSink
                      WasteSludge annotation (Placement(transformation(extent={{88,-56},{108,-36}})));
      Components.Divider2
                    divider annotation (Placement(transformation(extent={{20,-6},
                {40,14}})));
      Deni_wip tank1(
        V=3000,
        Si(start=WWS.Tank1_Si, fixed=true),
        Ss(start=WWS.Tank1_Ss, fixed=true),
        So(start=WWS.Tank1_So, fixed=true),
        Sno(start=WWS.Tank1_Sno, fixed=true),
        Snh(start=WWS.Tank1_Snh, fixed=true),
        Snd(start=WWS.Tank1_Snd, fixed=true),
        Xi(start=WWS.Tank1_Xi, fixed=true),
        Xs(start=WWS.Tank1_Xs, fixed=true),
        Xbh(start=WWS.Tank1_Xbh, fixed=true),
        Xba(start=WWS.Tank1_Xba, fixed=true),
        Xp(start=WWS.Tank1_Xp, fixed=true),
        Xnd(start=WWS.Tank1_Xnd, fixed=true),
        Salk(start=WWS.Tank1_Salk, fixed=true),
        useAir=false) annotation (Placement(transformation(extent={{-71,0},{-51,20}})));
      Nitri_wip tank2(
        V=1333,
        Si(start=WWS.Tank2_Si, fixed=true),
        Ss(start=WWS.Tank2_Ss, fixed=true),
        So(start=WWS.Tank2_So, fixed=true),
        Sno(start=WWS.Tank2_Sno, fixed=true),
        Snh(start=WWS.Tank2_Snh, fixed=true),
        Snd(start=WWS.Tank2_Snd, fixed=true),
        Xi(start=WWS.Tank2_Xi, fixed=true),
        Xs(start=WWS.Tank2_Xs, fixed=true),
        Xbh(start=WWS.Tank2_Xbh, fixed=true),
        Xba(start=WWS.Tank2_Xba, fixed=true),
        Xp(start=WWS.Tank2_Xp, fixed=true),
        Xnd(start=WWS.Tank2_Xnd, fixed=true),
        Salk(start=WWS.Tank2_Salk, fixed=true),
        useAir=true) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
      Nitri_wip tank3(
        V=1333,
        Si(start=WWS.Tank3_Si, fixed=true),
        Ss(start=WWS.Tank3_Ss, fixed=true),
        So(start=WWS.Tank3_So, fixed=true),
        Sno(start=WWS.Tank3_Sno, fixed=true),
        Snh(start=WWS.Tank3_Snh, fixed=true),
        Snd(start=WWS.Tank3_Snd, fixed=true),
        Xi(start=WWS.Tank3_Xi, fixed=true),
        Xs(start=WWS.Tank3_Xs, fixed=true),
        Xbh(start=WWS.Tank3_Xbh, fixed=true),
        Xba(start=WWS.Tank3_Xba, fixed=true),
        Xp(start=WWS.Tank3_Xp, fixed=true),
        Xnd(start=WWS.Tank3_Xnd, fixed=true),
        Salk(start=WWS.Tank3_Salk, fixed=true),
        useAir=true) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
       Components.SecClarModKrebs                    Settler(
        Si1(start=WWS.Settler_Si1, fixed=true),
        Ss1(start=WWS.Settler_Ss1, fixed=true),
        So1(start=WWS.Settler_So1, fixed=true),
        Sno1(start=WWS.Settler_Sno1, fixed=true),
        Snh1(start=WWS.Settler_Snh1, fixed=true),
        Snd1(start=WWS.Settler_Snd1, fixed=true),
        Salk1(start=WWS.Settler_Salk1, fixed=true),
        Si2(start=WWS.Settler_Si2, fixed=true),
        Ss2(start=WWS.Settler_Ss2, fixed=true),
        So2(start=WWS.Settler_So2, fixed=true),
        Sno2(start=WWS.Settler_Sno2, fixed=true),
        Snh2(start=WWS.Settler_Snh2, fixed=true),
        Snd2(start=WWS.Settler_Snd2, fixed=true),
        Salk2(start=WWS.Settler_Salk2, fixed=true),
        hs(start=WWS.Settler_hs, fixed=true))
          annotation (Placement(transformation(extent={{50,0},{70,20}})));

      Components.Mixer3
                  mixer annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
      Components.WWSource
                    WWSource annotation (Placement(transformation(extent={{-80,70},{-100,90}})));
      Components.Blower
                  blower1(Q_max=34574.2654508612) annotation (Placement(
            transformation(extent={{-40,-60},{-20,-40}})));
      Components.Blower
                  blower2(Q_max=34574.2654508612) annotation (Placement(
            transformation(extent={{-10,-60},{10,-40}})));
      Sensors.sensor_O2
                     sensor_O2 annotation (Placement(transformation(extent={{-4,30},{16,50}})));
      Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
              extent={{62,50},{82,70}})));
      Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500, initType=Modelica.Blocks.Types.Init.InitialState)
        annotation (Placement(transformation(extent={{88,50},{108,70}})));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-80,-80},{-60,-60}})));
      Components.Pump
                RecyclePump(Q_max=46115) annotation (Placement(transformation(
            origin={-80,-12},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Components.Pump
                ReturnPump(Q_max=9223) annotation (Placement(transformation(
            origin={30,-30},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Components.Pump
                WastePump(Q_max=193) annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
      Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                 annotation (Placement(
            transformation(extent={{20,-70},{40,-50}})));
      Modelica.Blocks.Sources.Constant Temperature(k=15)
        annotation (Placement(transformation(extent={{-96,48},{-84,60}})));
      Sensors.sensor_NH
                     sensor_NH1 annotation (Placement(transformation(extent={{80,24.5},{96,39.5}})));
      Sensors.sensor_NO         sensor_NO1 annotation (Placement(transformation(
              extent={{100,24},{116,40}})));
      Sensors.sensor_TKN         sensor_TKN1 annotation (Placement(transformation(
              extent={{100,8},{116,-8}})));
      Sensors.sensor_COD         sensor_COD1 annotation (Placement(transformation(
              extent={{80,8},{96,-8}})));
      Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
        annotation (Placement(transformation(extent={{29,50},{49,70}})));
      Sensors.sensor_TSS         sensor_TSS1 annotation (Placement(transformation(
              extent={{32,20},{48,36}})));
      Modelica.Blocks.Sources.Constant constantInflow[14](k={WWS.Q,WWS.Si,WWS.Ss,WWS.Xi,WWS.Xs,WWS.Xbh,WWS.Xba,WWS.Xp,WWS.So,WWS.Sno,WWS.Snh,WWS.Snd,WWS.Xnd,WWS.Salk}) annotation (Placement(transformation(extent={{-50,70},{-70,90}})));
      inner WWSystem WWS
                   annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
    equation
      connect(tank3.Out, divider.In) annotation (Line(points={{10,10},{17,10},{17,4},{20,4}}));
      connect(mixer.Out, tank1.In) annotation (Line(points={{-80,29.6},{-77,29.6},{-77,10},{-71,10}}));
      connect(mixer.In1, WWSource.Out) annotation (Line(points={{-100,33.5},{-100,34},{-110,34},{-110,73},{-99.8,73}}));
      connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{0,-40},{0,0}}));
      connect(Feedback.y, PI1.u) annotation (Line(points={{81,60},{86,60}}));
      connect(PI1.y, blower2.u) annotation (Line(points={{109,60},{118,60},{118,-80},{16,-80},{16,-53},{11,-53}}));
      connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,1.6},{46,1.6},{46,-8.7},{-70,-8.7}}));
      connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-90,-14.8},{-104,-14.8},{-104,26},{-100,26},{-100,25.5}}));
      connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{20,-32.8},{20,-32},{-112,-32},{-112,29.5},{-100,29.5}}));
      connect(sensor_O2.So, Feedback.u2)
        annotation (Line(points={{15.8,40},{72,40},{72,52}}));
      connect(OxygenSetpoint.y, Feedback.u1)
        annotation (Line(points={{50,60},{64,60}}, color={0,0,255}));
      connect(Constant1.y, blower1.u) annotation (Line(points={{-59,-70},{-13.2,-70},{-13.2,-53},{-19,-53}},
                                            color={0,0,255}));
      connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{80,-47.2},{84,-47.2},{84,-47.2},{88,-47.2}}));
      connect(WastePump.u, Constant2.y)
        annotation (Line(points={{61,-47.4},{48,-47.4},{48,-60},{41,-60}},
                                                                       color={0,0,
              255}));
      connect(tank2.Out, tank3.In) annotation (Line(points={{-20,10},{-10,10}}));
      connect(tank1.Out, tank2.In) annotation (Line(points={{-51,10},{-40,10}}));
      connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-30,-40},{-30,0}}));
      connect(Constant1.y, RecyclePump.u) annotation (Line(points={{-59,-70},{-49,-70},{-49,-14.6},{-71,-14.6}},
                                           color={0,0,255}));
      connect(Settler.Return, ReturnPump.In) annotation (Line(points={{57,0.4},{57,-26.7},{40,-26.7}}));
      connect(WastePump.In, Settler.Waste) annotation (Line(points={{60,-53.3},{52,-53.3},{52,-31},{63,-31},{63,0.4}}));
      connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{88,24.5},{88,15.7},{70.2,15.7}}));
      connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{108,24},{108,15.7},{70.2,15.7}}));
      connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{108,8},{108,15.7},{70.2,15.7}}));
      connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{88,8},{88,15.7},{70.2,15.7}}));
      connect(Constant2.y, ReturnPump.u) annotation (Line(points={{41,-60},{48,-60},{48,-32.6},{39,-32.6}},
                                             color={0,0,255}));
      connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.2},{44.5,6.2},{44.5,11.4},{50,11.4}}));
      connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40,20},{40,6.2}}));

      connect(constantInflow.y, WWSource.data) annotation (Line(points={{-71,80},{-81,80}}, color={0,0,127}));
      connect(Temperature.y, tank1.T) annotation (Line(points={{-83.4,54},{-74,54},{-74,14},{-70,14}}, color={0,0,127}));
      connect(tank2.T, Temperature.y) annotation (Line(points={{-39,14},{-44,14},{-44,54},{-83.4,54}}, color={0,0,127}));
      connect(tank3.T, Temperature.y) annotation (Line(points={{-9,14},{-16,14},{-16,54},{-83.4,54}},  color={0,0,127}));
      connect(Effluent.In, Settler.Effluent) annotation (Line(points={{90,-20},{80,-20},{80,15.7},{70.2,15.7}}, color={191,95,0}));
      connect(sensor_O2.In, tank3.Out) annotation (Line(points={{6,30},{10,30},{10,10}}, color={191,95,0}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            initialScale=0.1,
            extent={{-120,-100},{120,100}}),
                         graphics={Line(points={{-22,58},{-22,58}}, color={0,0,
                  255})}),
        Documentation(info="This fictitious plant provides an ASM1 example model with a small number of equations.
It consists of one denitrification and 2 nitrification tanks and a settler.

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file small_asm1.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the
sensors at the effluent of the secondary clarifier.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de
"),     experiment(StopTime=14, Tolerance=1e-07),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            grid={2,2},
            initialScale=0.1,
            extent={{-100,-100},{100,100}})));
    end ASM1SmallPlantRun_wip;

  model Deni_wip "Denitrification tank"
    extends Interfaces.ASM1(useAir=false);
    extends WasteWater.Icons.deni;

  //    replaceable model ASMx = Interfaces.ASM2d
  //      constrainedby Interfaces.ASMbase
  //      annotation (choicesAllMatching=true);

    protected
    parameter Types.BioTreatment BioTreat=WWS.BioTreat "Type of biological treatment set in WWS";

  equation

    annotation (
      Documentation(info="This component models the ASM1 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V - volume of the tank [m3]
"));
  end Deni_wip;

  model Nitri_wip "Nitrification (aerated) tank, based on the ASM1 model"
     extends Interfaces.ASM1;
    extends WasteWater.Icons.nitri;

  equation

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
  end Nitri_wip;
  end WIP;
end Components;
