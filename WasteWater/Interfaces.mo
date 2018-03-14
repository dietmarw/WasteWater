within WasteWater;
package Interfaces "Colection of special interfaces"
  extends Modelica.Icons.InterfacesPackage;
  connector MassConcentrationOutput =
                         output WasteWater.Types.MassConcentration           "Real output connector in [g/m3]"   annotation (
    defaultComponentName="y",
    Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})}),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-100.0,50.0},{0.0,0.0},{-100.0,-50.0}}),
      Text(
        lineColor={0,0,127},
        extent={{30.0,60.0},{30.0,110.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type Real and unit g/m<sup>3</sup>.
</p>
</html>"));
  connector VolumeFlowRateOutput =
                         output WasteWater.Types.MassConcentration           "Real output connector in [m3/d]"   annotation (
    defaultComponentName="y",
    Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})}),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-100.0,50.0},{0.0,0.0},{-100.0,-50.0}}),
      Text(
        lineColor={0,0,127},
        extent={{30.0,60.0},{30.0,110.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type Real and unit m<sup>3</sup>/d.
</p>
</html>"));
  connector WWFlow "Waste water flow connector"
   // parameter Boolean FilledIcon = true "If true a filled icon = inport is displayed";
    flow Types.VolumeFlowRate Q;
    Types.MassConcentration Si;
    Types.MassConcentration Ss;
    Types.MassConcentration Xi;
    Types.MassConcentration Xs;
    Types.MassConcentration Xbh;
    Types.MassConcentration Xba;
    Types.MassConcentration Xp;
    Types.MassConcentration So;
    Types.MassConcentration Sno;
    Types.MassConcentration Snh;
    Types.MassConcentration Snd;
    Types.MassConcentration Xnd;
    Types.Alkalinity Salk;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}),
          graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,95,0},
              fillColor={191,95,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
      Documentation(info="<html>
<p>
The connector consists of one flow variable and, dependent on the system type
of:
</p>
<ul> 
  <li>ASM1: 13 potential variables (ASM1 concentrations)</li>
  <li>ASM2d: 19 potential variables (ASM2d concentrations)</li>
  <li>ASM3: 13 potential variables (ASM3 concentrations)</li>
</ul>
<p>
The parameter <code>FilledIcon</code> controls the design only.
</p>
</html>
"));

  end WWFlow;

  connector AirFlow "Airflow connector"
     Types.VolumeFlowRate Q_air;
    annotation (
      Documentation(info="<html>
<p>
The Airflow connector consists of a flow variable describing the exchange of
air between blower and nitrification tank.
</p>
</html>
"),   Icon(graphics={
             Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
  end AirFlow;

  partial model TankInterface
    extends Data.ASM1.vars;
    parameter Boolean useAir=false "Enable air port"
      annotation(choices(checkBox=true),Dialog(group="Tank"));
    WWFlow In annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    WWFlow Out annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    AirFlow AirIn if useAir annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));

    Modelica.Blocks.Interfaces.RealInput T
     annotation (Placement(transformation(extent={{-100,30},{-80,50}})));

  protected
     AirFlow Air;
  equation
    connect(Air,AirIn);
  end TankInterface;

  partial model Tank
    /* tank specific parameters */
    parameter Modelica.SIunits.Volume V(start=1000) "Volume of denitrification tank"
      annotation(Dialog(group="Tank"));
    extends TankInterface;

    /* aeration system dependent parameters */
    parameter Real alpha=0.7 "Oxygen transfer factor" annotation(Dialog(group="Tank", enable=useAir));
    parameter Modelica.SIunits.Length de=4.5 "Depth of aeration" annotation(Dialog(group="Tank", enable=useAir));
    parameter Real R_air=23.5 "Specific oxygen feed factor [gO2/(m3*m)]" annotation(Dialog(group="Tank", enable=useAir));

    WWU.MassConcentration So_sat "Dissolved oxygen saturation";
    WWU.AerationRate aeration "Ration of air";
    outer Components.WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

  equation
    So_sat =13.89 + (-0.3825 + (0.007311 - 0.00006588*T)*T)*T
      "Temperature dependent oxygen saturation by Simba";

    /* extends the Oxygen differential equation by an aeration term aeration [mgO2/l];
  AirIn.Q_air needs to be in Simulationtimeunit [m3/day] 
  aeration = Kla * (So_sat - So);
  Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
  Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
  */
    aeration =(alpha*(So_sat - So)/So_sat*Air.Q_air*R_air*de)/V;
    if not useAir then
      Air.Q_air = 0;
    end if;

  end Tank;

  partial model ASMbase "Base class of WWTP modelling by ASMx"
    extends Tank;

    outer Components.WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

    /* parameters based on the original ASM1 publication based on 15 deg C */

    parameter WWU.PerDay mu_h_T=4.0
      "Maximum heterotrophic growth rate at T=15 deg C [1/d]";
    parameter WWU.PerDay b_h_T=0.28 "Heterotrophic decay rate at T=15 deg C [1/d]";
    parameter WWU.PerDay mu_a_T=0.5
      "Maximum autotrophic growth rate at T=15 deg C [1/d]";
    parameter WWU.PerDay b_a_T=0.1 "Autotrophic decay rate at T=15 deg C [1/d]";
    parameter Real k_a_T=0.06
      "Ammonification rate at T=15 deg C [m3/(g COD day)]";
    parameter Real k_h_T=1.75
      "Maximum specific hydrolysis rate at T=15 deg C [g Xs/(g Xbh COD day)]";
    parameter WWU.PerDay K_x_T=0.0175
      "Half-saturation (hydrolysis) at T=15 deg C [g Xs/(g Xbh COD)]";
    parameter WWU.Density K_nh=1.0 "Half-saturation (auto. growth) [g NH-N/m3]";
    parameter WWU.Density K_s=20.0 "Half-saturation (hetero. growth) [g COD/m3]";
    parameter WWU.Density K_oh=0.2 "Half-saturation (hetero. oxygen) [g O/m3]";
    parameter WWU.Density K_no=0.5 "Half-saturation (nitrate) [g NO-N/m3]";
    parameter WWU.Density K_oa=0.4 "Half-saturation (auto. oxygen) [g O/m3]";
    parameter Real ny_g=0.8 "Anoxic growth rate correction factor [-]";
    parameter Real ny_h=0.4 "Anoxic hydrolysis rate correction factor [-]";

    Real mu_h "Maximum heterotrophic growth rate f(T) [day^-1]";
    Real b_h "Heterotrophic decay rate f(T) [day^-1]";
    Real mu_a "Maximum autotrophic growth rate f(T) [day^-1]";
    //Real K_nh "Half-saturation (auto. growth) f(T) [g NH-N/m3]";
    Real b_a "Autotrophic decay rate f(T) [day^-1]";
    Real k_a "Ammonification rate f(T) [m3/(g COD day)]";
    Real k_h "Maximum specific hydrolysis rate f(T) [g Xs/(g Xbh COD day)]";
    Real K_x "Half-saturation (hydrolysis) f(T) [g Xs/(g Xbh COD)]";


    Real p1;
    Real p2;
    Real p3;
    Real p4;
    Real p5;
    Real p6;
    Real p7;
    Real p8;

    Real r1;
    Real r2;
    Real r3;
    Real r4;
    Real r5;
    Real r6;
    Real r7;
    Real r8;
    Real r9;
    Real r10;
    Real r11;
    Real r12;
    Real r13;

    /* defining the inputs */
    /* volume dependent dilution term of each concentration */

    Real inputSi = (In.Si - Si)*In.Q/V;
    Real inputSs = (In.Ss - Ss)*In.Q/V;
    Real inputXi = (In.Xi - Xi)*In.Q/V;
    Real inputXs = (In.Xs - Xs)*In.Q/V;
    Real inputXbh = (In.Xbh - Xbh)*In.Q/V;
    Real inputXba = (In.Xba - Xba)*In.Q/V;
    Real inputXp = (In.Xp - Xp)*In.Q/V;
    Real inputSo = (In.So - So)*In.Q/V;
    Real inputSno = (In.Sno - Sno)*In.Q/V;
    Real inputSnh = (In.Snh - Snh)*In.Q/V;
    Real inputSnd = (In.Snd - Snd)*In.Q/V;
    Real inputXnd = (In.Xnd - Xnd)*In.Q/V;
    Real inputSalk = (In.Salk - Salk)*In.Q/V;

  equation

    /* derivatives */

    der(Si) = inputSi + r1;
    der(Ss) = inputSs + r2;
    der(Xi) = inputXi + r3;
    der(Xs) = inputXs + r4;
    der(Xbh) = inputXbh + r5;
    der(Xba) = inputXba + r6;
    der(Xp) = inputXp + r7;
    der(So) = inputSo + r8 + aeration;
    der(Sno) = inputSno + r9;
    der(Snh) = inputSnh + r10;
    der(Snd) = inputSnd + r11;
    der(Xnd) = inputXnd + r12;
    der(Salk) = inputSalk + r13;

    /* Outputs */

    Out.Q + In.Q = 0;
    Out.Si = Si;
    Out.Ss = Ss;
    Out.Xi = Xi;
    Out.Xs = Xs;
    Out.Xbh = Xbh;
    Out.Xba = Xba;
    Out.Xp = Xp;
    Out.So = So;
    Out.Sno = Sno;
    Out.Snh = Snh;
    Out.Snd = Snd;
    Out.Xnd = Xnd;
    Out.Salk = Salk;

    annotation (
      Documentation(info="This partial model provides connectors and equations that are needed in the biological
components (nitrification and denitrification tank) for ASM1 wastewater treatment plant models.
Parameters are coded according the ASM1 [1,2] standard distribution.
Changes to this parameters are subject to the modeller.

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

[1] M. Henze and C.P.L. Grady Jr and W. Gujer and G.v.R. Marais and T. Matsuo:
    Activated Sludge Model No.1. IAWQ, 1987.
[2] M. Henze and W.Gujer and T. Mino and. M.v. Loosdrecht: Activated Sludge
    Models ASM1, ASM2, ASM2d, and ASM3. IWA Task Group on Mathematical Modelling
    for Design and Operation of Biological Wastewater Treatment, 2000.


This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2002, Gerald Reichl
"), Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={191,91,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end ASMbase;

  model ASM1 "ASM1 specfic settings"
    extends ASMbase;

    // Stoichiometric parameters based on the original ASM1 publication//
    parameter Real Y_h=0.67
      "Heterotrophic Yield [g Xbh COD formed/(g COD utilised)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real Y_a=0.24
      "Autotrophic Yield [g Xba COD formed/(g N utilised)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real f_p=0.08 "Fraction of biomass to particulate products [-]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real i_xb=0.086 "Fraction nitrogen in biomass [g N/(g COD)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real i_xp=0.06
      "Fraction nitrogen in particulate products [g N/(g COD)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));

  equation

    /* Temperature dependent Kinetic parameters based on 15 deg C */
    /* may be adapted to 10 or 20 deg C */
    mu_h = mu_h_T*exp(0.069*(T - 15));
    b_h  = b_h_T*exp(0.069*(T - 15));
    mu_a = mu_a_T*exp(0.098*(T - 15));
    //K_nh=1.0*exp(0.069*(T.signal[1]-15));
    b_a  = b_a_T*exp(0.08*(T - 15));
    k_a  = k_a_T*exp(0.069*(T - 15));
    k_h  = k_h_T*exp(0.11*(T - 15));
    K_x  = K_x_T*exp(0.11*(T - 15));

    /* Biochemical Reactions */
    r1 = 0;
    r2 = (-p1 - p2)/Y_h + p7;
    r3 = 0;
    r4 = (1 - f_p)*(p4 + p5) - p7;
    r5 = p1 + p2 - p4;
    r6 = p3 - p5;
    r7 = f_p*(p4 + p5);
    r8 = -((1 - Y_h)/Y_h)*p1 - ((4.57 - Y_a)/Y_a)*p3;
    r9 = -((1 - Y_h)/(2.86*Y_h))*p2 + p3/Y_a;
    r10 = -i_xb*(p1 + p2) - (i_xb + (1/Y_a))*p3 + p6;
    r11 = -p6 + p8;
    r12 = (i_xb - f_p*i_xp)*(p4 + p5) - p8;
    r13 = -i_xb/14*p1 + ((1 - Y_h)/(14*2.86*Y_h) - (i_xb/14))*p2 - ((i_xb/14)
       + 1/(7*Y_a))*p3 + p6/14;

    /* Process Rates */
    p1 = mu_h*(Ss/(K_s + Ss))*(So/(K_oh + So))*Xbh;
    p2 = mu_h*(Ss/(K_s + Ss))*(K_oh/(K_oh + So))*(Sno/(K_no + Sno))*ny_g*Xbh;
    p3 = mu_a*(Snh/(K_nh + Snh))*(So/(K_oa + So))*Xba;
    p4 = b_h*Xbh;
    p5 = b_a*Xba;
    p6 = k_a*Snd*Xbh;
    p7 = k_h*((Xs/Xbh)/(K_x + (Xs/Xbh)))*((So/(K_oh + So))
         + ny_h*(K_oh/(K_oh + So))*(Sno/(K_no + Sno)))*Xbh;
    p8 = p7*Xnd/Xs;

    annotation (defaultComponentName="ASM1",
      Documentation(info="<html>
    <p>This is a partial model providing the AMS1 specifc settings.</p></html>"),
      Icon(graphics={                                                                              Text(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            textString="%name")}));
  end ASM1;

  model ASM2d "ASM1 specfic settings"
    extends ASMbase;

    // Stoichiometric parameters based on the original ASM1 publication//
    parameter Real Y_h=0.67
      "Heterotrophic Yield [g Xbh COD formed/(g COD utilised)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real Y_a=0.24
      "Autotrophic Yield [g Xba COD formed/(g N utilised)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real f_p=0.08 "Fraction of biomass to particulate products [-]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real i_xb=0.086 "Fraction nitrogen in biomass [g N/(g COD)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));
    parameter Real i_xp=0.06
      "Fraction nitrogen in particulate products [g N/(g COD)]"
      annotation(Dialog(tab="Stoichiometric", group="Stoichiometric parameters"));

  equation

    /* Temperature dependent Kinetic parameters based on 15 deg C */
    /* may be adapted to 10 or 20 deg C */
    mu_h = mu_h_T*exp(0.069*(T - 15));
    b_h  = b_h_T*exp(0.069*(T - 15));
    mu_a = mu_a_T*exp(0.098*(T - 15));
    //K_nh=1.0*exp(0.069*(T.signal[1]-15));
    b_a  = b_a_T*exp(0.08*(T - 15));
    k_a  = k_a_T*exp(0.069*(T - 15));
    k_h  = k_h_T*exp(0.11*(T - 15));
    K_x  = K_x_T*exp(0.11*(T - 15));

    /* Biochemical Reactions */
    r1 = 0;
    r2 = (-p1 - p2)/Y_h + p7;
    r3 = 0;
    r4 = (1 - f_p)*(p4 + p5) - p7;
    r5 = p1 + p2 - p4;
    r6 = p3 - p5;
    r7 = f_p*(p4 + p5);
    r8 = -((1 - Y_h)/Y_h)*p1 - ((4.57 - Y_a)/Y_a)*p3;
    r9 = -((1 - Y_h)/(2.86*Y_h))*p2 + p3/Y_a;
    r10 = -i_xb*(p1 + p2) - (i_xb + (1/Y_a))*p3 + p6;
    r11 = -p6 + p8;
    r12 = (i_xb - f_p*i_xp)*(p4 + p5) - p8;
    r13 = -i_xb/14*p1 + ((1 - Y_h)/(14*2.86*Y_h) - (i_xb/14))*p2 - ((i_xb/14)
       + 1/(7*Y_a))*p3 + p6/14;

    /* Process Rates */
    p1 = mu_h*(Ss/(K_s + Ss))*(So/(K_oh + So))*Xbh;
    p2 = mu_h*(Ss/(K_s + Ss))*(K_oh/(K_oh + So))*(Sno/(K_no + Sno))*ny_g*Xbh;
    p3 = mu_a*(Snh/(K_nh + Snh))*(So/(K_oa + So))*Xba;
    p4 = b_h*Xbh;
    p5 = b_a*Xba;
    p6 = k_a*Snd*Xbh;
    p7 = k_h*((Xs/Xbh)/(K_x + (Xs/Xbh)))*((So/(K_oh + So))
         + ny_h*(K_oh/(K_oh + So))*(Sno/(K_no + Sno)))*Xbh;
    p8 = p7*Xnd/Xs;

    annotation (defaultComponentName="ASM1",
      Documentation(info="<html>
    <p>This is a partial model providing the AMS1 specifc settings.</p></html>"),
      Icon(graphics={                                                                              Text(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            textString="%name")}));
  end ASM2d;

  model ASMx
    extends Tank;
    replaceable ASMbase WWbase annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  equation
    connect(WWbase.In, In) annotation (Line(points={{-10,0},{-100,0}}, color={191,95,0}));
    connect(WWbase.Out, Out) annotation (Line(points={{10,0},{100,0}}, color={191,95,0}));
    connect(WWbase.T, T) annotation (Line(points={{-9,4},{-52,4},{-52,40},{-90,40}}, color={0,0,127}));
    connect(AirIn, WWbase.AirIn) annotation (Line(points={{0,-100},{0,-10}}, color={28,108,200}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ASMx;

  partial model Tank_bak

    /* tank specific parameters */
    parameter Modelica.SIunits.Volume V(start=1000) "Volume of denitrification tank"
      annotation(Dialog(group="Volume"));
    parameter Boolean useAir=false "Enable air port"
      annotation(choices(checkBox=true),Dialog(group="Volume"));

    /* aeration system dependent parameters */
    parameter Real alpha=0.7 "Oxygen transfer factor" annotation(Dialog(group="Volume", enable=useAir));
    parameter Modelica.SIunits.Length de=4.5 "Depth of aeration" annotation(Dialog(group="Volume", enable=useAir));
    parameter Real R_air=23.5 "Specific oxygen feed factor [gO2/(m3*m)]" annotation(Dialog(group="Volume", enable=useAir));
    WWU.MassConcentration So_sat "Dissolved oxygen saturation";
    WWU.MassConcentration So(start=WWS.Tank1_So, fixed=true) "Dissolved oxygen";

    WWFlow In annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    WWFlow Out annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    AirFlow AirIn if useAir annotation (Placement(transformation(extent={{-10,-112},{10,-92}})));

    Modelica.Blocks.Interfaces.RealInput T
     annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
    WWU.AerationRate aeration "Ration of air";

    outer Components.WWSystem WWS annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

  protected
     AirFlow Air;
  equation
    So_sat =13.89 + (-0.3825 + (0.007311 - 0.00006588*T)*T)*T
      "Temperature dependent oxygen saturation by Simba";

    /* extends the Oxygen differential equation by an aeration term aeration [mgO2/l];
  AirIn.Q_air needs to be in Simulationtimeunit [m3/day] */
    // aeration = Kla * (So_sat - So);
    aeration =(alpha*(So_sat - So)/So_sat*Air.Q_air*R_air*de)/V;
    if not useAir then
      Air.Q_air = 0;
    end if;

    connect(Air,AirIn);
  end Tank_bak;
end Interfaces;
