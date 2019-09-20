within WasteWater;
package Components "Main components in order to build a WW plant"
  record WWSystem "Global settings for the waste water system to be modelled."

    /* General */
    parameter Types.BioTreatment BioTreat=WasteWater.Types.BioTreatment.ASM1 "Type of biologial treatment (no effect yet)";
    parameter Real PI1_x=-0.0003511076570565 "Start output of controller";

    /* Inflow [15]*/
    //    parameter Boolean useCI=true "Use constant inflow?"; //not used yet
    parameter Types.VolumeFlowRate Q=21477 "Inflow" annotation (Dialog(tab="Inflow"));
    parameter Types.VolumeFlowRate Q_2=Q/2 "Half of inflow" annotation (Dialog(enable=false, tab="Inflow"));
    parameter Types.MassConcentration Si=3 "Soluble inert organic matter" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Ss=64 "Readily biodegradable substrate" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xi=59 "Particulate inert organic matter" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xs=224 "Slowly biodegradable substrate" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xbh=32 "Active heterotrophic biomass" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xba=0 "Active autotrophic biomass"  annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xp=0 "Particulate products from biomass decay" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration So=0 "Dissolved oxygen" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Sno=0 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Snh=30 "Ammonium nitrogen" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Snd=6.4 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Inflow"));
    parameter Types.MassConcentration Xnd=12 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Inflow"));
    parameter Types.Alkalinity Salk=7 "Alkalinity" annotation (Dialog(tab="Inflow"));

    /* Tank 1 - denitrification */
    parameter Types.MassConcentration Tank1_Si=30 "Soluble inert organic matter" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Ss=2.395032857582 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xi=1275.518549259 "Particulate inert organic matter" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xs=37.70076754487 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xbh=1956.193873766 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xba=88.29237725627 "Active autotrophic biomass" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xp=708.7641710603 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_So=0.007377559296960 "Dissolved oxygen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Sno=2.060772419090 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Snh=8.182199118905 "Ammonium nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Snd=0.5508870585039 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.MassConcentration Tank1_Xnd=2.635166937210 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter Types.Alkalinity Tank1_Salk=5.179082991135 "Alkalinity" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    /* Tank 2 */
    parameter Types.MassConcentration Tank2_Si=30 "Soluble inert organic matter" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Ss=2.463117211568 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xi=1278.333736389 "Particulate inert organic matter" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xs=21.40590310375 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xbh=1966.614626250 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xba=89.00572493248 "Active autotrophic biomass" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xp=711.3292476107 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_So=3.632593914266 "Dissolved oxygen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Sno=4.856770069816 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Snh=5.478663911860 "Ammonium nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Snd=0.7252693834073 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.MassConcentration Tank2_Xnd=1.586608768203 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter Types.Alkalinity Tank2_Salk=4.782438895247 "Alkalinity" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));

    /* Tank 3 */
    parameter Types.MassConcentration Tank3_Si=30 "Soluble inert organic matter" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Ss=1.768379818970 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xi=1280.658681727 "Particulate inert organic matter" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xs=13.42037061251 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xbh=1971.253187539 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xba=89.53776792719 "Active autotrophic biomass" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xp=713.5293892258 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_So=1.499999536940 "Dissolved oxygen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Sno=7.023954787236 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Snh=3.469832897751 "Ammonium nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Snd=0.6330054822579 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.MassConcentration Tank3_Xnd=1.058875620146 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter Types.Alkalinity Tank3_Salk=4.485176510073 "Alkalinity" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));

    /* Settler */
    parameter SI.Length Settler_hs=5.029601648736e-001
      "Height of sludge layer" annotation (Dialog(tab="Settler"));
    parameter Types.MassConcentration Settler_Si1=30 "Soluble inert organic matter" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_Ss1=1.681287279702 "Readily biodegradable substrate" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_So1=1.499999390854 "Dissolved oxygen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_Sno1=7.168869418367 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_Snh1=2.943675968574 "Ammonium nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_Snd1=0.6126843777685 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.Alkalinity Settler_Salk1=4.461450405862 "Alkalinity" annotation (Dialog(tab="Settler", group="First stirrer tank"));
    parameter Types.MassConcentration Settler_Si2=30 "Soluble inert organic matter" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.MassConcentration Settler_Ss2=1.635315887679 "Readily biodegradable substrate" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.MassConcentration Settler_So2=1.499999562861 "Dissolved oxygen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.MassConcentration Settler_Sno2=7.338549109702 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.MassConcentration Settler_Snh2=2.791485011898 "Ammonium nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.MassConcentration Settler_Snd2=0.6003165935477 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
    parameter Types.Alkalinity Settler_Salk2=4.437580751343 "Alkalinity" annotation (Dialog(tab="Settler", group="Second stirrer tank"));

      annotation (
        defaultComponentName="WWS",
        defaultComponentPrefixes="inner parameter",
        missingInnerMessage="
Your model is using an outer \"WWSystem\" component but
an inner \"WWSystem\" component is not defined.
For simulation drag WasteWater.WWSystem into your model
to specify system properties. The default system settings
are used for the current simulation.
",      Icon(graphics={
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
  extends Modelica.Icons.Package;
model FlowSource "Flowsource"

  extends WasteWater.Icons.FlowSource;
  Interfaces.WWFlow Out annotation (Placement(transformation(extent={{88,-80},{108,-60}})));
  Modelica.Blocks.Interfaces.RealInput data
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation

  Out.Q =-data;

  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-54,54},{56,-54}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-8,-54},{-14,-52},{-24,-48},{-32,-44},{-36,-40},{-42,-34},{
              -48,-26},{-50,-20},{52,-20},{50,-26},{46,-32},{42,-36},{38,-40},{
              34,-44},{30,-46},{26,-48},{22,-50},{16,-52},{10,-54},{4,-54},{0,
              -54},{-8,-54}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-54,54},{56,-54}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Rectangle(
          extent={{-4,-52},{4,-74}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{4,-74},{88,-68}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-4,-54},{-4,-74},{88,-74}},
          thickness=0.5),
        Line(
          points={{4,-54},{4,-68},{88,-68}},
          thickness=0.5)}),
    Documentation(info="This component is used to feed an ASM1 wwtp model with flow data from measurement
when e.g. concentration is measured after the primary clarifier.

The dimension of InPort is 1.

  1 volumeflowrate Q of incoming wastewater [m3/d]"));
end FlowSource;

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
  extends Interfaces.ASM1(useAir=false);
  extends WasteWater.Icons.Deni;

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
end Deni;

model Nitri "Nitrification (aerated) tank, based on the ASM1 model"
   extends Interfaces.ASM1;
  extends WasteWater.Icons.Nitri;

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
end Nitri;

model Divider2 "Flowdivider:
  Divides one flow of wastewater into 2 Flows; one amount needs to be specified."

  extends WasteWater.Icons.Divider2;
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

model ControlledDivider2 "Controlled flow divider:
  Divides one flow of wastewater into 2 Flows controlled by the
  input signal u; u=1 means Out1.Q=In.Q and u=0 means Out2.Q=In.Q."

  extends WasteWater.Icons.ControlledDivider2;
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-111,-7},{-91,13}})));
  Interfaces.WWFlow Out1 annotation (Placement(transformation(extent={{90,15},{110,35}})));
  Interfaces.WWFlow Out2 annotation (Placement(transformation(extent={{90,-25},{110,-5}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(
        origin={0,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation

  Out1.Q =-In.Q*u;
  Out2.Q =-In.Q*(1 - u);

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
    Documentation(info="This component divides one wastewater flow (ASM1) into two flows which are controlled by the signal u (0...1).
Is u.signal=1, the flow goes to output 1 (Out1) and is u.signal=0, the flow goes to output 2 (Out2).
The concentrations of the outport-flows are equal to the concentration at inport."));
end ControlledDivider2;

model mixer2 "Mixer of two ASM1 characterised flows"

  extends WasteWater.Icons.Mixer2;
  Interfaces.WWFlow In1 annotation (Placement(transformation(extent={{-110,15},{-90,35}})));
  Interfaces.WWFlow In2 annotation (Placement(transformation(extent={{-110,-25},{-90,-5}})));
  Interfaces.WWFlow Out annotation (Placement(transformation(extent={{90,-5},{110,15}})));
equation

  In1.Q + In2.Q + Out.Q = 0;
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q)/(In1.Q + In2.Q);
  Out.Ss = (In1.Ss*In1.Q + In2.Ss*In2.Q)/(In1.Q + In2.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q)/(In1.Q + In2.Q);
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q)/(In1.Q + In2.Q);
  Out.Xbh = (In1.Xbh*In1.Q + In2.Xbh*In2.Q)/(In1.Q + In2.Q);
  Out.Xba = (In1.Xba*In1.Q + In2.Xba*In2.Q)/(In1.Q + In2.Q);
  Out.Xp = (In1.Xp*In1.Q + In2.Xp*In2.Q)/(In1.Q + In2.Q);
  Out.So = (In1.So*In1.Q + In2.So*In2.Q)/(In1.Q + In2.Q);
  Out.Sno = (In1.Sno*In1.Q + In2.Sno*In2.Q)/(In1.Q + In2.Q);
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q)/(In1.Q + In2.Q);
  Out.Snd = (In1.Snd*In1.Q + In2.Snd*In2.Q)/(In1.Q + In2.Q);
  Out.Xnd = (In1.Xnd*In1.Q + In2.Xnd*In2.Q)/(In1.Q + In2.Q);
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q)/(In1.Q + In2.Q);

  annotation (
    Documentation(info=
          "This component mixes two flows of wastewater (ASM1) of different concentration and different amount."));
end mixer2;

model Mixer3 "Mixer of 3 flows"

  extends WasteWater.Icons.Mixer3;
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

  extends WasteWater.Icons.Pump;
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
  extends WasteWater.Icons.Blower;

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

  package PreClar "Primary clarifier modelling based on ASM1"
    extends Modelica.Icons.VariantsPackage;

    partial model PreClar_base "Dynamic ASM1 Primary Clarifier Model:
  Dynamic primary clarifier tank, based on Otterpohl.
  to be used for feed forward calculation, e.g., influent data needed."
      extends Data.ASM1.vars;
      extends WasteWater.Icons.PreClar;

      import Modelica.Math.log;

      /* tank specific parameters */
      parameter SI.Volume V=500 "Volume of primary clarifier tank";
      SI.Conversions.NonSIunits.Time_hour hrt_h "Hydraulic residence time in primary sedimentation tank [h]";
        // SI.Conversions.NonSIunits.Time_min hrt_min "hydraulic residence time in primary sedimentation tank [min]";
      Real n_COD "Efficiency of COD removal [%]";
      Real n_X "Efficiency transformed to particulate fractions [%]";

      Types.MassConcentration CODin;
      Types.MassConcentration CODout;
      Types.MassConcentration XCODin;

      Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.WWFlow Out annotation (Placement(transformation(extent={{90,-10},{110,10}})));

    protected
      Real H;

    equation

      /* calculation of the hydraulic residence time */
      hrt_h = V/In.Q*24;
      //hrt_min = V/In.Q * 24 * 60;

      /* n_COD according Otterpohl and Freund 1992 "Dynamic Models for Clarifiers" */
      n_COD = 2.7*(log(hrt_h*hrt_h) + 9)/100;
      /* n_COD according Otterpohl 1995, Dissertation: */
      // n_COD = (1.45 + 6.15 * log(hrt_min))/100;

      XCODin = In.Xi + In.Xs + In.Xbh + In.Xba + In.Xp
        "Particulate COD in the influent";
    //   CODin = In.Si + In.Ss + XCODin
    //     "Total COD in the influent";

      CODout = Out.Si + Out.Ss + Out.Xi + Out.Xs + Out.Xbh + Out.Xba + Out.Xp;

      H = n_COD*CODin/XCODin;

      /* n_X can not be greater than 1 therefore is this check: */
      n_X = if H > 0.95 then 0.95 else if H < 0.05 then 0.05 else H;

      // in this case the model needs to be modified by a new n_COD
      // n_COD_? = (2.88*XCODin/CODin - 0.118) * n_COD;

      /* Outputs */
      /* this is just a reduction of particulate substances; n_X*X is not stored
  so the amount of primary sludge removed is not calculated */
      Out.Q + In.Q = 0;

      Out.Si = Si;
      Out.Ss = Ss;
      Out.Xi = (1 - n_X)*Xi;
      Out.Xs = (1 - n_X)*Xs;
      Out.Xbh = (1 - n_X)*Xbh;
      Out.Xba = (1 - n_X)*Xba;
      Out.Xp = (1 - n_X)*Xp;
      Out.So = So;
      Out.Sno = Sno;
      Out.Snh = Snh;
      Out.Snd = Snd;
      Out.Xnd = (1 - n_X)*Xnd;
      Out.Salk = Salk;

      annotation (
        Documentation(info="This is an ASM1 dynamic primary clarifier model based on the theory
by Otterpohl and Freund.

Parameter:
  V - volume of the preclarifier
"));
    end PreClar_base;

    model PreClarDyn "Dynamic ASM1 Primary Clarifier Model:
  Dynamic primary clarifier tank, based on Otterpohl.
  to be used for feed forward calculation, e.g., influent data needed."
      extends PreClar_base;

    equation

      /* volume dependent dilution term of each concentration */
      der(Si) = (In.Si - Si)*In.Q/V;
      der(Ss) = (In.Ss - Ss)*In.Q/V;
      der(Xi) = (In.Xi - Xi)*In.Q/V;
      der(Xs) = (In.Xs - Xs)*In.Q/V;
      der(Xbh) = (In.Xbh - Xbh)*In.Q/V;
      der(Xba) = (In.Xba - Xba)*In.Q/V;
      der(Xp) = (In.Xp - Xp)*In.Q/V;
      der(So) = (In.So - So)*In.Q/V;
      der(Sno) = (In.Sno - Sno)*In.Q/V;
      der(Snh) = (In.Snh - Snh)*In.Q/V;
      der(Snd) = (In.Snd - Snd)*In.Q/V;
      der(Xnd) = (In.Xnd - Xnd)*In.Q/V;
      der(Salk) = (In.Salk - Salk)*In.Q/V;

      annotation (
        Documentation(info="This is an ASM1 dynamic primary clarifier model based on the theory
by Otterpohl and Freund.

Parameter:
  V - volume of the preclarifier
"),     Icon(graphics={
            Line(points={{-38,-48},{-36,-44},{-34,-40},{-32,-36},{-30,-32},{-26,
                  -26},{-24,-24},{-22,-22},{-18,-18},{-14,-14},{-12,-12},{-10,-10},
                  {-6,-8},{-2,-6},{2,-4},{8,-2},{14,0},{20,0},{24,0},{28,0}})}));
    end PreClarDyn;

    model PreClarStat "Static ASM1 Primary Clarifier Model:
  Static primary clarifier tank, based on Otterpohl
  to be used for feed forward calculation, e.g., influent data needed."
      extends PreClar_base;

    equation

      /* Volume dependent dilution term of each concentration */

      0 = (In.Si - Si)*In.Q/V;
      0 = (In.Ss - Ss)*In.Q/V;
      0 = (In.Xi - Xi)*In.Q/V;
      0 = (In.Xs - Xs)*In.Q/V;
      0 = (In.Xbh - Xbh)*In.Q/V;
      0 = (In.Xba - Xba)*In.Q/V;
      0 = (In.Xp - Xp)*In.Q/V;
      0 = (In.So - So)*In.Q/V;
      0 = (In.Sno - Sno)*In.Q/V;
      0 = (In.Snh - Snh)*In.Q/V;
      0 = (In.Snd - Snd)*In.Q/V;
      0 = (In.Xnd - Xnd)*In.Q/V;
      0 = (In.Salk - Salk)*In.Q/V;

      annotation (
        Documentation(info="This is an ASM1 static primary clarifier model based on the theory
by Otterpohl and Freund.

Parameter:
  V - volume of the preclarifier
"),     Icon(graphics={
            Line(points={{-38,-14},{40,-14}})}));
    end PreClarStat;

    model PreClarStatInv
      extends PreClarStat;

      /* tank specific parameters */
      parameter Real aSi=5/100 "Fraction of Si of the total COD in the influent";
      parameter Real aSs=15/100 "Fraction of Ss of the total COD in the influent";
      parameter Real aXi=15/100 "Fraction of Xi of the total COD in the influent";
      parameter Real aXs=45/100 "Fraction of Xs of the total COD in the influent";
      parameter Real aXbh=20/100
        "Fraction of Xbh of the total COD in the influent";
      parameter Real aXba=0/100
        "Fraction of Xba of the total COD in the influent";
      parameter Real aXp=0/100 "Fraction of Xp of the total COD in the influent";
      parameter Real aSo=0.0 "Dissolved oxygen in the inflow [mg/l]";
      parameter Real aSnd=1/100 "Fraction Snd of Ss in the influent";
      parameter Real aXnd=3/100 "Fraction Xnd of Xs in the influent";
      parameter Real n_corr=1.0 "Correction faktor for the efficiency function";

      Types.MassConcentration COD;
      Modelica.Blocks.Interfaces.RealInput ControlPort[4]
        annotation (Placement(transformation(
            origin={50,100},
            extent={{-20,-20},{20,20}},
            rotation=270), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,90})));
    equation
      COD = ControlPort[1]/(1 - n_COD)
        "Total COD in the influent";


      /* Inputs */
      In.Si = aSi*COD;
      In.Ss = aSs*COD;
      In.Xi = aXi*COD;
      In.Xs = aXs*COD;
      In.Xbh = aXbh*COD;
      In.Xba = aXba*COD;
      In.Xp = aXp*COD;
      In.So = aSo;
      In.Sno =ControlPort[2];
      In.Snh =ControlPort[3];
      In.Snd = aSnd*In.Ss;
      In.Xnd = aXnd*In.Xs;
      In.Salk =1.8*exp(ControlPort[4] - 6.4);

      annotation (Icon(graphics={
            Rectangle(
              extent={{58,-6},{62,80}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}),
      Documentation(info="This is a special case of the ASM1 static primary clarifier model.
Here measurement data at the end (effluent) of the preclarifier needs to be provided.
This is typical for some real plants. Influent is then calculated.

Parameters:
  V   - volume of the preclarifier
  aS* - fractions of e.g. COD in influent (soluble components)
  aX* - fractions of e.g. COD in influent (particular components)
  n_corr- correction factor for the efficiency function

Dimension of ControlPort is 4.
  1 - Chemical Oxygen Demand (COD) at effluent of primary clarifier
  2 - nitrate nitrogen (Sno) at effluent of primary clarifier
  3 - ammonium nitrogen (Snh) at effluent of primary clarifier
  4 - pH-value at effluent of primary clarifier

"));
    end PreClarStatInv;
    annotation (
      Documentation(info="This package provides one dynamic and two static ASM1 primary clarifier
models based on Otterpohl [1].

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de


Reference:

[1] R. Otterpohl and M. Freund: Dynamic models for clarifier of activated sludge
    plants with dry and wet weather flows. Water Science and Technology. 26 (1992), pp. 1391-1400.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2001, Gerald Reichl
"));
  end PreClar;

  package SecClar "Library for secondary settling tank modelling based on ASM1"
    extends Modelica.Icons.VariantsPackage;
    extends Modelica.Icons.UnderConstruction;


    package Haertel "Secondary settling tank modelling by Haertel (ASM1)"
      extends Modelica.Icons.Package;

      package Interfaces
        "Connectors and partial models for ASM1 Secondary Clarifier Model by Haertel"

        extends Modelica.Icons.Package;

        connector UpperLayerPin "Connector above influent layer"

          package WWU = WasteWater.Types;

          // effluent flow
          flow WWU.VolumeFlowRate Qe;

          // sedimentation flux
          flow WWU.SedimentationFlux SedFlux;

          // total sludge concentration (m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn;

          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers above the influent layer (feed_layer)."));
        end UpperLayerPin;

        connector LowerLayerPin "Connector below influent layer"
          package WWU = WasteWater.Types;

          // return and waste sludge flow Qr, Qw
          flow WWU.VolumeFlowRate Qr;
          flow WWU.VolumeFlowRate Qw;
          // sedimentation flux
          flow WWU.SedimentationFlux SedFlux;
          // total sludge concentration in m-th layer
          WWU.MassConcentration X;

            // total sludge concentration and sink velocity in (m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn;
          WWU.SedimentationVelocity vS_dn;
          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers below the influent layer (feed_layer)."));
        end LowerLayerPin;

        partial model SCParam "partial model providing clarifier parameters"
          import SI = Modelica.SIunits;
          package WWU = WasteWater.Types;
          parameter SI.Length zm;
          parameter SI.Area Asc;
          parameter WWU.SludgeVolumeIndex ISV;
          annotation (
            Documentation(info="partial model providing clarifier parameters"));
        end SCParam;

        partial model SCVar "partial models providing variables"
          package WWU = WasteWater.Types;
          WWU.MassConcentration X "total sludge concentration in m-th layer";
          WWU.SedimentationVelocity vS "sink velocity in m-th layer";
          WWU.SedimentationFlux Jsm "sedimentation flux m-th layer";

          WWU.MassConcentration Si "Soluble inert organic matter";
          WWU.MassConcentration Ss "Readily biodegradable substrate";
          WWU.MassConcentration So "Dissolved oxygen";
          WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
          WWU.MassConcentration Snh "Ammonium nitrogen";
          WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
          WWU.Alkalinity Salk "Alkalinity";
          annotation (
            Documentation(info="partial models providing variables"));
        end SCVar;

        partial model ratios "partial model for ratios of solid components"
          // ratios of solid components
          Real rXi;
          Real rXs;
          Real rXbh;
          Real rXba;
          Real rXp;
          Real rXnd;
          annotation (
            Documentation(info="partial model for ASM1 ratios of solid components"));
        end ratios;

        function vSfun "Sedimentation velocity function"

          // total sludge concentration in m-th layer in g/m3 or mg/l
          input Real X;
          //Sludge Volume Index
          input Real ISV;

          // sink velocity in m/d
          output Real vS;
        protected
          Real v0 "maximum settling velocity";
          Real nv "exponent as part of the Vesilind equation";
        algorithm
          v0 := (17.4*(exp(-0.0113*ISV)) + 3.931)*24;
          //[m/d]
          nv := (-0.9834*(exp(-0.00581*ISV)) + 1.043);
          //[l/g]
          vS := v0*exp(-nv*X/1000);
          annotation (
            Documentation(info="Sedimentation velocity function"));
        end vSfun;

        function omega "Omega correction function by Haertel"
          //vertical coordinate, bottom: z=0
          input Real z;
          // total sludge concentration in clarifier feed
          input Real Xf;
          //height of secondary clarifier
          input Real hsc;
          //height of m-th secondary clarifier layer
          input Real zm;
          //Sludge Volume Index
          input Real ISV;
          //number of layers above feed layer
          input Integer i;
          // correction function omega by Haertel based on [g/l]
          output Real omega;

        protected
          Real Xc "solids concentration at compression point";
          Real nv "exponent as part of the Vesilind equation";
          Real ht "height of transition point";
          Real hc "height of compressing point";
          Real B3;
          Real B4;

        algorithm

          Xc := 480/ISV;
          nv := 1.043 - 0.9834*exp(-0.00581*ISV);
          hc := (Xf/1000)*(hsc - zm*(i + 0.5))/Xc*(1.0 - 1.0/(Xc*nv));
          // unit change
          ht := min(2.0*hc, hsc - zm*(i + 0.5));

          B4 := 1.0 + 2.0*ISV/(100.0 + ISV);
          B3 := -((2*ISV + 100.0)/ISV)*hc^B4;

          omega := (1.0 - B3*ht^(-B4))/(1.0 - B3*z^(-B4));
          omega := min(1.0, omega);
          annotation (
            Documentation(info=
                  "This is Haertels omega correction function for the settling process."));
        end omega;
        annotation (
          Documentation(info="This package contains connectors and interfaces (partial models) for
the ASM1 secondary clarifier model based on Haertel [1] (settling velocity and omega correction function).

References:

[1] L. Haertel: Modellansaetze zur dynamischen Simulation des Belebtschlammverfahrens.
    TH Darmstadt, Dissertation, 1990.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2002, Gerald Reichl
"));
      end Interfaces;

      model SecClarModHaertel "ASM1 Secondary Settling Tank Model based on Haertel"

        extends WasteWater.Icons.SecClar;
        extends Interfaces.ratios;
        package SCP = Haertel;
        import SI = Modelica.SIunits;
        package WI = ASM1.Interfaces;
        package WWU = WasteWater.Types;
        parameter SI.Length hsc=4.0 "height of secondary clarifier";
        parameter Integer n=10 "number of layers of SC model";
        parameter SI.Length zm=hsc/(1.0*n)
          "height of m-th secondary clarifier layer";
        parameter SI.Area Asc=1500.0 "area of secondary clarifier";
        parameter WWU.SludgeVolumeIndex ISV=130 "Sludge Volume Index";
        parameter Integer i=2
          "number of layers above current feed layer in this model";

        // total sludge concentration in clarifier feed
        WWU.MassConcentration Xf;

        // layers 1 to 10
        SCP.bottom_layer S1(
          zm=zm,
          Asc=Asc,
          ISV=ISV,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,-93},{35,-78}})));
        SCP.lower_layer S2(
          hsc=hsc,
          zm=zm,
          z=(zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}})));
        SCP.lower_layer S3(
          hsc=hsc,
          zm=zm,
          z=(2*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}})));
        SCP.lower_layer S4(
          hsc=hsc,
          zm=zm,
          z=(3*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-36},{35,-21}})));
        SCP.lower_layer S5(
          hsc=hsc,
          zm=zm,
          z=(4*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-17},{35,-2}})));
        SCP.lower_layer S6(
          hsc=hsc,
          zm=zm,
          z=(5*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,2},{35,17}})));
        SCP.lower_layer S7(
          hsc=hsc,
          zm=zm,
          z=(6*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,21},{35,36}})));
        SCP.feed_layer S8(
          hsc=hsc,
          zm=zm,
          z=(7*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}})));
        SCP.upper_layer S9(
          zm=zm,
          Asc=Asc,
          ISV=ISV) annotation (Placement(transformation(extent={{-35,59},{35,74}})));
        SCP.top_layer S10(
          zm=zm,
          Asc=Asc,
          ISV=ISV,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,78},{35,93}})));
        WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
                  {-90,24}})));
        WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
                  47},{112,67}})));
        WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
                  -106},{-20,-86}})));
        WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
                  -106},{40,-86}})));
      equation

        connect(S1.Up, S2.Dn) annotation (Line(points={{0,-78},{0,-78},{2,-78},{2,-76},{-2,-76},{-2,-74}}));
        connect(S2.Up, S3.Dn) annotation (Line(points={{0,-59},{0,-58},{0,-58},{2,-58},{-2,-58},{-2,-55}}));
        connect(S3.Up, S4.Dn) annotation (Line(points={{0,-40},{0,-40},{2,-40},{2,-38},{-2,-38},{-2,-36}}));
        connect(S5.Up, S6.Dn) annotation (Line(points={{0,-2},{0,-2},{2,-2},{2,0},{-2,0},{-2,2}}));
        connect(S6.Up, S7.Dn) annotation (Line(points={{0,17},{0,18},{2,18},{2,20},{-2,20},{-2,21}}));
        connect(S7.Up, S8.Dn) annotation (Line(points={{0,36},{0,38},{0,38},{2,38},{-2,38},{-2,40}}));
        connect(S9.Up, S10.Dn) annotation (Line(points={{0,74},{0,76},{0,76},{2,76},{-2,76},{-2,78}}));
        connect(S4.Up, S5.Dn) annotation (Line(points={{0,-21},{0,-20},{0,-20},{2,-20},{-2,-20},{-2,-17}}));
        connect(S8.Up, S9.Dn) annotation (Line(points={{0,55},{0,56},{2,56},{2,58},{-2,58},{-2,59}}));
        connect(Feed, S8.In) annotation (Line(points={{-100,14},{-100,47,8},{-35,47,8}}));
        connect(S1.PQw, Waste) annotation (Line(points={{17,5,-93},{17,5,-96},{30,-96}}));
        connect(S10.Out, Effluent) annotation (Line(points={{35,85,5},{67,85,5},{67,57},{102,57}}));
        connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-21,-96},{-30,-96}}));

        // total sludge concentration in clarifier feed
        Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

        // ratios of solid components
        rXs = Feed.Xs/Xf;
        rXbh = Feed.Xbh/Xf;
        rXba = Feed.Xba/Xf;
        rXp = Feed.Xp/Xf;
        rXi = Feed.Xi/Xf;
        rXnd = Feed.Xnd/Xf;

        annotation (
          Documentation(info="This component models an ASM1 10 - layer secondary clarifier with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Haertel`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  ISV -  Sludge Volume Index [ml/g]
  i   -  number of layers above feed layer
"));
      end SecClarModHaertel;

      model bottom_layer "Bottom layer of Haertel`s SC model"
        import WWSC = WasteWater.Components.SecClar.Haertel.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;

        ASM1.Interfaces.WWFlowAsm1out PQr annotation (Placement(transformation(
                extent={{-70,-110},{-50,-90}})));
        ASM1.Interfaces.WWFlowAsm1out PQw annotation (Placement(transformation(
                extent={{40,-110},{60,-90}})));
        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, ISV);

        // sedimentation flux in bottom layer
        Jsm = 0.0;

        // ODE of solid component
        der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux)/zm;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // upward connection
        Up.vS_dn = vS;
        Up.X_dn = X;

        // return and waste sludge volume flow rates
        PQr.Q + Up.Qr = 0;
        PQw.Q + Up.Qw = 0;

        // return sludge flow, solid and soluble components (ASM1)
        PQr.Si = Si;
        PQr.Ss = Ss;
        PQr.Xi = rXi*X;
        PQr.Xs = rXs*X;
        PQr.Xbh = rXbh*X;
        PQr.Xba = rXba*X;
        PQr.Xp = rXp*X;
        PQr.So = So;
        PQr.Sno = Sno;
        PQr.Snh = Snh;
        PQr.Snd = Snd;
        PQr.Xnd = rXnd*X;
        PQr.Salk = Salk;

        // waste sludge flow, solid and soluble components (ASM1)
        PQw.Si = Si;
        PQw.Ss = Ss;
        PQw.Xi = rXi*X;
        PQw.Xs = rXs*X;
        PQw.Xbh = rXbh*X;
        PQw.Xba = rXba*X;
        PQw.Xp = rXp*X;
        PQw.So = So;
        PQw.Sno = Sno;
        PQw.Snh = Snh;
        PQw.Snd = Snd;
        PQw.Xnd = rXnd*X;
        PQw.Salk = Salk;

        annotation (
          Documentation(info="This class models the lowest layer of an ASM1 secondary clarifier based on Haertel.

No sedimentation flux (mass exchange) with underneath but hydraulic and sedimentation flux (same direction)
with above layer.
From here return and waste sludge is removed.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end bottom_layer;

      model lower_layer "Layer below influent of Haertel`s SC model"

        import WWSC = WasteWater.Components.SecClar.Haertel.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWU.MassConcentration Xf "sludge concentration in clarifier feed";
        SI.Length z "vertical coordinate of current layer";

        parameter SI.Length hsc;
        parameter Integer i "number of layers above feed layer";
        Real omega;

        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, ISV);
        omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = if vS < Dn.vS_dn then omega*(vS*X) else omega*min(vS*X, Dn.vS_dn*Dn.
          X_dn);

        // ODE of solid component
        der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // downward connections
        Dn.Qr + Up.Qr = 0;
        Dn.Qw + Up.Qw = 0;

        Dn.X = X;
        Dn.SedFlux = -Jsm;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        // upward connections
        Up.vS_dn = vS;
        Up.X_dn = X;
        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the lowest layer (bottom_layer)
of an ASM1 secondary clarifier based on Haertel.

Hydraulic and sedimentation flux (mass exchange in same direction) with above and underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function and the omega correction function by Haertel.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end lower_layer;

      model feed_layer "Influent layer of Haertel`s SC model"
        import WWSC = WasteWater.Components.SecClar.Haertel.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;

        WWU.MassConcentration Xf "sludge concentration in clarifier feed";
        SI.Length z "vertical coordinate of current layer";

        parameter SI.Length hsc;
        parameter Integer i "number of layers above feed layer";
        Real omega;

        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        ASM1.Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent=
                 {{-110,-6},{-90,14}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, ISV);
        omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = if vS < Dn.vS_dn then omega*(vS*X) else omega*min(vS*X, Dn.vS_dn*Dn.
          X_dn);

        // ODE of solid component
        der(X) = (In.Q/Asc*Xf - (-Up.Qe)/Asc*X - (-(Dn.Qr + Dn.Qw))/Asc*X + Up.
          SedFlux - Jsm)/zm;

        // ODE of soluble components
        der(Si) = (In.Q*In.Si - (-Up.Qe)*Si - (-(Dn.Qr + Dn.Qw))*Si)/(Asc*zm);
        der(Ss) = (In.Q*In.Ss - (-Up.Qe)*Ss - (-(Dn.Qr + Dn.Qw))*Ss)/(Asc*zm);
        der(So) = (In.Q*In.So - (-Up.Qe)*So - (-(Dn.Qr + Dn.Qw))*So)/(Asc*zm);
        der(Sno) = (In.Q*In.Sno - (-Up.Qe)*Sno - (-(Dn.Qr + Dn.Qw))*Sno)/(Asc*zm);
        der(Snh) = (In.Q*In.Snh - (-Up.Qe)*Snh - (-(Dn.Qr + Dn.Qw))*Snh)/(Asc*zm);
        der(Snd) = (In.Q*In.Snd - (-Up.Qe)*Snd - (-(Dn.Qr + Dn.Qw))*Snd)/(Asc*zm);
        der(Salk) = (In.Q*In.Salk - (-Up.Qe)*Salk - (-(Dn.Qr + Dn.Qw))*Salk)/(Asc*
          zm);

        // volume flow rates
        In.Q + Up.Qe + Dn.Qr + Dn.Qw = 0;

        Dn.SedFlux = -Jsm;
        Dn.X = X;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        Up.X_dn = X;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;

        annotation (
          Documentation(info="This class models the influent layer of an ASM1 secondary clarifier based on Haertel.

It receives the wastewater stream from the biological part (feed).
Hydraulic and sedimentation flux (mass exchange in opposite directions) with above layer
and hydraulic and sedimentation flux (mass exchange in same direction) with underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function and the omega correction function by Haertel.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end feed_layer;

      model upper_layer "Layer above influent of Haertels`s SC"

        import WWSC = WasteWater.Components.SecClar.Haertel.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, ISV);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = vS*X;

        // ODE of solid component
        der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) + Up.SedFlux - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux = -Jsm;

        // upward connections
        Up.Qe + Dn.Qe = 0;

        Up.X_dn = X;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;

        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the effluent layer (top_layer)
of an ASM1 secondary clarifier based on Haertel.

Hydraulic and sedimentation flux (mass exchange in opposite directions) with above and underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function by Haertel."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end upper_layer;

      model top_layer "Effluent layer of Haertel`s SC model"

        import WWSC = WasteWater.Components.SecClar.Haertel.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;
        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        ASM1.Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(
                extent={{90,-10},{110,10}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, ISV);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = vS*X;

        // ODE of solid component
        der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux = -Jsm;

        // effluent volume flow rate
        Out.Q + Dn.Qe = 0;

        // effluent, solid and soluble components (ASM1)
        Out.Si = Si;
        Out.Ss = Ss;
        Out.Xi = rXi*X;
        Out.Xs = rXs*X;
        Out.Xbh = rXbh*X;
        Out.Xba = rXba*X;
        Out.Xp = rXp*X;
        Out.So = So;
        Out.Sno = Sno;
        Out.Snh = Snh;
        Out.Snd = Snd;
        Out.Xnd = rXnd*X;
        Out.Salk = Salk;

        annotation (
          Documentation(info="This class models the top layer of an ASM1 secondary clarifier based on Haertel.

No sedimentation flux (mass exchange) with above but hydraulic and sedimentation flux
(opposite directions) underneath.
From here effluent goes to the receiving water.

Sedimentation flux is calculated based on the sedimentation velocity
function by Haertel.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end top_layer;
      annotation (
        Documentation(info="This package contains classes (layer models) to built ASM1 secondary clarifier models, an Interfaces sub-library
and provides an ASM1 10-layer secondary clarifier model all bases on Haertel`s [1]
sedimentation velocity and omega correction functions.

A secondary clarifier layer model needs at least a top_layer, a feed_layer and a bottom_layer
and may have several upper_layer in between above the feed_layer and several lower_layer in
between below the feed_layer.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] L. Haertel: Modellansaetze zur dynamischen Simulation des Belebtschlammverfahrens.
    TH Darmstadt, Dissertation, 1990.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2002 - 2003, Gerald Reichl
"));
    end Haertel;

    package Krebs "Secondary settling tank modelling by Krebs (ASM1)"
      extends Modelica.Icons.Package;

      package Interfaces "Partial models for Secondary Clarifier Model by Krebs"

        extends Modelica.Icons.Package;

        partial model SCVar "partial models providing variables"
          package WWU = WasteWater.Types;
          WWU.MassConcentration Xf "total sludge concentration";
          WWU.MassConcentration XB "sludge concentration in sludge layer";
          WWU.MassConcentration XR "sludge concentration of return";

          WWU.MassConcentration Si1(fixed=true)
            "Soluble inert organic matter in first stirrer tank of the excess layer";
          WWU.MassConcentration Ss1(fixed=true)
            "Readily biodegradable substrate in first stirrer tank of the excess layer";
          WWU.MassConcentration So1(fixed=true)
            "Dissolved oxygen in first stirrer tank of the excess layer";
          WWU.MassConcentration Sno1(fixed=true)
            "Nitrate and nitrite nitrogen in first stirrer tank of the excess layer";
          WWU.MassConcentration Snh1(fixed=true)
            "Ammonium nitrogen in first stirrer tank of the excess layer";
          WWU.MassConcentration Snd1(fixed=true)
            "Soluble biodegradable organic nitrogen in first stirrer tank of the excess layer";
          WWU.Alkalinity Salk1(fixed=true)
            "Alkalinity in first stirrer tank of the excess layer";

          WWU.MassConcentration Si2(fixed=true)
            "Soluble inert organic matter in second stirrer tank of the excess layer";
          WWU.MassConcentration Ss2(fixed=true)
            "Readily biodegradable substrate in second stirrer tank of the excess layer";
          WWU.MassConcentration So2(fixed=true)
            "Dissolved oxygen in second stirrer tank of the excess layer";
          WWU.MassConcentration Sno2(fixed=true)
            "Nitrate and nitrite nitrogen in second stirrer tank of the excess layer";
          WWU.MassConcentration Snh2(fixed=true)
            "Ammonium nitrogen in second stirrer tank of the excess layer";
          WWU.MassConcentration Snd2(fixed=true)
            "Soluble biodegradable organic nitrogen in second stirrer tank of the excess layer";
          WWU.Alkalinity Salk2(fixed=true)
            "Alkalinity in second stirrer tank of the excess layer";
          annotation (
            Documentation(info="partial models providing ASM1 variables"));
        end SCVar;

        partial model ratios "partial model for ratios of solid components"
          // ratios of solid components
          Real rXi;
          Real rXs;
          Real rXbh;
          Real rXba;
          Real rXp;
          Real rXnd;
          annotation (
            Documentation(info="partial model for ASM1 ratios of solid components"));
        end ratios;
        annotation (
          Documentation(info="This package contains partial models for ASM1 secondary clarifier models.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
      end Interfaces;

      model SecClarModKrebs "ASM1 Secondary Settling Tank Model based on Krebs"

        extends WasteWater.Icons.SecClarKrebs;
        import WWSC = WasteWater.Components.SecClar.Krebs.Interfaces;
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
        WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},{-90,24}}), iconTransformation(extent={{-110,4},{-90,24}})));
        WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
                  47},{112,67}})));
        WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
                  -106},{-20,-86}})));
        WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
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
"),       Diagram(coordinateSystem(
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
      annotation (
        Documentation(info="This package contains an ASM1 secondary clarifier model and an Interfaces sub-library
based on Krebs conceptional model [1].
The settler model consists of two compartments, a \"sludge-bed\" and a clear water zone above.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] P. Krebs and M. Armbruster and W. Rodi: Numerische Nachklaerbeckenmodelle. Korrespondenz Abwasser. 47 (7)
    2000. pp 985-999.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
    end Krebs;

    package Otterpohl "Secondary settling tank modelling by Otterpohl"
      extends Modelica.Icons.Package;

      package Interfaces
        "Connectors and partial ASM1 models for Secondary Clarifier Model by Otterpohl"

        extends Modelica.Icons.Package;

        connector UpperLayerPin "Connector above influent layer"

          package WWU = WasteWater.Types;
          // effluent flow
          flow WWU.VolumeFlowRate Qe;
          // sedimentation flux (from micro and macro flocs)
          flow WWU.SedimentationFlux SedFlux_F;
          // caused by macro flocs
          flow WWU.SedimentationFlux SedFlux_S;
          // caused by micro flocs

            // sludge concentration of macro and micro flocs in (m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn_F;
          WWU.MassConcentration X_dn_S;

          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers above the influent layer (feed_layer)."));
        end UpperLayerPin;

        connector LowerLayerPin "Connector below influent layer"

          package WWU = WasteWater.Types;

          // return and waste sludge flow Qr, Qw
          flow WWU.VolumeFlowRate Qr;
          flow WWU.VolumeFlowRate Qw;

          // sedimentation flux (from micro and macro flocs)
          flow WWU.SedimentationFlux SedFlux_F;
          // caused by macro flocs
          flow WWU.SedimentationFlux SedFlux_S;
          // caused by micro flocs

          // total sludge concentration of micro and macro flocs in m-th layer
          WWU.MassConcentration X_F;
          WWU.MassConcentration X_S;

            // total sludge concentration of micro and macro flocs in (m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn_F;
          WWU.MassConcentration X_dn_S;
          // sink velocity of macro flocs in (m-1)-th layer
          WWU.SedimentationVelocity vS_dn_F;
          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers below the influent layer (feed_layer)."));
        end LowerLayerPin;

        partial model SCParam "partial model providing clarifier parameters"
          import SI = Modelica.SIunits;
          package WWU = WasteWater.Types;
          parameter SI.Length zm;
          parameter SI.Area Asc;
          parameter WWU.SludgeVolumeIndex ISV;
          parameter WWU.SedimentationVelocity vS_S=0.24;
          // 0.01[m/h]*24 -> [m/d]

          annotation (
            Documentation(info="partial model providing clarifier parameters"));
        end SCParam;

        partial model SCVar "partial models providing variables"

          package WWU = WasteWater.Types;
          WWU.MassConcentration X "total sludge concentration in m-th layer";
          WWU.MassConcentration X_F "sludge concentration of macro flocs";
          WWU.MassConcentration X_S "sludge concentration of micro flocs";
          WWU.SedimentationVelocity vS_F "sink velocity of makro flocs";
          WWU.SedimentationFlux Jsm_F "sedimentation flux of macro flocs";
          WWU.SedimentationFlux Jsm_S "sedimentation flux of micro flocs";

          WWU.MassConcentration Si "Soluble inert organic matter";
          WWU.MassConcentration Ss "Readily biodegradable substrate";
          WWU.MassConcentration So "Dissolved oxygen";
          WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
          WWU.MassConcentration Snh "Ammonium nitrogen";
          WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
          WWU.Alkalinity Salk "Alkalinity";
          annotation (
            Documentation(info="partial models providing ASM1 variables"));
        end SCVar;

        partial model ratios "partial model for ratios of solid components"

          // ratios of solid components
          Real rXi;
          Real rXs;
          Real rXbh;
          Real rXba;
          Real rXp;
          Real rXnd;
          annotation (
            Documentation(info="partial model for ASM1 ratios of solid components"));
        end ratios;

        function vSfun "Sedimentation velocity function"

          // total sludge concentration in m-th layer in g/m3 or mg/l
          input Real X;
          //Sludge Volume Index
          input Real ISV;
          // sink velocity in m/d
          output Real vS;
        protected
          Real v0 "maximum settling velocity";
          Real nv "exponent as part of the Vesilind equation";
        algorithm
          v0 := (17.4*(exp(-0.0113*ISV)) + 3.931)*24;
          //[m/d]
          nv := (-0.9834*(exp(-0.00581*ISV)) + 1.043);
          //[l/g]
          vS := v0*exp(-nv*X/1000);
          annotation (
            Documentation(info="Sedimentation velocity function"));
        end vSfun;

        function omega "Omega correction function by Haertel"

          input Real z;
          //vertical coordinate, bottom: z=0
          input Real Xf;
          // total sludge concentration in clarifier feed
          input Real hsc;
          //height of secondary clarifier
          input Real zm;
          //height of m-th secondary clarifier layer
          input Real ISV;
          //Sludge Volume Index
          input Integer i;
          //number of layers above feed layer

          // correction function omega by Haertel based on [g/l]
          output Real omega;

        protected
          Real Xc "solids concentration at compression point";
          Real nv "exponent as part of the Vesilind equation";
          Real ht "height of transition point";
          Real hc "height of compressing point";
          Real B3;
          Real B4;

        algorithm

          Xc := 480/ISV;
          nv := 1.043 - 0.9834*exp(-0.00581*ISV);
          hc := (Xf/1000)*(hsc - zm*(i + 0.5))/Xc*(1.0 - 1.0/(Xc*nv));
          // unit change
          ht := min(2.0*hc, hsc - zm*(i + 0.5));

          B4 := 1.0 + 2.0*ISV/(100.0 + ISV);
          B3 := -((2*ISV + 100.0)/ISV)*hc^B4;

          omega := (1.0 - B3*ht^(-B4))/(1.0 - B3*z^(-B4));
          omega := min(1.0, omega);
          annotation (
            Documentation(info=
                  "This is Haertels omega correction function for the settling process."));
        end omega;
        annotation (
          Documentation(info="This package contains connectors and interfaces (partial models) for
the ASM1 secondary clarifier model based on Otterpohl [1] (two settling velocities for
distinction between micro and macro flocs and omega correction function).

References:

[1] R. Otterpohl and M. Freund: Dynamic models for clarifiers of activated sludge plants
    with dry and wet weather flows. Water Science and Technology. 26 (1992), pp 1391-1400.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
      end Interfaces;

      model SecClarModOtter "Secondary Clarifier Model based on Otterpohl (ASM1)"

        extends WasteWater.Icons.SecClar;
        extends Interfaces.ratios;
        package SCP = Otterpohl;
        import SI = Modelica.SIunits;
        package WI = ASM1.Interfaces;
        package WWU = WasteWater.Types;
        parameter SI.Length hsc=4.0 "height of secondary clarifier";
        parameter Integer n=10 "number of layers of SC model";
        parameter SI.Length zm=hsc/(1.0*n)
          "height of m-th secondary clarifier layer";
        parameter SI.Area Asc=1500.0 "area of secondary clarifier";
        parameter WWU.SludgeVolumeIndex ISV=130 "Sludge Volume Index";
        parameter Integer i=2
          "number of layers above current feed layer in this model";

        // total sludge concentration in clarifier feed
        WWU.MassConcentration Xf;

        // layers 1 to 10
        SCP.bottom_layer S1(
          zm=zm,
          Asc=Asc,
          ISV=ISV,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,-93},{35,-78}})));
        SCP.lower_layer S2(
          hsc=hsc,
          zm=zm,
          z=(zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}})));
        SCP.lower_layer S3(
          hsc=hsc,
          zm=zm,
          z=(2*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}})));
        SCP.lower_layer S4(
          hsc=hsc,
          zm=zm,
          z=(3*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-36},{35,-21}})));
        SCP.lower_layer S5(
          hsc=hsc,
          zm=zm,
          z=(4*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-17},{35,-2}})));
        SCP.lower_layer S6(
          hsc=hsc,
          zm=zm,
          z=(5*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,2},{35,17}})));
        SCP.lower_layer S7(
          hsc=hsc,
          zm=zm,
          z=(6*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,21},{35,36}})));
        SCP.feed_layer S8(
          hsc=hsc,
          zm=zm,
          z=(7*zm + zm/2),
          Asc=Asc,
          ISV=ISV,
          i=i,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}})));
        SCP.upper_layer S9(
          zm=zm,
          Asc=Asc,
          ISV=ISV) annotation (Placement(transformation(extent={{-35,59},{35,74}})));
        SCP.top_layer S10(
          zm=zm,
          Asc=Asc,
          ISV=ISV,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,78},{35,93}})));
        WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
                  {-90,24}})));
        WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
                  47},{112,67}})));
        WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
                  -106},{-20,-86}})));
        WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
                  -106},{40,-86}})));
      equation

        connect(S1.Up, S2.Dn) annotation (Line(points={{-2.22045e-15,-78},{
                -2.22045e-15,-74}}));
        connect(S2.Up, S3.Dn) annotation (Line(points={{-2.22045e-15,-59},{
                -2.22045e-15,-55}}));
        connect(S3.Up, S4.Dn) annotation (Line(points={{-2.22045e-15,-40},{
                -2.22045e-15,-36}}));
        connect(S5.Up, S6.Dn) annotation (Line(points={{-2.22045e-15,-2},{
                -2.22045e-15,2}}));
        connect(S6.Up, S7.Dn) annotation (Line(points={{-2.22045e-15,17},{
                -2.22045e-15,21}}));
        connect(S7.Up, S8.Dn) annotation (Line(points={{-2.22045e-15,36},{
                -2.22045e-15,40}}));
        connect(S9.Up, S10.Dn) annotation (Line(points={{-2.22045e-15,74},{
                -2.22045e-15,78}}));
        connect(S4.Up, S5.Dn) annotation (Line(points={{-2.22045e-15,-21},{
                -2.22045e-15,-17}}));
        connect(S8.Up, S9.Dn) annotation (Line(points={{-2.22045e-15,55},{
                -2.22045e-15,59}}));
        connect(Feed, S8.In) annotation (Line(points={{-100,14},{-100,47.8},{-35,47.8}}));
        connect(S1.PQw, Waste) annotation (Line(points={{17.5,-93},{17.5,-96},{30,-96}}));
        connect(S10.Out, Effluent) annotation (Line(points={{35,85.5},{67.5,85.5},{67.5,57},{102,57}}));
        connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-21,-96},{-30,-96}}));

        // total sludge concentration in clarifier feed
        Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

        // ratios of solid components
        rXs = Feed.Xs/Xf;
        rXbh = Feed.Xbh/Xf;
        rXba = Feed.Xba/Xf;
        rXp = Feed.Xp/Xf;
        rXi = Feed.Xi/Xf;
        rXnd = Feed.Xnd/Xf;

        annotation (
          Documentation(info="This component models an ASM1 10 - layer secondary clarifier model with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Otterpohl`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  ISV -  Sludge Volume Index [ml/g]
  i   -  number of layers above feed layer
"));
      end SecClarModOtter;

      model bottom_layer "Bottom layer of Otterpohls`s SC model"

        import WWSC = WasteWater.Components.SecClar.Otterpohl.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;
        ASM1.Interfaces.WWFlowAsm1out PQr annotation (Placement(transformation(
                extent={{-70,-110},{-50,-90}})));
        ASM1.Interfaces.WWFlowAsm1out PQw annotation (Placement(transformation(
                extent={{40,-110},{60,-90}})));
        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS_F = WWSC.vSfun(X_F, ISV);

        // sedimentation flux in bottom layer
        Jsm_F = 0.0;
        Jsm_S = 0.0;

        // ODE of solid component
        der(X_F) = ((Up.Qr + Up.Qw)/Asc*(Up.X_F - X_F) + Up.SedFlux_F)/zm;
        der(X_S) = ((Up.Qr + Up.Qw)/Asc*(Up.X_S - X_S) + Up.SedFlux_S)/zm;

        X = X_F + X_S;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // upward connection
        Up.vS_dn_F = vS_F;
        Up.X_dn_F = X_F;
        Up.X_dn_S = X_S;

        // return and waste sludge volume flow rates
        PQr.Q + Up.Qr = 0;
        PQw.Q + Up.Qw = 0;

        // return sludge flow, solid and soluble components (ASM1)
        PQr.Si = Si;
        PQr.Ss = Ss;
        PQr.Xi = rXi*X;
        PQr.Xs = rXs*X;
        PQr.Xbh = rXbh*X;
        PQr.Xba = rXba*X;
        PQr.Xp = rXp*X;
        PQr.So = So;
        PQr.Sno = Sno;
        PQr.Snh = Snh;
        PQr.Snd = Snd;
        PQr.Xnd = rXnd*X;
        PQr.Salk = Salk;

        // waste sludge flow, solid and soluble components (ASM1)
        PQw.Si = Si;
        PQw.Ss = Ss;
        PQw.Xi = rXi*X;
        PQw.Xs = rXs*X;
        PQw.Xbh = rXbh*X;
        PQw.Xba = rXba*X;
        PQw.Xp = rXp*X;
        PQw.So = So;
        PQw.Sno = Sno;
        PQw.Snh = Snh;
        PQw.Snd = Snd;
        PQw.Xnd = rXnd*X;
        PQw.Salk = Salk;

        annotation (
          Documentation(info="This class models the lowest layer of an ASM1 secondary clarifier based on Otterpohl.

No sedimentation flux (mass exchange) with underneath but hydraulic and sedimentation flux (same direction)
with above layer.
From here return and waste sludge is removed.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end bottom_layer;

      model lower_layer "Layer below influent of Otterpohl`s SC model"

        import WWSC = WasteWater.Components.SecClar.Otterpohl.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWU.MassConcentration Xf "sludge concentration in clarifier feed";
        SI.Length z "vertical coordinate of current layer";
        parameter SI.Length hsc;
        parameter Integer i "number of layers above feed layer";
        Real omega;
        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
      equation

        // sink velocity
        vS_F = WWSC.vSfun(X_F, ISV);
        omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm_F = if vS_F < Dn.vS_dn_F then omega*(vS_F*X_F) else omega*min(vS_F*X_F,
            Dn.vS_dn_F*Dn.X_dn_F);
        Jsm_S = omega*min(vS_S*X_S, vS_S*Dn.X_dn_S);

        // ODE of solid component
        der(X_F) = ((Up.Qr + Up.Qw)/Asc*(Up.X_F - X_F) + Up.SedFlux_F - Jsm_F)/zm;
        der(X_S) = ((Up.Qr + Up.Qw)/Asc*(Up.X_S - X_S) + Up.SedFlux_S - Jsm_S)/zm;

        X = X_F + X_S;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // downward connections
        Dn.Qr + Up.Qr = 0;
        Dn.Qw + Up.Qw = 0;

        Dn.X_F = X_F;
        Dn.X_S = X_S;
        Dn.SedFlux_F = -Jsm_F;
        Dn.SedFlux_S = -Jsm_S;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        // upward connections
        Up.vS_dn_F = vS_F;
        Up.X_dn_F = X_F;
        Up.X_dn_S = X_S;
        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the lowest layer (bottom_layer)
of an ASM1 secondary clarifier based on Otterpohl.

Hydraulic and sedimentation flux (mass exchange in same direction) with above and underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs) and the omega correction function by Haertel.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end lower_layer;

      model feed_layer "Influent layer of Otterpohl`s SC model"

        import WWSC = WasteWater.Components.SecClar.Otterpohl.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWU.MassConcentration Xf "sludge concentration in clarifier feed";
        SI.Length z "vertical coordinate of current layer";
        parameter SI.Length hsc;
        parameter Integer i "number of layers above feed layer";
        Real omega;
        Real fl;

        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        ASM1.Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent=
                 {{-110,-6},{-90,14}})));
      equation

        // sink velocity
        vS_F = WWSC.vSfun(X_F, ISV);
        omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);
        fl = (9.4/ISV)*exp(-1.07*Xf/1000);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm_F = if vS_F < Dn.vS_dn_F then omega*(vS_F*X_F) else omega*min(vS_F*X_F,
            Dn.vS_dn_F*Dn.X_dn_F);
        Jsm_S = omega*min(vS_S*X_S, vS_S*Dn.X_dn_S);

        // ODE of solid component
        der(X_F) = (In.Q/Asc*Xf*(1 - fl) - (-Up.Qe)/Asc*X_F - (-(Dn.Qr + Dn.Qw))/
          Asc*X_F + Up.SedFlux_F - Jsm_F)/zm;
        der(X_S) = (In.Q/Asc*Xf*fl - (-Up.Qe)/Asc*X_S - (-(Dn.Qr + Dn.Qw))/Asc*X_S
           + Up.SedFlux_S - Jsm_S)/zm;

        X = X_F + X_S;

        // ODE of soluble components
        der(Si) = (In.Q*In.Si - (-Up.Qe)*Si - (-(Dn.Qr + Dn.Qw))*Si)/(Asc*zm);
        der(Ss) = (In.Q*In.Ss - (-Up.Qe)*Ss - (-(Dn.Qr + Dn.Qw))*Ss)/(Asc*zm);
        der(So) = (In.Q*In.So - (-Up.Qe)*So - (-(Dn.Qr + Dn.Qw))*So)/(Asc*zm);
        der(Sno) = (In.Q*In.Sno - (-Up.Qe)*Sno - (-(Dn.Qr + Dn.Qw))*Sno)/(Asc*zm);
        der(Snh) = (In.Q*In.Snh - (-Up.Qe)*Snh - (-(Dn.Qr + Dn.Qw))*Snh)/(Asc*zm);
        der(Snd) = (In.Q*In.Snd - (-Up.Qe)*Snd - (-(Dn.Qr + Dn.Qw))*Snd)/(Asc*zm);
        der(Salk) = (In.Q*In.Salk - (-Up.Qe)*Salk - (-(Dn.Qr + Dn.Qw))*Salk)/(Asc*
          zm);

        // volume flow rates
        In.Q + Up.Qe + Dn.Qr + Dn.Qw = 0;

        Dn.SedFlux_F = -Jsm_F;
        Dn.SedFlux_S = -Jsm_S;
        Dn.X_F = X_F;
        Dn.X_S = X_S;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        Up.X_dn_F = X_F;
        Up.X_dn_S = X_S;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;

        annotation (
          Documentation(info="This class models the influent layer of an ASM1 secondary clarifier based on Otterpohl.

It receives the wastewater stream from the biological part (feed).
Hydraulic and sedimentation flux (mass exchange in opposite directions) with above layer
and hydraulic and sedimentation flux (mass exchange in same direction) with underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs) and the omega correction function by Haertel.
"),       Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end feed_layer;

      model upper_layer "Layer above influent of Otterpohl`s SC"

        import WWSC = WasteWater.Components.SecClar.Otterpohl.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS_F = WWSC.vSfun(X_F, ISV);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm_F = vS_F*X_F;
        Jsm_S = vS_S*X_S;

        // ODE of solid component
        der(X_F) = (Dn.Qe/Asc*(Dn.X_dn_F - X_F) + Up.SedFlux_F - Jsm_F)/zm;
        der(X_S) = (Dn.Qe/Asc*(Dn.X_dn_S - X_S) + Up.SedFlux_S - Jsm_S)/zm;

        X = X_F + X_S;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux_F = -Jsm_F;
        Dn.SedFlux_S = -Jsm_S;

        // upward connections
        Up.Qe + Dn.Qe = 0;

        Up.X_dn_F = X_F;
        Up.X_dn_S = X_S;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;

        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the effluent layer (top_layer)
of an ASM1 secondary clarifier based on Otterpohl.

Hydraulic and sedimentation flux (mass exchange in opposite directions) with above and underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs)."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end upper_layer;

      model top_layer "Effluent layer of Otterpohl`s SC model"

        import WWSC = WasteWater.Components.SecClar.Otterpohl.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;
        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        ASM1.Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(
                extent={{90,-10},{110,10}})));
      equation

        // sink velocity
        vS_F = WWSC.vSfun(X_F, ISV);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm_F = vS_F*X_F;
        Jsm_S = vS_S*X_S;

        // ODE of solid component
        der(X_F) = (Dn.Qe/Asc*(Dn.X_dn_F - X_F) - Jsm_F)/zm;
        der(X_S) = (Dn.Qe/Asc*(Dn.X_dn_S - X_S) - Jsm_S)/zm;

        X = X_F + X_S;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux_F = -Jsm_F;
        Dn.SedFlux_S = -Jsm_S;

        // effluent volume flow rate
        Out.Q + Dn.Qe = 0;

        // effluent, solid and soluble components (ASM1)
        Out.Si = Si;
        Out.Ss = Ss;
        Out.Xi = rXi*X;
        Out.Xs = rXs*X;
        Out.Xbh = rXbh*X;
        Out.Xba = rXba*X;
        Out.Xp = rXp*X;
        Out.So = So;
        Out.Sno = Sno;
        Out.Snh = Snh;
        Out.Snd = Snd;
        Out.Xnd = rXnd*X;
        Out.Salk = Salk;
        annotation (
          Documentation(info="This class models the top layer of an ASM1 secondary clarifier based on Otterpohl.

No sedimentation flux (mass exchange) with above but hydraulic and sedimentation flux
(opposite directions) underneath.
From here effluent goes to the receiving water.

Sedimentation flux is calculated based on two sedimentation velocities
(for micro and macro flocs).
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end top_layer;
      annotation (
        Documentation(info="This package contains classes (layer models) to built ASM1 secondary clarifier models, an Interfaces sub-library
and provides an ASM1 10-layer secondary clarifier model all bases on Otterpohls`s [1]
sedimentation velocities for macro and micro flocs and the omega correction function.

A secondary clarifier layer model needs at least a top_layer, a feed_layer and a bottom_layer
and may have several upper_layer in between above the feed_layer and several lower_layer in
between below the feed_layer.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] R. Otterpohl and M. Freund: Dynamic models for clarifiers of activated sludge plants
    with dry and wet weather flows. Water Science and Technology. 26 (1992), pp 1391-1400.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
    end Otterpohl;

    package Simple "Simple ASM1 Secondary clarifier model"
      extends Modelica.Icons.Package;

      model SimpleSecClarMod "Simple ASM1 Secondary Clarifier Model"

        extends WasteWater.Icons.SecClarSimple;
        extends WasteWater.Components.SecClar.Takacs.Interfaces.ratios;
        import SI = Modelica.SIunits;
        package WI = WasteWater.ASM1.Interfaces;
        package WWU = WasteWater.Types;

        parameter SI.Length hsc=4.0 "height of secondary clarifier";
        parameter SI.Area Asc=1500.0 "area of secondary clarifier";

        WWU.MassConcentration Xf "total sludge concentration in clarifier feed";
        WWU.MassConcentration X "sludge concentration in clarifier";
        WWU.MassConcentration Si "Soluble inert organic matter";
        WWU.MassConcentration Ss "Readily biodegradable substrate";
        WWU.MassConcentration So "Dissolved oxygen";
        WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
        WWU.MassConcentration Snh "Ammonium nitrogen";
        WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
        WWU.Alkalinity Salk "Alkalinity";

        WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
                  {-90,24}})));
        WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
                  47},{112,67}})));
        WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
                  -106},{-20,-86}})));
        WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
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

        // ODE of sludge concentration
        der(X) = (Feed.Q*Xf - (-(Waste.Q + Return.Q))*X)/(Asc*hsc);

        // ODE of soluble components
        der(Si) = (Feed.Q*Feed.Si - (-Effluent.Q)*Si - (-(Waste.Q + Return.Q))*Si)/
          (Asc*hsc);
        der(Ss) = (Feed.Q*Feed.Ss - (-Effluent.Q)*Ss - (-(Waste.Q + Return.Q))*Ss)/
          (Asc*hsc);
        der(So) = (Feed.Q*Feed.So - (-Effluent.Q)*So - (-(Waste.Q + Return.Q))*So)/
          (Asc*hsc);
        der(Sno) = (Feed.Q*Feed.Sno - (-Effluent.Q)*Sno - (-(Waste.Q + Return.Q))*
          Sno)/(Asc*hsc);
        der(Snh) = (Feed.Q*Feed.Snh - (-Effluent.Q)*Snh - (-(Waste.Q + Return.Q))*
          Snh)/(Asc*hsc);
        der(Snd) = (Feed.Q*Feed.Snd - (-Effluent.Q)*Snd - (-(Waste.Q + Return.Q))*
          Snd)/(Asc*hsc);
        der(Salk) = (Feed.Q*Feed.Salk - (-Effluent.Q)*Salk - (-(Waste.Q + Return.Q))
           *Salk)/(Asc*hsc);

        // volume flow rates
        Feed.Q + Effluent.Q + Return.Q + Waste.Q = 0;

        // effluent, solid and soluble components (ASM1)
        Effluent.Si = Si;
        Effluent.Ss = Ss;
        Effluent.Xi = 0.0*X;
        Effluent.Xs = 0.0*X;
        Effluent.Xbh = 0.0*X;
        Effluent.Xba = 0.0*X;
        Effluent.Xp = 0.0*X;
        Effluent.So = So;
        Effluent.Sno = Sno;
        Effluent.Snh = Snh;
        Effluent.Snd = Snd;
        Effluent.Xnd = 0.0*X;
        Effluent.Salk = Salk;

        // return sludge flow, solid and soluble components (ASM1)
        Return.Si = Si;
        Return.Ss = Ss;
        Return.Xi = rXi*X;
        Return.Xs = rXs*X;
        Return.Xbh = rXbh*X;
        Return.Xba = rXba*X;
        Return.Xp = rXp*X;
        Return.So = So;
        Return.Sno = Sno;
        Return.Snh = Snh;
        Return.Snd = Snd;
        Return.Xnd = rXnd*X;
        Return.Salk = Salk;

        // waste sludge flow, solid and soluble components (ASM1)
        Waste.Si = Si;
        Waste.Ss = Ss;
        Waste.Xi = rXi*X;
        Waste.Xs = rXs*X;
        Waste.Xbh = rXbh*X;
        Waste.Xba = rXba*X;
        Waste.Xp = rXp*X;
        Waste.So = So;
        Waste.Sno = Sno;
        Waste.Snh = Snh;
        Waste.Snd = Snd;
        Waste.Xnd = rXnd*X;
        Waste.Salk = Salk;

        annotation (
          Documentation(info="This component models very simple the secondary clarification process by
just using a single fully mixed tank which removes all particulate substances from the effluent
and returns the sludge. No sedimentation and compression, etc. is considered (for ASM1).

Parameters:
  hsc -    height of clarifier [m]
  Asc -    surface area of sec. clar. [m2]
"),       Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{-20,-70},{20,-70},{4,-84},{-4,-84},{-20,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-4,-84},{4,-92}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,-48},{-36,-64},{38,-64},{80,-48},{-80,-48}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-80,62},{80,-40}},
                lineColor={223,191,159},
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Text(extent={{-80,98},{80,66}}, textString=
                                                  "%name"),
              Polygon(
                points={{-36,-64},{38,-64},{20,-70},{-20,-70},{-36,-64}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Line(
                points={{4,-92},{4,-84},{20,-70},{80,-48}},
                thickness=0.5),
              Rectangle(
                extent={{-80,-40},{80,-48}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{80,62},{92,54}},
                lineColor={0,127,255},
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{80,54},{92,54}},
                thickness=0.5),
              Line(
                points={{-4,-92},{-4,-84},{-20,-70},{-80,-48},{-80,10}},
                thickness=0.5),
              Line(
                points={{-80,62},{-80,16}},
                thickness=0.5),
              Line(
                points={{-80,10},{-90,10}},
                thickness=0.5),
              Line(
                points={{-80,16},{-90,16}},
                thickness=0.5),
              Rectangle(
                extent={{-20,-92},{20,-98}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-20,-92},{-4,-92}},
                thickness=0.5),
              Line(
                points={{-20,-98},{20,-98}},
                thickness=0.5),
              Line(
                points={{20,-92},{4,-92}},
                thickness=0.5),
              Line(
                points={{80,-48},{80,54}},
                thickness=0.5),
              Text(extent={{-100,-60},{-40,-80}}, textString=
                                                      "return"),
              Text(extent={{40,-60},{100,-80}}, textString=
                                                    "waste"),
              Polygon(
                points={{16,44},{33,44},{31,52},{48,42},{31,31},{33,39},{16,39},{16,
                    44}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,32},{-29,32},{-31,40},{-14,30},{-31,19},{-29,27},{-46,
                    27},{-46,32}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{18,-26},{22,-26},{22,-42},{28,-40},{20,-54},{12,-40},{18,
                    -42},{18,-26}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={191,95,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-32,-10},{-28,-10},{-28,-26},{-22,-24},{-30,-38},{-38,-24},
                    {-32,-26},{-32,-10}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={191,95,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-90,16},{-80,10}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end SimpleSecClarMod;
      annotation (
        Documentation(info="This package just provides a very simple ASM1 secondary clarifier model
with no sludge storage, no sludge sedimentation and no use of layers.
The model consists of one tank removing all particulate substances.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2002, Gerald Reichl
"));
    end Simple;

    package Takacs "Secondary settling tank modelling by Takacs"
      extends Modelica.Icons.Package;

      package Interfaces
        "Connectors and partial models for Secondary Clarifier Model by Takacs"

        extends Modelica.Icons.Package;

        connector UpperLayerPin "Connector above influent layer"

          package WWU = WasteWater.Types;

          // effluent flow
          flow WWU.VolumeFlowRate Qe;
          // sedimentation flux
          flow WWU.SedimentationFlux SedFlux;

            // total sludge concentration and sink velocity in (m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn;
          WWU.SedimentationVelocity vS_dn;

          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers above the influent layer (feed_layer)."));
        end UpperLayerPin;

        connector LowerLayerPin "Connector below influent layer"

          package WWU = WasteWater.Types;

          // return and waste sludge flow Qr, Qw
          flow WWU.VolumeFlowRate Qr;
          flow WWU.VolumeFlowRate Qw;

          // sedimentation flux
          flow WWU.SedimentationFlux SedFlux;

          // total sludge concentration in m-th layer
          WWU.MassConcentration X;

            // total sludge concentration and sink velocity in(m-1)-th layer (dn=down)
          WWU.MassConcentration X_dn;
          WWU.SedimentationVelocity vS_dn;

          // soluble components
          WWU.MassConcentration Si;
          WWU.MassConcentration Ss;
          WWU.MassConcentration So;
          WWU.MassConcentration Sno;
          WWU.MassConcentration Snh;
          WWU.MassConcentration Snd;
          WWU.Alkalinity Salk;
          annotation (
            Documentation(info=
                  "Connector for ASM1 information and mass exchange between layers below the influent layer (feed_layer)."));
        end LowerLayerPin;

        partial model SCParam "partial model providing clarifier parameters"
          import SI = Modelica.SIunits;
          parameter SI.Length zm;
          parameter SI.Area Asc;

          annotation (
            Documentation(info="partial model providing clarifier parameters"));
        end SCParam;

        partial model SCVar "partial models providing variables"

          package WWU = WasteWater.Types;

          WWU.MassConcentration X "total sludge concentration in m-th layer";
          WWU.MassConcentration Xf "total sludge concentration in clarifier feed";
          WWU.SedimentationVelocity vS "sink velocity in m-th layer";
          WWU.SedimentationFlux Jsm "sedimentation flux m-th layer";

          WWU.MassConcentration Si "Soluble inert organic matter";
          WWU.MassConcentration Ss "Readily biodegradable substrate";
          WWU.MassConcentration So "Dissolved oxygen";
          WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
          WWU.MassConcentration Snh "Ammonium nitrogen";
          WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
          WWU.Alkalinity Salk "Alkalinity";
          annotation (
            Documentation(info="partial models providing ASM1 variables"));
        end SCVar;

        partial model ratios "partial model for ratios of solid components"

          // ratios of solid components
          Real rXi;
          Real rXs;
          Real rXbh;
          Real rXba;
          Real rXp;
          Real rXnd;
          annotation (
            Documentation(info="partial model for ASM1 ratios of solid components"));
        end ratios;

        function vSfun "Sedimentation velocity function"

          // total sludge concentration in m-th layer in g/m3 or mg/l
          input Real X;
          // total sludge concentration in clarifier feed in g/m3 or mg/l
          input Real Xf;
          // sink velocity in m/d
          output Real vS;

          parameter Real v0slash=250.0 "max. settling velocity in m/d";
          parameter Real v0=474.0 "max. Vesilind settl. veloc. in m/d";
          parameter Real rh=0.000576 "hindered zone settl. param. in m3/(g SS)";
          parameter Real rp=0.00286 "flocculant zone settl. param. in m3/(g SS)";
          parameter Real fns=0.00228 "non-settleable fraction in -";
        algorithm

          // computation of sink velocity
          vS := max(0.0, min(v0slash, v0*(exp(-rh*(X - fns*Xf)) - exp(-rp*(X - fns*
            Xf)))));

          annotation (
            Documentation(info=
                  "Takacs double-exponential sedimentation velocity function."));
        end vSfun;
        annotation (
          Documentation(info="This package contains connectors and interfaces (partial models) for
the ASM1 secondary clarifier model based on Takacs [1] (double-exponential settling velocity).

References:

[1] I. Takacs and G.G. Patry and D. Nolasco: A dynamic model of the clarification-thickening
    process. Water Research. 25 (1991) 10, pp 1263-1271.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2001, Gerald Reichl
"));
      end Interfaces;

      model SecClarModTakacs "Secondary Clarifier ASM1 Model based on Takacs"

        extends WasteWater.Icons.SecClar;
        extends Interfaces.ratios;
        package SCP = Takacs;
        import SI = Modelica.SIunits;
        package WI = WasteWater.ASM1.Interfaces;
        package WWU = WasteWater.Types;

        parameter SI.Length hsc=4.0 "height of secondary clarifier";
        parameter Integer n=10 "number of layers of SC model";
        parameter SI.Length zm=hsc/(1.0*n)
          "height of m-th secondary clarifier layer";
        parameter SI.Area Asc=1500.0 "area of secondary clarifier";
        parameter WWU.MassConcentration Xt=3000.0 "threshold for X";

        // total sludge concentration in clarifier feed
        WWU.MassConcentration Xf;

        WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
                  {-90,24}})));
        WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
                  47},{112,67}})));
        WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
                  -106},{-20,-86}})));
        WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
                  -106},{40,-86}})));

        // layers 1 to 10
        SCP.bottom_layer S1(
          zm=zm,
          Asc=Asc,
          Xf=Xf,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,-93},{35,-78}})));
        SCP.lower_layer S2(
          zm=zm,
          Asc=Asc,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}})));
        SCP.lower_layer S3(
          zm=zm,
          Asc=Asc,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}})));
        SCP.lower_layer S4(
          zm=zm,
          Asc=Asc,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-36},{35,-21}})));
        SCP.lower_layer S5(
          zm=zm,
          Asc=Asc,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,-17},{35,-2}})));
        SCP.feed_layer S6(
          zm=zm,
          Asc=Asc,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,2},{35,17}})));
        SCP.upper_layer S7(
          zm=zm,
          Asc=Asc,
          Xf=Xf,
          Xt=Xt) annotation (Placement(transformation(extent={{-35,21},{35,36}})));
        SCP.upper_layer S8(
          zm=zm,
          Asc=Asc,
          Xt=Xt,
          Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}})));
        SCP.upper_layer S9(
          zm=zm,
          Asc=Asc,
          Xf=Xf,
          Xt=Xt) annotation (Placement(transformation(extent={{-35,59},{35,74}})));
        SCP.top_layer S10(
          zm=zm,
          Asc=Asc,
          Xf=Xf,
          Xt=Xt,
          rXs=rXs,
          rXbh=rXbh,
          rXba=rXba,
          rXp=rXp,
          rXi=rXi,
          rXnd=rXnd) annotation (Placement(transformation(extent={{-35,78},{35,93}})));
      equation

        connect(S1.Up, S2.Dn) annotation (Line(points={{0,-78},{0,-78},{2,-78},{2,-76},{-2,-76},{-2,-74}}));
        connect(S2.Up, S3.Dn) annotation (Line(points={{0,-59},{0,-58},{0,-58},{2,-58},{-2,-58},{-2,-55}}));
        connect(S3.Up, S4.Dn) annotation (Line(points={{0,-40},{0,-40},{2,-40},{2,-38},{-2,-38},{-2,-36}}));
        connect(S5.Up, S6.Dn) annotation (Line(points={{0,-2},{0,-2},{2,-2},{2,0},{-2,0},{-2,2}}));
        connect(S6.Up, S7.Dn) annotation (Line(points={{0,17},{0,18},{2,18},{2,20},{-2,20},{-2,21}}));
        connect(S7.Up, S8.Dn) annotation (Line(points={{0,36},{0,38},{0,38},{2,38},{-2,38},{-2,40}}));
        connect(S9.Up, S10.Dn) annotation (Line(points={{0,74},{0,76},{0,76},{2,76},{-2,76},{-2,78}}));
        connect(S4.Up, S5.Dn) annotation (Line(points={{0,-21},{0,-20},{0,-20},{2,-20},{-2,-20},{-2,-17}}));
        connect(S8.Up, S9.Dn) annotation (Line(points={{0,55},{0,56},{2,56},{2,58},{-2,58},{-2,59}}));
        connect(Feed, S6.In) annotation (Line(points={{-100,14},{-67,14},{-67,9,8},{-35,9,8}}));
        connect(S1.PQw, Waste) annotation (Line(points={{17,5,-93},{17,5,-96},{30,-96}}));
        connect(S10.Out, Effluent) annotation (Line(points={{35,85,5},{67,85,5},{67,57},{102,57}}));
        connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-21,-96},{-30,-96}}));

        // total sludge concentration in clarifier feed
        Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

        // ratios of solid components
        rXs = Feed.Xs/Xf;
        rXbh = Feed.Xbh/Xf;
        rXba = Feed.Xba/Xf;
        rXp = Feed.Xp/Xf;
        rXi = Feed.Xi/Xf;
        rXnd = Feed.Xnd/Xf;
        annotation (
          Documentation(info="This component models an ASM1 10 - layer secondary clarifier model with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Takac`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]

"));
      end SecClarModTakacs;

      model bottom_layer "Bottom layer of Takac`s SC model"

        import WWSC = WasteWater.Components.SecClar.Takacs.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;
        ASM1.Interfaces.WWFlowAsm1out PQr annotation (Placement(transformation(
                extent={{-70,-110},{-50,-90}})));
        ASM1.Interfaces.WWFlowAsm1out PQw annotation (Placement(transformation(
                extent={{40,-110},{60,-90}})));
        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, Xf);
        Jsm = 0.0;

        // ODE of solid component
        der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux)/zm;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // upward connection
        Up.vS_dn = vS;
        Up.X_dn = X;

        // return and waste sludge volume flow rates
        PQr.Q + Up.Qr = 0;
        PQw.Q + Up.Qw = 0;

        // return sludge flow, solid and soluble components (ASM1)
        PQr.Si = Si;
        PQr.Ss = Ss;
        PQr.Xi = rXi*X;
        PQr.Xs = rXs*X;
        PQr.Xbh = rXbh*X;
        PQr.Xba = rXba*X;
        PQr.Xp = rXp*X;
        PQr.So = So;
        PQr.Sno = Sno;
        PQr.Snh = Snh;
        PQr.Snd = Snd;
        PQr.Xnd = rXnd*X;
        PQr.Salk = Salk;

        // waste sludge flow, solid and soluble components (ASM1)
        PQw.Si = Si;
        PQw.Ss = Ss;
        PQw.Xi = rXi*X;
        PQw.Xs = rXs*X;
        PQw.Xbh = rXbh*X;
        PQw.Xba = rXba*X;
        PQw.Xp = rXp*X;
        PQw.So = So;
        PQw.Sno = Sno;
        PQw.Snh = Snh;
        PQw.Snd = Snd;
        PQw.Xnd = rXnd*X;
        PQw.Salk = Salk;

        annotation (
          Documentation(info="This class models the lowest layer of an ASM1 secondary clarifier based on Takacs.

No sedimentation flux (mass exchange) with underneath but hydraulic and sedimentation flux (same direction)
with above layer.
From here return and waste sludge is removed.
"),       Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end bottom_layer;

      model lower_layer "Layer below influent of Takac`s SC model"

        import WWSC = WasteWater.Components.SecClar.Takacs.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, Xf);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = min(vS*X, Dn.vS_dn*Dn.X_dn);

        // ODE of solid component
        der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
        der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
        der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
        der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
        der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
        der(Snd) = (Up.Qr + Up.Qw)*(Up.Snd - Snd)/(Asc*zm);
        der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

        // downward connections
        Dn.Qr + Up.Qr = 0;
        Dn.Qw + Up.Qw = 0;

        Dn.X = X;
        Dn.SedFlux = -Jsm;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        // upward connections
        Up.vS_dn = vS;
        Up.X_dn = X;
        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the lowest layer (bottom_layer)
of an ASM1 secondary clarifier based on Takacs.

Hydraulic and sedimentation flux (mass exchange in same direction) with above and underneath layer.

Sedimentation flux is calculated based on the double-exponential sedimentation velocity
function by Takacs."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                    68},{-68,68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end lower_layer;

      model feed_layer "Influent layer of Takac`s SC model"

        import WWSC = WasteWater.Components.SecClar.Takacs.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
        ASM1.Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent=
                 {{-110,-6},{-90,14}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, Xf);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = min(vS*X, Dn.vS_dn*Dn.X_dn);

        // ODE of solid component
        der(X) = (In.Q/Asc*Xf - (-Up.Qe)/Asc*X - (-(Dn.Qr + Dn.Qw))/Asc*X + Up.
          SedFlux - Jsm)/zm;

        // ODE of soluble components
        der(Si) = (In.Q*In.Si - (-Up.Qe)*Si - (-(Dn.Qr + Dn.Qw))*Si)/(Asc*zm);
        der(Ss) = (In.Q*In.Ss - (-Up.Qe)*Ss - (-(Dn.Qr + Dn.Qw))*Ss)/(Asc*zm);
        der(So) = (In.Q*In.So - (-Up.Qe)*So - (-(Dn.Qr + Dn.Qw))*So)/(Asc*zm);
        der(Sno) = (In.Q*In.Sno - (-Up.Qe)*Sno - (-(Dn.Qr + Dn.Qw))*Sno)/(Asc*zm);
        der(Snh) = (In.Q*In.Snh - (-Up.Qe)*Snh - (-(Dn.Qr + Dn.Qw))*Snh)/(Asc*zm);
        der(Snd) = (In.Q*In.Snd - (-Up.Qe)*Snd - (-(Dn.Qr + Dn.Qw))*Snd)/(Asc*zm);
        der(Salk) = (In.Q*In.Salk - (-Up.Qe)*Salk - (-(Dn.Qr + Dn.Qw))*Salk)/(Asc*
          zm);

        // volume flow rates
        In.Q + Up.Qe + Dn.Qr + Dn.Qw = 0;

        Dn.SedFlux = -Jsm;
        Dn.X = X;

        Dn.Si = Si;
        Dn.Ss = Ss;
        Dn.So = So;
        Dn.Sno = Sno;
        Dn.Snh = Snh;
        Dn.Snd = Snd;
        Dn.Salk = Salk;

        Up.vS_dn = vS;
        Up.X_dn = X;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;
        annotation (
          Documentation(info="This class models the influent layer of an ASM1 secondary clarifier based on Takacs.

It receives the wastewater stream from the biological part (feed).
Hydraulic and sedimentation flux (mass exchange in opposite directions) with above layer
and hydraulic and sedimentation flux (mass exchange in same direction) with underneath layer.

Sedimentation flux is calculated based on the double-exponential sedimentation velocity
function by Takacs."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                    {-52,-40},{-68,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid)}));
      end feed_layer;

      model upper_layer "Layer above influent of Takac`s SC"
        // Xt = Xthreshold

        import WWSC = WasteWater.Components.SecClar.Takacs.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        parameter WWU.MassConcentration Xt;

        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
                  {10,110}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, Xf);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = if Dn.X_dn <= Xt then vS*X else min(vS*X, Dn.vS_dn*Dn.X_dn);

        // ODE of solid component
        der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) + Up.SedFlux - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux = -Jsm;

        // upward connections
        Up.Qe + Dn.Qe = 0;

        Up.vS_dn = vS;
        Up.X_dn = X;

        Up.Si = Si;
        Up.Ss = Ss;
        Up.So = So;
        Up.Sno = Sno;
        Up.Snh = Snh;
        Up.Snd = Snd;
        Up.Salk = Salk;
        annotation (
          Documentation(info="This class models the layers between the influent layer (feed_layer) and the effluent layer (top_layer)
an ASM1 secondary clarifier based on Takacs.

Hydraulic and sedimentation flux (mass exchange in opposite directions) with above and underneath layer.

Sedimentation flux is calculated based on the double-exponential sedimentation velocity
function by Takacs."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                    40},{-68,40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                    68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end upper_layer;

      model top_layer "Effluent layer of Takac`s SC model"

        import WWSC = WasteWater.Components.SecClar.Takacs.Interfaces;
        extends WWSC.SCParam;
        extends WWSC.SCVar;
        extends WWSC.ratios;

        parameter WWU.MassConcentration Xt;
        // Xt = Xthreshold

        WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
                  -110},{10,-90}})));
        ASM1.Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(
                extent={{90,-10},{110,10}})));
      equation

        // sink velocity
        vS = WWSC.vSfun(X, Xf);

        // sedimentation flux in m-th layer sinking to lower layer
        Jsm = if Dn.X_dn <= Xt then vS*X else min(vS*X, Dn.vS_dn*Dn.X_dn);

        // ODE of solid component
        der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) - Jsm)/zm;

        // ODEs of soluble components
        der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
        der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
        der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
        der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
        der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
        der(Snd) = Dn.Qe*(Dn.Snd - Snd)/(Asc*zm);
        der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

        // downward connection
        Dn.SedFlux = -Jsm;

        // effluent volume flow rate
        Out.Q + Dn.Qe = 0;

        // effluent, solid and soluble components (ASM1)
        Out.Si = Si;
        Out.Ss = Ss;
        Out.Xi = rXi*X;
        Out.Xs = rXs*X;
        Out.Xbh = rXbh*X;
        Out.Xba = rXba*X;
        Out.Xp = rXp*X;
        Out.So = So;
        Out.Sno = Sno;
        Out.Snh = Snh;
        Out.Snd = Snd;
        Out.Xnd = rXnd*X;
        Out.Salk = Salk;
        annotation (
          Documentation(info="This class models the top layer of an ASM1 secondary clarifier based on Takacs.

No sedimentation flux (mass exchange) with above but hydraulic and sedimentation flux
(opposite directions) underneath.
From here effluent goes to the receiving water.

Sedimentation flux is calculated based on the double-exponential sedimentation velocity
function by Takacs."),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Text(extent={{-100,20},{100,-20}}, textString=
                                                     "%name"),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-100,100},{100,-100}}),
              Polygon(
                points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                    -40},{52,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={223,191,159},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                    58}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                    {-52,-70},{-68,-70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid)}));
      end top_layer;
      annotation (
        Documentation(info="This package contains classes (layer models) to built ASM1 secondary clarifier models, an Interfaces sub-library
and provides an ASM1 10-layer secondary clarifier model all bases on Takacs [1]
double exponential sedimentation velocity function.

A secondary clarifier layer model needs at least a top_layer, a feed_layer and a bottom_layer
and may have several upper_layer in between above the feed_layer and several lower_layer in
between below the feed_layer.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] I. Takacs and G.G. Patry and D. Nolasco: A dynamic model of the clarification-thickening
    process. Water Research. 25 (1991) 10, pp 1263-1271.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2002, Gerald Reichl
"));
    end Takacs;
  annotation (
    Documentation(info="This library provides a collection of ASM1 secondary clarifier models based on
several theories.

The library currently is structured in following sub-libraries.

 - Takacs: secondary clarifier model by Takacs et al [1]
 - Haertel: secondary clarifier model by Haertel [2]
 - Otterpohl: secondary clarifier model by Otterpohl [3]
 - Krebs: secondary clarifier model by Krebs [4]
 - Simple: very basic secondary clarifier model


Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] I. Takacs and G.G. Patry and D. Nolasco: A dynamic model of the clarification-thickening
    process. Water Research. 25 (1991) 10, pp 1263-1271.

[2] L. Haertel: Modellansaetze zur dynamischen Simulation des Belebtschlammverfahrens.
    TH Darmstadt, Dissertation, 1990.

[3] R. Otterpohl and M. Freund: Dynamic models for clarifiers of activated sludge plants
    with dry and wet weather flows. Water Science and Technology. 26 (1992), pp 1391-1400.

[4] P. Krebs and M. Armbruster and W. Rodi: Numerische Nachklaerbeckenmodelle. Korrespondenz Abwasser. 47 (7)
    2000. pp 985-999.


This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2003, Gerald Reichl
"));
  end SecClar;

  package WIP
    extends Modelica.Icons.InternalPackage;
    extends Modelica.Icons.ObsoleteModel;

    model ASM1SmallPlantRun "Small ASM1 Plant example using the new universal structure"
      import WasteWater;
      extends Modelica.Icons.Example;

      WasteWater.Components.WIP.Nitri tank2(V=1333, ASM1(
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
          useAir=true)) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
      Components.EffluentSink
                        Effluent annotation (Placement(transformation(extent={{90,-32},{110,-12}})));
      Components.SludgeSink
                      WasteSludge annotation (Placement(transformation(extent={{88,-56},{108,-36}})));
      Components.Divider2
                    divider annotation (Placement(transformation(extent={{20,-6},
                {40,14}})));
      WasteWater.Components.WIP.Deni tank1(V=3000, ASM1(
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
          useAir=false)) annotation (Placement(transformation(extent={{-71,0},{-51,20}})));
      WasteWater.Components.WIP.Nitri tank3(V=1333, ASM1(
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
          useAir=true)) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
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
      Sensors.sensor_NH sensor_NH annotation (Placement(transformation(extent={{80,24.5},{96,39.5}})));
      Sensors.sensor_NO sensor_NO annotation (Placement(transformation(extent={{100,24},{116,40}})));
      Sensors.sensor_TKN sensor_TKN annotation (Placement(transformation(extent={{100,8},{116,-8}})));
      Sensors.sensor_COD sensor_COD annotation (Placement(transformation(extent={{80,8},{96,-8}})));
      Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
        annotation (Placement(transformation(extent={{29,50},{49,70}})));
      Sensors.sensor_TSS sensor_TSS annotation (Placement(transformation(extent={{32,20},{48,36}})));
      Modelica.Blocks.Sources.Constant constantInflow[14](k={WWS.Q,WWS.Si,WWS.Ss,WWS.Xi,WWS.Xs,WWS.Xbh,WWS.Xba,WWS.Xp,WWS.So,WWS.Sno,WWS.Snh,WWS.Snd,WWS.Xnd,WWS.Salk}) annotation (Placement(transformation(extent={{-50,70},{-70,90}})));
      inner parameter WWSystem WWS(BioTreat=WasteWater.Types.BioTreatment.ASM1)
                   annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
    equation
      connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{0,-40},{0,0}}));
      connect(Feedback.y, PI1.u) annotation (Line(points={{81,60},{86,60}}));
      connect(OxygenSetpoint.y, Feedback.u1)
        annotation (Line(points={{50,60},{64,60}}, color={0,0,255}));
      connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{80,-47.2},{84,-47.2},{84,-47.2},{88,-47.2}}));
      connect(WastePump.u, Constant2.y)
        annotation (Line(points={{61,-47.4},{48,-47.4},{48,-60},{41,-60}},
                                                                       color={0,0,
              255}));
      connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-30,-40},{-30,0}}));
      connect(Constant2.y, ReturnPump.u) annotation (Line(points={{41,-60},{48,-60},{48,-32.6},{39,-32.6}},
                                             color={0,0,255}));

      connect(constantInflow.y, WWSource.data) annotation (Line(points={{-71,80},{-81,80}}, color={0,0,127}));
      connect(Temperature.y, tank1.T) annotation (Line(points={{-83.4,54},{-74,54},{-74,14},{-70,14}}, color={0,0,127}));
      connect(tank2.T, Temperature.y) annotation (Line(points={{-39,14},{-44,14},{-44,54},{-83.4,54}}, color={0,0,127}));
      connect(tank3.T, Temperature.y) annotation (Line(points={{-9,14},{-16,14},{-16,54},{-83.4,54}},  color={0,0,127}));
      connect(Effluent.In, Settler.Effluent) annotation (Line(points={{90,-20},{80,-20},{80,15.7},{70.2,15.7}}, color={191,95,0}));
      connect(sensor_O2.In, tank3.MeasurePort) annotation (Line(points={{6,30},{6,14}}, color={191,95,0}));
      connect(WWSource.Out, mixer.In1) annotation (Line(points={{-99.8,73},{-112,73},{-112,33.5},{-100,33.5}}, color={191,95,0}));
      connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{20,-32.8},{-112,-32.8},{-112,29.5},{-100,29.5}}, color={191,95,0}));
      connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-90,-14.8},{-106,-14.8},{-106,25.5},{-100,25.5}}, color={191,95,0}));
      connect(mixer.Out, tank1.In) annotation (Line(points={{-80,29.6},{-76,29.6},{-76,10},{-71,10}}, color={191,95,0}));
      connect(tank1.Out, tank2.In) annotation (Line(points={{-51,10},{-40,10}}, color={191,95,0}));
      connect(tank2.Out, tank3.In) annotation (Line(points={{-20,10},{-10,10}}, color={191,95,0}));
      connect(tank3.Out, divider.In) annotation (Line(points={{10,10},{16,10},{16,4},{20,4}}, color={191,95,0}));
      connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.2},{46,6.2},{46,11.4},{50,11.4}}, color={191,95,0}));
      connect(sensor_TSS.In, divider.Out1) annotation (Line(points={{40,20},{40,6.2}}, color={191,95,0}));
      connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,1.6},{46,1.6},{46,-8.7},{-70,-8.7}}, color={191,95,0}));
      connect(Settler.Return, ReturnPump.In) annotation (Line(points={{57,0.4},{57,-26.7},{40,-26.7}}, color={191,95,0}));
      connect(Settler.Waste, WastePump.In) annotation (Line(points={{63,0.4},{63,-32},{54,-32},{54,-53.3},{60,-53.3}}, color={191,95,0}));
      connect(sensor_O2.So, Feedback.u2) annotation (Line(points={{15.8,40},{72,40},{72,52}}, color={0,0,127}));
      connect(PI1.y, blower2.u) annotation (Line(points={{109,60},{118,60},{118,-80},{16,-80},{16,-53},{11,-53}}, color={0,0,127}));
      connect(Settler.Effluent, sensor_NH.In) annotation (Line(points={{70.2,15.7},{88,15.7},{88,24.5}}, color={191,95,0}));
      connect(Settler.Effluent, sensor_COD.In) annotation (Line(points={{70.2,15.7},{70.2,16},{88,16},{88,8}}, color={191,95,0}));
      connect(Settler.Effluent, sensor_NO.In) annotation (Line(points={{70.2,15.7},{108,15.7},{108,24}}, color={191,95,0}));
      connect(Settler.Effluent, sensor_TKN.In) annotation (Line(points={{70.2,15.7},{108,15.7},{108,8}}, color={191,95,0}));
      connect(Constant1.y, blower1.u) annotation (Line(points={{-59,-70},{-14,-70},{-14,-53},{-19,-53}}, color={0,0,127}));
      connect(Constant1.y, RecyclePump.u) annotation (Line(points={{-59,-70},{-48,-70},{-48,-14.6},{-71,-14.6}}, color={0,0,127}));
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
    end ASM1SmallPlantRun;

  model Deni "Denitrification tank"
    extends WasteWater.Icons.Deni;
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
    extends WasteWater.Icons.Nitri;
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

  outer WWSystem WWS(
        Tank1_Si(displayUnit="mg/l") = 30,
        Tank1_Ss(displayUnit="mg/l") = 2.395032857582,
        Tank1_Xi(displayUnit="mg/l") = 1275.518549259,
        Tank1_Xs(displayUnit="mg/l"),
        Tank1_Xbh(displayUnit="mg/l"),
        Tank1_Xba(displayUnit="mg/l"),
        Tank1_Xp(displayUnit="mg/l"),
        Tank1_So(displayUnit="mg/l"),
        Tank1_Sno(displayUnit="mg/l"),
        Tank1_Snh(displayUnit="mg/l"),
        Tank1_Snd(displayUnit="mg/l"),
        Tank1_Xnd(displayUnit="mg/l"))
                     annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

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
  end WIP;
end Components;
