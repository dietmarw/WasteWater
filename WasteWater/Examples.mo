within WasteWater;
package Examples "Series of examples of WW plants"
  extends Modelica.Icons.ExamplesPackage;

  model ASM1SmallPlantRun "Small ASM1 Plant example still using the dedicated components"
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
    Components.Deni tank1(
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
    Components.Nitri tank2(
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
    Components.Nitri tank3(
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
                   sensor_O2 annotation (Placement(transformation(extent={{0,30},{20,50}})));
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
      annotation (Line(points={{19.8,40},{72,40},{72,52}}));
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
    connect(sensor_O2.In, tank3.Out) annotation (Line(points={{10,30},{10,10}},        color={191,95,0}));
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
"),   experiment(StopTime=14, Tolerance=1e-07),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          grid={2,2},
          initialScale=0.1,
          extent={{-100,-100},{100,100}})));
  end ASM1SmallPlantRun;
end Examples;
