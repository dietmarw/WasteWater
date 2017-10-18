within WasteWater.ASM1;
package Examples "Demonstration examples of the components of the ASM1 library"

  extends Modelica.Icons.Library;

  model SmallPlant "Small WWTP Configuration"
    extends Modelica.Icons.Example;

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark

    ASM1.EffluentSink Effluent annotation (Placement(transformation(extent={{88,
              -28},{108,-8}})));
    ASM1.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}})));
    ASM1.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}})));
    ASM1.nitri tank3(V=1333) annotation (Placement(transformation(extent={{-6,
              -6},{14,14}})));
    ASM1.nitri tank2(V=1333) annotation (Placement(transformation(extent={{-34,
              -6},{-14,14}})));
    ASM1.deni tank1(V=3000) annotation (Placement(transformation(extent={{-65,
              -6},{-45,14}})));
    ASM1.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/Inf_dry.txt"),
      table=[0,0; 1,1],
      columns=integer(({16,3,4,5,6,7,8,9,10,11,12,13,14,15})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-114,78},{-94,98}})));
    ASM1.WWSource WWSource annotation (Placement(transformation(extent={{-88,78},
              {-68,98}})));
    ASM1.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-33,-62},{-13,-42}})));
    ASM1.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-6,-62},{14,-42}})));
    ASM1.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{0,24},
              {20,44}})));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}})));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500, initType=Modelica.Blocks.Types.Init.InitialState)
      annotation (Placement(transformation(extent={{88,40},{108,60}})));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-67,-87},{-47,-67}})));
    ASM1.pump RecyclePump(Q_max=46115) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump ReturnPump(Q_max=9223) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump WastePump(Q_max=193) annotation (Placement(transformation(extent=
              {{59,-55},{79,-35}})));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}})));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}})));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}})));
    WasteWater.ASM1.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{97,14},{113,30}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{97,-5},{113,11}})));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
      annotation (Placement(transformation(extent={{37,40},{57,60}})));
    WasteWater.ASM1.SecClar.Krebs.SecClarModKrebs Settler annotation (Placement(
          transformation(extent={{48,-4},{68,16}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (Placement(transformation(
            extent={{32,14},{49,30}})));
  equation
    connect(tank3.Out, divider.In) annotation (Line(points={{14,4},{
            17,4},{17,4.3},{20,4.3}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,31.6},
            {-77,31.6},{-77,4},{-65,4}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,
            35.5},{-104,74},{-68,74},{-68,81},{-68.2,81}}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-93,88},{-87,88}}));
    connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{4,-42},{4,-24},{4,-24},{4,-5.8}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower2.u) annotation (Line(points={{109,50},{114,50},{114,-84},{18,-84},{18,-55},{15,-55},{15,-55}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.5},
            {44,2.5},{44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94,-14.6},{-104,-14.6},{-104,27.5}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28.6},{15.5,-28.6},{15.5,-30},{-112,-30},{-112,31.5},{-104,31.5}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{19.8,34},{72,34},{72,42}}));
    connect(Temperature.y, tank1.T)
      annotation (Line(points={{-81.4,56},{-71,56},{-71,8},{-65,8}}, color={0,0,
            255}));
    connect(Temperature.y, tank2.T)
      annotation (Line(points={{-81.4,56},{-39,56},{-39,8},{-34,8}}, color={0,0,
            255}));
    connect(Temperature.y, tank3.T) annotation (Line(points={{-81.4,
            56},{-39,56},{-39,14},{-5.9,14},{-5.9,8},{-6,8}},
                                                   color={0,0,255}));
    connect(OxygenSetpoint.y, Feedback.u1)
      annotation (Line(points={{58,50},{64,50}}, color={0,0,255}));
    connect(Constant1.y, blower1.u) annotation (Line(points={{-46,-77},{-7.2,-77},{-7.2,-55},{-12,-55}},
                                          color={0,0,255}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42.4},{81,-42.4},{81,-42},{83,-42},{83,-42.4},{87,-42.4}}));
    connect(WastePump.u, Constant2.y)
      annotation (Line(points={{60.1,-42.5},{46,-42.5},{46,-58},{43,
            -58}},                                                   color={0,0,
            255}));
    connect(tank2.Out, tank3.In) annotation (Line(points={{-14,4},{-6,
            4}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-45,4},{
            -34,4}}));
    connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-23,-42},{-23,-24},{-23,-5.8},{-24,-5.8}}));
    connect(Constant1.y, RecyclePump.u) annotation (Line(points={{-46,-77},
            {-39,-77},{-39,-14.5},{-75.1,-14.5}},
                                         color={0,0,255}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{68.2,
            11.7},{78,11.7},{78,-16},{88,-16}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-3.6},
            {55,-22.7},{36,-22.7}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,
            -48.3},{52,-48.3},{52,-31},{61,-31},{61,-3.6}}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},
            {72,11.7},{68.2,11.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},
            {89,11.7},{68.2,11.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},
            {105,11.7},{68.2,11.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},
            {105,11.7},{68.2,11.7}}));
    connect(Constant2.y, ReturnPump.u) annotation (Line(points={{43,-58},{48,
            -58},{48,-28.5},{34.9,-28.5}}, color={0,0,255}));
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},
            {44.5,6.6},{44.5,7.4},{48,7.4}}));
    connect(tank3.MeasurePort, sensor_O2.In) annotation (Line(points={{10,8.6},{10,16},{10,16},{10,24}}));
    connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40.5,14},
            {40.5,10.6},{40,10.6},{40,6.6}}));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics={Line(points={{-22,58},{-22,58}}, color={0,0,
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
"));
  end SmallPlant;

  model SmallPlantRun "Small WWTP Configuration"
    extends Modelica.Icons.Example;

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark

    ASM1.EffluentSink Effluent annotation (Placement(transformation(extent={{90,-32},{110,-12}})));
    ASM1.SludgeSink WasteSludge annotation (Placement(transformation(extent={{88,-56},{108,-36}})));
    ASM1.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}})));
    ASM1.deni tank1(V=3000,
      Si(start=ini.Tank1_Si, fixed=true),
      Ss(start=ini.Tank1_Ss, fixed=true),
      So(start=ini.Tank1_So, fixed=true),
      Sno(start=ini.Tank1_Sno, fixed=true),
      Snh(start=ini.Tank1_Snh, fixed=true),
      Snd(start=ini.Tank1_Snd, fixed=true),
      Xi(start=ini.Tank1_Xi, fixed=true),
      Xs(start=ini.Tank1_Xs, fixed=true),
      Xbh(start=ini.Tank1_Xbh, fixed=true),
      Xba(start=ini.Tank1_Xba, fixed=true),
      Xp(start=ini.Tank1_Xp, fixed=true),
      Xnd(start=ini.Tank1_Xnd, fixed=true),
      Salk(start=ini.Tank1_Salk, fixed=true))
        annotation (Placement(transformation(extent={{-71,0},{-51,20}})));
    ASM1.nitri tank2(V=1333,
      Si(start=ini.Tank2_Si, fixed=true),
      Ss(start=ini.Tank2_Ss, fixed=true),
      So(start=ini.Tank2_So, fixed=true),
      Sno(start=ini.Tank2_Sno, fixed=true),
      Snh(start=ini.Tank2_Snh, fixed=true),
      Snd(start=ini.Tank2_Snd, fixed=true),
      Xi(start=ini.Tank2_Xi, fixed=true),
      Xs(start=ini.Tank2_Xs, fixed=true),
      Xbh(start=ini.Tank2_Xbh, fixed=true),
      Xba(start=ini.Tank2_Xba, fixed=true),
      Xp(start=ini.Tank2_Xp, fixed=true),
      Xnd(start=ini.Tank2_Xnd, fixed=true),
      Salk(start=ini.Tank2_Salk, fixed=true))
        annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    ASM1.nitri tank3(V=1333,
      Si(start=ini.Tank3_Si, fixed=true),
      Ss(start=ini.Tank3_Ss, fixed=true),
      So(start=ini.Tank3_So, fixed=true),
      Sno(start=ini.Tank3_Sno, fixed=true),
      Snh(start=ini.Tank3_Snh, fixed=true),
      Snd(start=ini.Tank3_Snd, fixed=true),
      Xi(start=ini.Tank3_Xi, fixed=true),
      Xs(start=ini.Tank3_Xs, fixed=true),
      Xbh(start=ini.Tank3_Xbh, fixed=true),
      Xba(start=ini.Tank3_Xba, fixed=true),
      Xp(start=ini.Tank3_Xp, fixed=true),
      Xnd(start=ini.Tank3_Xnd, fixed=true),
      Salk(start=ini.Tank3_Salk, fixed=true))
        annotation (Placement(transformation(extent={{-10,0},{10,20}})));
     WasteWater.ASM1.SecClar.Krebs.SecClarModKrebs Settler(
      Si1(start=ini.Settler_Si1, fixed=true),
      Ss1(start=ini.Settler_Ss1, fixed=true),
      So1(start=ini.Settler_So1, fixed=true),
      Sno1(start=ini.Settler_Sno1, fixed=true),
      Snh1(start=ini.Settler_Snh1, fixed=true),
      Snd1(start=ini.Settler_Snd1, fixed=true),
      Salk1(start=ini.Settler_Salk1, fixed=true),
      Si2(start=ini.Settler_Si2, fixed=true),
      Ss2(start=ini.Settler_Ss2, fixed=true),
      So2(start=ini.Settler_So2, fixed=true),
      Sno2(start=ini.Settler_Sno2, fixed=true),
      Snh2(start=ini.Settler_Snh2, fixed=true),
      Snd2(start=ini.Settler_Snd2, fixed=true),
      Salk2(start=ini.Settler_Salk2, fixed=true),
      hs(start=ini.Settler_hs, fixed=true))
        annotation (Placement(transformation(extent={{50,0},{70,20}})));


    ASM1.mixer3 mixer annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
    ASM1.WWSource WWSource annotation (Placement(transformation(extent={{-80,70},{-100,90}})));
    ASM1.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-40,-60},{-20,-40}})));
    ASM1.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-10,-60},{10,-40}})));
    ASM1.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{-4,30},{16,50}})));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,50},{82,70}})));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500, initType=Modelica.Blocks.Types.Init.InitialState)
      annotation (Placement(transformation(extent={{88,50},{108,70}})));
    Modelica.Blocks.Sources.Constant Constant1(k=1)
                                               annotation (Placement(
          transformation(extent={{-80,-80},{-60,-60}})));
    ASM1.pump RecyclePump(Q_max=46115) annotation (Placement(transformation(
          origin={-80,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump ReturnPump(Q_max=9223) annotation (Placement(transformation(
          origin={30,-30},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump WastePump(Q_max=193) annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
    Modelica.Blocks.Sources.Constant Constant2(k=1)
                                               annotation (Placement(
          transformation(extent={{20,-70},{40,-50}})));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-96,48},{-84,60}})));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{80,24.5},{96,39.5}})));
    WasteWater.ASM1.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{100,24},{116,40}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{100,8},{116,-8}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{80,8},{96,-8}})));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
      annotation (Placement(transformation(extent={{29,50},{49,70}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (Placement(transformation(
            extent={{32,20},{48,36}})));
    WasteWater.ASM1.Examples.SmallPlantIni ini annotation (Placement(transformation(extent={{-10,80},{10,100}})));
    Modelica.Blocks.Sources.Constant constantInflow[14](k={ini.Q,ini.Si,ini.Ss,ini.Xi,ini.Xs,ini.Xbh,ini.Xba,ini.Xp,ini.So,ini.Sno,ini.Snh,ini.Snd,ini.Xnd,ini.Salk}) annotation (Placement(transformation(extent={{-50,70},{-70,90}})));
  equation
    connect(tank3.Out, divider.In) annotation (Line(points={{10,10},{17,10},{17,4.3},{20,4.3}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-80,29.6},{-77,29.6},{-77,10},{-71,10}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-100,33.5},{-100,34},{-110,34},{-110,73},{-99.8,73}}));
    connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{0,-40},{0,0.2}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,60},{86,60}}));
    connect(PI1.y, blower2.u) annotation (Line(points={{109,60},{118,60},{118,-80},{16,-80},{16,-53},{11,-53}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.5},{44,2.5},{44,-8.7},{-70,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-90,-14.6},{-104,-14.6},{-104,26},{-100,26},{-100,25.5}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{20,-32.6},{20,-32},{-112,-32},{-112,29.5},{-100,29.5}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{15.8,40},{72,40},{72,52}}));
    connect(OxygenSetpoint.y, Feedback.u1)
      annotation (Line(points={{50,60},{64,60}}, color={0,0,255}));
    connect(Constant1.y, blower1.u) annotation (Line(points={{-59,-70},{-13.2,-70},{-13.2,-53},{-19,-53}},
                                          color={0,0,255}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{80,-47.4},{88,-47.4}}));
    connect(WastePump.u, Constant2.y)
      annotation (Line(points={{61.1,-47.5},{48,-47.5},{48,-60},{41,-60}},
                                                                     color={0,0,
            255}));
    connect(tank2.Out, tank3.In) annotation (Line(points={{-20,10},{-10,10}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-51,10},{-40,10}}));
    connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-30,-40},{-30,0.2}}));
    connect(Constant1.y, RecyclePump.u) annotation (Line(points={{-59,-70},{-49,-70},{-49,-14.5},{-71.1,-14.5}},
                                         color={0,0,255}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{70.2,15.7},{76,15.7},{76,-20},{90,-20}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{57,0.4},{57,-26.7},{40,-26.7}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{60,-53.3},{52,-53.3},{52,-31},{63,-31},{63,0.4}}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{88,24.5},{88,15.7},{70.2,15.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{108,24},{108,15.7},{70.2,15.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{108,8},{108,15.7},{70.2,15.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{88,8},{88,15.7},{70.2,15.7}}));
    connect(Constant2.y, ReturnPump.u) annotation (Line(points={{41,-60},{48,-60},{48,-32.5},{38.9,-32.5}},
                                           color={0,0,255}));
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},{44.5,6.6},{44.5,11.4},{50,11.4}}));
    connect(tank3.MeasurePort, sensor_O2.In) annotation (Line(points={{6,14.6},{6,30}}));
    connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40,20},{40,6.6}}));

    connect(constantInflow.y, WWSource.data) annotation (Line(points={{-71,80},{-81,80}}, color={0,0,127}));
    connect(Temperature.y, tank1.T) annotation (Line(points={{-83.4,54},{-74,54},{-74,14},{-71,14}}, color={0,0,127}));
    connect(tank2.T, Temperature.y) annotation (Line(points={{-40,14},{-44,14},{-44,54},{-83.4,54}}, color={0,0,127}));
    connect(tank3.T, Temperature.y) annotation (Line(points={{-10,14},{-16,14},{-16,54},{-83.4,54}}, color={0,0,127}));
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
  end SmallPlantRun;

  model BenchPlant "COST Benchmark WWTP Configuration"

    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    extends Modelica.Icons.Example;

    ASM1.EffluentSink Effluent annotation (Placement(transformation(extent={{88,
              -28},{108,-8}})));
    ASM1.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}})));
    ASM1.SecClarModTakacs Settler annotation (Placement(transformation(extent={
              {48,-5},{68,15}})));
    ASM1.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}})));
    ASM1.nitri tank5(V=1333) annotation (Placement(transformation(extent={{-6,
              -6},{14,14}})));
    ASM1.nitri tank4(V=1333) annotation (Placement(transformation(extent={{-32,
              -6},{-12,14}})));
    ASM1.nitri tank3(V=1333) annotation (Placement(transformation(extent={{-60,
              -6},{-40,14}})));
    ASM1.deni tank2 annotation (Placement(transformation(extent={{-48,22},{-28,
              42}})));
    ASM1.deni tank1 annotation (Placement(transformation(extent={{-76,22},{-56,
              42}})));
    ASM1.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/Inf_dry.txt"),
      table=[0,0; 1,1],
      columns=integer(({2,3,4,5,6,7,8,9,10,11,12,13,14,15})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-114,78},{-94,98}})));
    ASM1.WWSource WWSource annotation (Placement(transformation(extent={{-88,78},
              {-68,98}})));
    ASM1.sensor_NO sensor_NO annotation (Placement(transformation(extent={{-42,
              48},{-22,68}})));
    ASM1.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-60,-62},{-40,-42}})));
    ASM1.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-32,-62},{-12,-42}})));
    ASM1.blower blower3(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-6,-62},{14,-42}})));
    ASM1.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{1,25},
              {18,42}})));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}})));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500)
      annotation (Placement(transformation(extent={{88,40},{108,60}})));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-66,-89},{-46,-69}})));
    ASM1.pump RecyclePump(Q_max=92230) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Continuous.PI PI2(T=0.05, k=15000)
      annotation (Placement(transformation(extent={{58,78},{78,98}})));
    Modelica.Blocks.Sources.Constant NitrogenSetpoint annotation (Placement(
          transformation(extent={{-8,78},{12,98}})));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{22,78},{42,98}})));
    Modelica.Blocks.Nonlinear.Limiter Limiter1(uMax=10, uMin=0.1)
      annotation (Placement(transformation(extent={{8,48},{28,68}})));
    ASM1.pump ReturnPump(Q_max=18446) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump WastePump(Q_max=385) annotation (Placement(transformation(extent=
              {{59,-55},{79,-35}})));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}})));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}})));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/6/24)
      annotation (Placement(transformation(extent={{-18,48},{2,68}})));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}})));
    WasteWater.ASM1.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{97,14},{113,30}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{97,-5},{113,11}})));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height=2)
      annotation (Placement(transformation(extent={{36,40},{56,60}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (Placement(transformation(
            extent={{32,15},{48,30}})));
  equation
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},{44,6.6},{44,6.4},{48,6.4}}));
    connect(tank5.Out, divider.In) annotation (Line(points={{14,4},{17,4},{17,4.3},{20,4.3}}));
    connect(tank4.Out, tank5.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(tank3.Out, tank4.In) annotation (Line(points={{-40,4},{-32,4}}));
    connect(tank3.In, tank2.Out) annotation (Line(points={{-60,4},{-70,4},{-70,
            18},{-18,18},{-18,32},{-28,32}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-56,32},{-48,32}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,31.6},{-80,31.6},{-80,32},{-76,32}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,35.5},{-104,74},{-68,74},{-68,81},{-68.2,81}}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-93,88},{-87,88}}));
    connect(sensor_NO.In, tank2.MeasurePort) annotation (Line(points={{-32,48},
            {-32,36.5},{-32.5,36.5}}));
    connect(blower1.AirOut, tank3.AirIn) annotation (Line(points={{-51,-42},{-51,-24},{-50,-24},{-50,-5.8}}));
    connect(blower2.AirOut, tank4.AirIn) annotation (Line(points={{-23,-42},{-23,-24},{-22,-24},{-22,-5.8}}));
    connect(blower3.AirOut, tank5.AirIn) annotation (Line(points={{3,-42},{3,-24},{4,-24},{4,-5.8}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower3.u) annotation (Line(points={{109,50},{114,50},{114,-84},{18,-84},{18,-55},{13.8,-55},{13.8,-55}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.5},{44,2.5},{44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94,-14.8},{-104,-14.8},{-104,27.5}}));
    connect(Feedback1.y, PI2.u) annotation (Line(points={{41,88},{56,88}}));
    connect(NitrogenSetpoint.y, Feedback1.u1)
      annotation (Line(points={{13,88},{24,88}}));
    connect(PI2.y, RecyclePump.u) annotation (Line(points={{79,88},{118,88},{
            118,-94},{-70,-94},{-70,-14.5},{-75.1,-14.5}}));
    connect(Limiter1.y, Feedback1.u2) annotation (Line(points={{29,58},{32,58},
            {32,80}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-4.6},{
            55,-22.7},{36,-22.7}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28.8},{15.5,-28.8},{15.5,-30},{-112,-30},{-112,31.5},{-104,31.5}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{17.83,33.5},{72,33.5},{72,42}}));
    connect(Temperature.y, tank1.T)
      annotation (Line(points={{-81.4,56},{-78,56},{-78,36},{-76,36}},   color=
            {0,0,255}));
    connect(Temperature.y, tank2.T)
      annotation (Line(points={{-81.4,56},{-52,56},{-52,36},{-48,36}}, color={0,
            0,255}));
    connect(Temperature.y, tank3.T) annotation (Line(points={{-81.4,56},{-52,56},{-52,14},{-60,14},{-60,8},{-59.5,8},{-59.5,8},{-60,8}},
                                                                        color={
            0,0,255}));
    connect(Temperature.y, tank4.T) annotation (Line(points={{-81.4,56},{-52,56},{-52,14},{-32,14},{-32,8}},
                                        color={0,0,255}));
    connect(Temperature.y, tank5.T) annotation (Line(points={{-81.4,56},{-52,56},{-52,14},{-5.9,14},{-5.9,8},{-6,8}},
                                                   color={0,0,255}));
    connect(sensor_NO.Sno, FixedDelay1.u)
      annotation (Line(points={{-22.2,58},{-20,58}},
                                                   color={0,0,255}));
    connect(FixedDelay1.y, Limiter1.u)
      annotation (Line(points={{3,58},{6,58}}, color={0,0,255}));
    connect(OxygenSetpoint.y, Feedback.u1)
      annotation (Line(points={{57,50},{64,50}}, color={0,0,255}));
    connect(Constant1.y, blower1.u) annotation (Line(points={{-45,-79},{-36,-79},
            {-36,-55},{-40.2,-55}}, color={0,0,255}));
    connect(blower2.u, Constant1.y)
      annotation (Line(points={{-12.2,-55},{-9,-55},{-9,-79},{-45,-79}}, color=
            {0,0,255}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42.2},{81,-42.2},{81,-42},{83,-42},{83,-42},{87,-42}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,-48.3},{52,-48.3},{52,-31},{61,-31},{61,-4.6}}));
    connect(WastePump.u, Constant2.y)
      annotation (Line(points={{60.1,-42.5},{46,-42.5},{46,-58},{43,-58}},
                                                                     color={0,0,
            255}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},{72,10.7},{68.2,10.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},{89,10.7},{68.2,10.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},{105,10.7},{68.2,10.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},{105,10.7},{68.2,10.7}}));
    connect(Effluent.In, Settler.Effluent) annotation (Line(points={{88,-16},{78.5,-16},{78.5,10.7},{68.2,10.7}}));
    connect(Constant2.y, ReturnPump.u)
      annotation (Line(points={{43,-58},{46,-58},{46,-28.5},{34.9,-28.5}},
                                                                       color={0,
            0,255}));
    connect(tank5.MeasurePort, sensor_O2.In) annotation (Line(points={{9.5,8.5},{9.5,25},{9.5,25}}));
    connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40,15},{40,6.6}}));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics),
      Documentation(info="This ASM1 plant consists of 2 denitrification tanks (tank1 and tank2),
3 nitrification tanks (tank3 - tank5) and a secondary clarifier by Takacs.
Furthermore there are 2 control loops modelled.
This configuration corresponds to the COST simulation benchmark [1].

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file bench_asm1.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the
sensors at the effluent of the secondary clarifier.

References:

[1] J.B. Copp: The COST Simulation Benchmark. 2000. http://www.ensic.u-nancy.fr/COSTWWTP/


PS: For those who want to reproduce the exact figures from the COST simulation benchmark some remarks:
    The aeration system in this library is different from that in COST, so be sure to produce an airflow
    corresponding to the desired Kla in COST. Furthermore in this library biological parameters are standard
    parameters from the ASM1 distribution and implemented with temperature dependency which may vary a bit from
    the parameter set used in COST.
    But it is possible. During the validation phase of this library the steady state and dynamic results
    from the COST simulation benchmark could exactly be reproduced.
"));
  end BenchPlant;

  model ComplexPlant "Complex ASM1 WWTP"

    extends Modelica.Icons.Example;
    ControlledDivider2 cdivider1 annotation (Placement(transformation(extent={{
              -168,65},{-148,85}})));
    Modelica.Blocks.Sources.Constant Constant2(k=0.8)
      annotation (Placement(transformation(extent={{-178,52},{-168,62}})));
    blower blower1(Q_max=162816)
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adusted according active aerated tanks"
       annotation (Placement(transformation(extent={{145,-16},{165,4}})));
    nitri nitri2(
      V=2772,
      alpha=0.305,
      de=5.24,
      R_air=20) annotation (Placement(transformation(extent={{110,18},{130,38}})));
    deni anaerob(V=1287) annotation (Placement(transformation(extent={{-138,13},
              {-118,33}})));
    deni deni1(V=2772) annotation (Placement(transformation(extent={{-80,14},{
              -60,34}})));
    deni deni3(V=2772) annotation (Placement(transformation(extent={{80,18},{
              100,38}})));
    deni deni2(V=2772) annotation (Placement(transformation(extent={{-20,14},{0,
              34}})));
    nitri nitri3(
      V=5602,
      alpha=0.305,
      de=5.24,
      R_air=21) annotation (Placement(transformation(extent={{144,18},{164,38}})));
    blower blower2(Q_max=81408)
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adjusted according active aerated tanks"
       annotation (Placement(transformation(extent={{111,-13},{131,7}})));
    pump ReturnPump(Q_max=60480) annotation (Placement(transformation(
          origin={-44,-94},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    pump RecyclePump(Q_max=60480) annotation (Placement(transformation(
          origin={10,-37},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    pump WastePump(Q_max=1920) annotation (Placement(transformation(extent={{
              128,-104},{148,-84}})));
    ControlledDivider2 cdivider2 annotation (Placement(transformation(extent={{
              -42,68},{-22,88}})));
    EffluentSink Effluent annotation (Placement(transformation(extent={{170,-72},
              {190,-52}})));
    SludgeSink WasteSludge annotation (Placement(transformation(extent={{170,
              -100},{190,-80}})));
    mixer2 mixer2_1 annotation (Placement(transformation(extent={{-45,16},{-25,
              36}})));
    mixer2 mixer2_2 annotation (Placement(transformation(extent={{50,17},{70,37}})));
    mixer3 mixer3_1 annotation (Placement(transformation(extent={{-107,14},{-87,
              34}})));
    mixer2 mixer2_5 annotation (Placement(transformation(extent={{-140,-15},{
              -120,5}})));
    divider2 divider2_1 annotation (Placement(transformation(
          origin={66,-32},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ControlledDivider2 cdivider3 annotation (Placement(transformation(
          origin={-122,-87},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant Constant4(k=0.5)
      annotation (Placement(transformation(extent={{-148,-80},{-138,-70}})));
    nitri nitri1(
      V=5602,
      alpha=0.305,
      de=5.24,
      R_air=21) annotation (Placement(transformation(extent={{12,14},{32,34}})));
    blower blower3(Q_max=162816)
      "there exist 4 blowers of max 4240 Nm3/h, Q_max adusted according active aerated tanks"
       annotation (Placement(transformation(extent={{13,-23},{33,-3}})));
    Modelica.Blocks.Sources.Constant Constant7(k=0.56)
      annotation (Placement(transformation(extent={{-66,98},{-56,108}})));
    mixer2 mixer2_3 annotation (Placement(transformation(extent={{-168,18},{
              -148,38}})));
    PreClar.preclar3 Preclaryfier(V=1372, n_corr=2.138) annotation (Placement(
          transformation(extent={{-136,68},{-116,88}})));
    FlowSource FlowInput annotation (Placement(transformation(extent={{-176,94},
              {-156,114}})));
    ControlledDivider2 ControlledDivider2_1 annotation (Placement(
          transformation(
          origin={-41,-39},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant Constant6 annotation (Placement(
          transformation(extent={{-46,-10},{-36,0}})));
    sensor_NO sensor_NO1 annotation (Placement(transformation(extent={{-14,40},
              {6,60}})));
    sensor_NO sensor_NO3 annotation (Placement(transformation(extent={{90,-56},
              {110,-36}})));
    sensor_NH sensor_NH2 annotation (Placement(transformation(extent={{112,-56},
              {132,-36}})));
    sensor_TSS sensor_TSS1 annotation (Placement(transformation(extent={{-6,-86},
              {14,-66}})));
    Modelica.Blocks.Sources.Constant Temperature(k=11.5)
      annotation (Placement(transformation(extent={{58,44},{78,64}})));
    WasteWater.Misc.RecycleController2 RecycleController1(NO3min=1.5)
      annotation (Placement(transformation(extent={{15,-63},{29,-49}})));
    WasteWater.Misc.ReturnController ReturnController1 annotation (Placement(
          transformation(extent={{-28,-115},{-14,-101}})));
    sensor_Q sensor_Q1 annotation (Placement(transformation(extent={{-194,66},{
              -174,86}})));
    WasteWater.Misc.TwoPoint TwoPoint1(
      on=4.5,
      off=4.0,
      out_on=2.5,
      out_off=1.5) annotation (Placement(transformation(extent={{-8,100},{2,110}})));
    WasteWater.Misc.TwoPoint TwoPoint2(
      on=4.5,
      off=4.0,
      out_on=2.5,
      out_off=1.5) annotation (Placement(transformation(extent={{110,100},{120,
              110}})));
    WasteWater.ASM1.sensor_NH sensor_NH1 annotation (Placement(transformation(
            extent={{142,38},{162,58}})));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{12,100},{22,110}})));
    Modelica.Blocks.Math.Feedback Feedback2 annotation (Placement(
          transformation(extent={{127,99},{137,109}})));
    WasteWater.ASM1.sensor_O2 sensor_O2_1 annotation (Placement(transformation(
            extent={{164,38},{184,58}})));
    WasteWater.ASM1.sensor_O2 sensor_O2_2 annotation (Placement(transformation(
            extent={{14,38},{34,58}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{134,-56},{154,-36}})));
    WasteWater.ASM1.sensor_COD sensor_COD2 annotation (Placement(transformation(
            extent={{-118,94},{-98,114}})));
    WasteWater.ASM1.Examples.JenaSecClarModTakacs Settler(hsc=3.46, Asc=3704)
      "The depth is calculated based on V and A of the settler and not the true depth."
       annotation (Placement(transformation(extent={{68,-84},{88,-64}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{68,-56},{88,-36}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime1(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/drysim130303.txt"),
      table=[0,0; 1,1],
      columns=integer(({2})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-198,96},{-184,112}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime2(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/drysim130303.txt"),
      table=[0,0; 1,1],
      columns=integer(({3,7,4,6})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-134,96},{-118,112}})));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/24/6)
      annotation (Placement(transformation(extent={{-16,-63},{-2,-49}})));
    Modelica.Blocks.Math.Feedback Feedback3 annotation (Placement(
          transformation(
          origin={84,-13},
          extent={{5,-5},{-5,5}},
          rotation=180)));
    WasteWater.ASM1.sensor_O2 sensor_O2_3 annotation (Placement(transformation(
            extent={{116,40},{134,58}})));
    Modelica.Blocks.Math.Gain Gain1(k=500) annotation (Placement(transformation(
            extent={{29,95},{49,115}})));
    Modelica.Blocks.Math.Gain Gain2(k=500) annotation (Placement(transformation(
            extent={{144,93},{164,113}})));
    Modelica.Blocks.Math.Gain Gain3(k=500) annotation (Placement(transformation(
            extent={{94,-28},{108,-14}})));
    WasteWater.Misc.TwoPoint TwoPoint3(
      on=4.5,
      off=4.0,
      out_on=2.0,
      out_off=1.0) annotation (Placement(transformation(extent={{63,-19},{75,-7}})));
    Modelica.Blocks.Sources.Step Step1(
      height=0.125,
      offset=-0.5,
      startTime=2.375) annotation (Placement(transformation(extent={{100,-90},{
              110,-80}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS2 annotation (Placement(transformation(
            extent={{166,5},{184,24}})));
  equation
    connect(deni3.Out, nitri2.In) annotation (Line(points={{100,28},{110,28}}));
    connect(nitri2.Out, nitri3.In) annotation (Line(points={{130,28},{144,28}}));
    connect(nitri3.Out, divider2_1.In) annotation (Line(points={{164,28},{190,
            28},{190,-32.3},{76,-32.3}}));
    connect(anaerob.Out, mixer3_1.In2) annotation (Line(points={{-118,23},{-110.5,23},{-110.5,23.5},{-107,23.5}}));
    connect(mixer2_5.Out, mixer3_1.In3) annotation (Line(points={{-120,-4.5},{-111,-4.5},{-111,19.5},{-107,19.5}}));
    connect(Constant4.y, cdivider3.u)
      annotation (Line(points={{-137.5,-75},{-122,-75},{-122,-81}}, color={0,0,
            255}));
    connect(nitri1.Out, mixer2_2.In2) annotation (Line(points={{32,24},{39,24},{39,25.5},{50,25.5}}));
    connect(deni2.Out, nitri1.In) annotation (Line(points={{5.55112e-16,24},{12,
            24}}));
    connect(cdivider2.Out1, mixer2_2.In1) annotation (Line(points={{-22,80.5},{
            40,80.5},{40,29.5},{50,29.5}}));
    connect(cdivider3.Out2, mixer2_5.In1) annotation (Line(points={{-132,-85.5},
            {-172,-85.5},{-172,-2.5},{-140,-2.5}}));
    connect(deni1.Out, mixer2_1.In1) annotation (Line(points={{-60,24},{-56,24},
            {-56,29},{-50.75,29},{-50.75,28.5},{-45,28.5}}));
    connect(Constant7.y, cdivider2.u) annotation (Line(points={{-55.5,103},{
            -50.5,103},{-50.5,54},{-32,54},{-32,72}}, color={0,0,255}));
    connect(cdivider3.In, ReturnPump.Out) annotation (Line(points={{-111.9,-87.3},{-86.1,-87.3},{-86.1,-96.8},{-54,-96.8}}));
    connect(cdivider3.Out1, mixer2_3.In2) annotation (Line(points={{-132,-89.5},
            {-184,-89.5},{-184,26.5},{-168,26.5}}));
    connect(cdivider1.Out2, mixer2_3.In1) annotation (Line(points={{-148,73.5},{-143,73.5},{-143,40},{-184,40},{-184,30.5},{-168,30.5}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{148,-91.2},{170,-91.2}}));
    connect(ControlledDivider2_1.Out2, mixer2_1.In2) annotation (Line(points={{-51,-37.5},{-52,-37.5},{-52,24.5},{-45,24.5}}));
    connect(ControlledDivider2_1.Out1, mixer2_5.In2) annotation (Line(points={{-51,-41.5},{-150,-41.5},{-150,-6.5},{-140,-6.5}}));
    connect(Constant6.y, ControlledDivider2_1.u) annotation (Line(points={{-35.5,-5},{-31,-5},{-31,-18},{-41,-18},{-41,-33}},
                                                         color={0,0,255}));
    connect(Preclaryfier.In, cdivider1.Out1) annotation (Line(points={{-136,78},{-146.5,78},{-146.5,77.5},{-148,77.5}}));
    connect(mixer2_2.Out, deni3.In) annotation (Line(points={{70,27.5},{70,28},{80,28}}));
    connect(sensor_NO1.In, deni2.MeasurePort) annotation (Line(points={{-4,40},
            {-4,28.5},{-4.5,28.5}}));
    connect(Temperature.y, anaerob.T) annotation (Line(points={{79,54},{94,54},{94,34},{-138,34},{-138,27}},
                                          color={0,0,255}));
    connect(Temperature.y, deni1.T) annotation (Line(points={{79,54},{94,54},{94,34},{-80,34},{-80,28}},
                                       color={0,0,255}));
    connect(Temperature.y, deni2.T) annotation (Line(points={{79,54},{94,54},{94,34},{-20,34},{-20,28}},
                                       color={0,0,255}));
    connect(Temperature.y, nitri1.T) annotation (Line(points={{79,54},{94,54},{94,34},{12,34},{12,28},{12,28}},
                                               color={0,0,255}));
    connect(Temperature.y, deni3.T)
      annotation (Line(points={{79,54},{94,54},{94,34},{80,34},{80,32}}, color=
            {0,0,255}));
    connect(Temperature.y, nitri2.T) annotation (Line(points={{79,54},{94,54},{94,34},{110.5,34},{110.5,32},{110,32}},
                                                    color={0,0,255}));
    connect(Temperature.y, nitri3.T) annotation (Line(points={{79,54},{94,54},{94,34},{144,34},{144,32}},
                                       color={0,0,255}));
    connect(RecycleController1.out, RecyclePump.u) annotation (Line(points={{29.7,-56},{34,-56},{34,-39.5},{18.9,-39.5}},
                                                         color={0,0,255}));
    connect(FlowInput.Out, sensor_Q1.In) annotation (Line(points={{-156.2,97},{-148,97},{-148,90},{-194,90},{-194,76}}));
    connect(sensor_Q1.Q, ReturnController1.in1) annotation (Line(points={{-184,66.2},{-184,65.5},{-194,65.5},{-194,-108},{-28.7,-108}},
                                                                   color={0,0,
            255}));
    connect(sensor_NH1.In, nitri3.MeasurePort) annotation (Line(points={{152,38},{152,34},{159.5,34},{159.5,32.5}}));
    connect(sensor_O2_2.In, nitri1.MeasurePort) annotation (Line(points={{24,38},{24,28.5},{27.5,28.5}}));
    connect(Feedback1.u2, sensor_O2_2.So)
      annotation (Line(points={{17,101},{17,83.5},{33.8,83.5},{33.8,48}},
                                                                      color={0,
            0,255}));
    connect(sensor_O2_1.In, nitri3.MeasurePort) annotation (Line(points={{174,38},{174,34},{160.25,34},{160.25,32.5},{159.5,32.5}}));
    connect(Feedback2.u2, sensor_O2_1.So)
      annotation (Line(points={{132,100},{132,81},{183.8,81},{183.8,48}},
                                                                      color={0,
            0,255}));
    connect(sensor_NH1.Snh, TwoPoint1.e) annotation (Line(points={{161.8,48},{161.8,72},{-14,72},{-14,105},{-8.5,105}},
                                              color={0,0,255}));
    connect(TwoPoint2.e, sensor_NH1.Snh) annotation (Line(points={{109.5,105},{100,105},{100,72},{161.8,72},{161.8,48}},
                                                  color={0,0,255}));
    connect(sensor_COD2.In, Preclaryfier.In) annotation (Line(points={{-108,94},
            {-108,90},{-136,90},{-136,78}}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{88.2,-68.3},
            {108.65,-68.3},{108.65,-68},{128,-68},{128,-60},{170,-60}}));
    connect(sensor_NO3.In, Settler.Effluent) annotation (Line(points={{100,-56},
            {100,-68.3},{88.2,-68.3}}));
    connect(sensor_NH2.In, Settler.Effluent) annotation (Line(points={{122,-56},
            {122,-68.3},{88.2,-68.3}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{144,-56},
            {144,-60},{128,-60},{128,-68.3},{88.2,-68.3}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{128,-97.3},{81,-97.3},{81,-83.6}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{75,-83.6},{75,-90.7},{-34,-90.7}}));
    connect(sensor_TSS1.In, Settler.Return) annotation (Line(points={{4,-86},{4,-91},{75,-91},{75,-83.6}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{78,-56},{88.2,-56},{88.2,-68.3}}));
    connect(CombiTableTime1.y[1], FlowInput.data)
      annotation (Line(points={{-183.3,104},{-175,104}}, color={0,0,255}));
    connect(Preclaryfier.MeasurePort, CombiTableTime2.y) annotation (Line(
          points={{-122.2,87},{-122.2,94},{-116,94},{-116,104},{-117.2,104}},
                                                                          color=
           {0,0,255}));
    connect(FixedDelay1.u, sensor_NO1.Sno) annotation (Line(points={{-17.4,-56},{-22,-56},{-22,-8},{10,-8},{10,50},{5.8,50}},
                                                       color={0,0,255}));
    connect(sensor_O2_3.In, nitri2.MeasurePort) annotation (Line(points={{125,40},{125,32.5},{125.5,32.5}}));
    connect(sensor_Q1.Out, cdivider1.In) annotation (Line(points={{-174,76},{-171,76},{-171,75.3},{-168.1,75.3}}));
    connect(cdivider2.Out2, mixer3_1.In1) annotation (Line(points={{-22,76.5},{-18,76.5},{-18,47},{-111,47},{-111,27.5},{-107,27.5}}));
    connect(mixer3_1.Out, deni1.In) annotation (Line(points={{-87,23.6},{-83,23.6},{-83,24},{-81,24}}));
    connect(mixer2_1.Out, deni2.In) annotation (Line(points={{-25,26.5},{-22.5,26.5},{-22.5,24},{-20,24}}));
    connect(FixedDelay1.y, RecycleController1.in1)
      annotation (Line(points={{-1.3,-56},{14.3,-56}},
                                                     color={0,0,255}));
    connect(Feedback2.u1, TwoPoint2.u)
      annotation (Line(points={{128,104},{124.5,104},{124.5,105},{120,105}},
                                                     color={0,0,255}));
    connect(TwoPoint1.u, Feedback1.u1)
      annotation (Line(points={{2.5,105},{13,105}}, color={0,0,255}));
    connect(mixer2_3.Out, anaerob.In) annotation (Line(points={{-148,28.5},{-143,28.5},{-143,23},{-138,23}}));
    connect(Gain1.u, Feedback1.y)
      annotation (Line(points={{27,105},{24,105},{24,105},{21.5,105}},
                                                                     color={0,0,
            255}));
    connect(Gain2.u, Feedback2.y)
      annotation (Line(points={{142,103},{139,103},{139,104},{136.5,104}},
                                                                         color=
            {0,0,255}));
    connect(Feedback3.y, Gain3.u) annotation (Line(points={{88.5,-13},{90.55,
            -13},{90.55,-21},{92.6,-21}}, color={0,0,255}));
    connect(sensor_O2_3.So, Feedback3.u2) annotation (Line(points={{133.82,49},{139,49},{139,16},{84,16},{84,-9}},
                                               color={0,0,255}));
    connect(TwoPoint3.u, Feedback3.u1)
      annotation (Line(points={{75.6,-13},{80,-13}},
                                                   color={0,0,255}));
    connect(TwoPoint3.e, sensor_NH1.Snh) annotation (Line(points={{62.4,-13},{56,-13},{56,6},{104,6},{104,72},{161.8,72},{161.8,48}},
                                                             color={0,0,255}));
    connect(Step1.y, WastePump.u) annotation (Line(points={{110.5,-85},{119,-85},{119,-91.5},{129.1,-91.5}},
                                    color={0,0,255}));
    connect(blower1.AirOut, nitri3.AirIn) annotation (Line(points={{154,4},{154,5.5},{154,18.2},{154,18.2}}));
    connect(Constant2.y, cdivider1.u)
      annotation (Line(points={{-167.5,57},{-158,57},{-158,69}}, color={0,0,255}));
    connect(Gain1.y, blower3.u) annotation (Line(points={{50,105},{55,105},{55,83},{49,83},{49,-16},{32.8,-16}},
                                            color={0,0,255}));
    connect(Gain3.y, blower2.u) annotation (Line(points={{108.7,-21},{139,-21},
            {139,-6},{130.8,-6}}, color={0,0,255}));
    connect(blower1.u, Gain2.y)
      annotation (Line(points={{164.8,-9},{195,-9},{195,103},{165,103}}, color=
            {0,0,255}));
    connect(Settler.Feed, divider2_1.Out1) annotation (Line(points={{68,-72.6},{48,-72.6},{48,-34.6},{56,-34.6}}));
    connect(ReturnPump.u, ReturnController1.out) annotation (Line(points={{-35.1,-96.5},{-5,-96.5},{-5,-108},{-13.3,-108}},
                                                       color={0,0,255}));
    connect(RecyclePump.Out, ControlledDivider2_1.In) annotation (Line(points={{-8.88178e-16,-39.8},{-8,-39.8},{-8,-40},{-15.9,-40},{-15.9,-40},{-30,-40}}));
    connect(RecyclePump.In, divider2_1.Out2) annotation (Line(points={{20,-33.7},{38,-33.7},{38,-30.5},{56,-30.5}}));
    connect(blower3.AirOut, nitri1.AirIn) annotation (Line(points={{22,-3},{22,14.2}}));
    connect(cdivider2.In, Preclaryfier.Out) annotation (Line(points={{-42.1,78.3},{-80,78.3},{-80,78},{-115,78}}));
    connect(blower2.AirOut, nitri2.AirIn) annotation (Line(points={{120,7},{120,18.2}}));
    connect(sensor_TSS2.In, nitri3.Out) annotation (Line(points={{175,5},{175,28},{164,28}}));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-120},{200,120}},
          grid={1,1}), graphics),
      Documentation(info="This ASM1 example plant configuration is from a real municipal wastewater treatment plant
with a size of 145.000 p.e. It is a cascade-type continuous flow plant for a mean dry
weather inflow of 28.500 m3/d. It consists of a preclarifier, an anaerobic tank,
3 denitrification and 3 nitrification tanks and a secondary settler.
This model is an example for the Wastewater library and is not adapted with its parameters
to the reality, therefore simulation results do not reflect the real plant behaviour.

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file complex_asm1.mos
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
"));
  end ComplexPlant;

  model JenaSecClarModTakacs
    "Secondary Clarifier Model based on Takacs prepared for a special plant"

    extends WasteWater.Icons.SecClar;
    extends ASM1.SecClar.Takacs.Interfaces.ratios;
    package SCP = ASM1.SecClar.Takacs;
    import SI = Modelica.SIunits;
    package WI = ASM1.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;
    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter Integer n=10 "number of layers of SC model";
    parameter SI.Length zm=hsc/(1.0*n)
      "height of m-th secondary clarifier layer";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
    // total sludge concentration in clarifier feed
    WWU.MassConcentration Xf;
    // layers 1 to 10
    WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}})));
    WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}})));
    WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}})));
    WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}})));
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
    SCP.feed_layer S4(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-36,-36},{34,-22}})));
    SCP.upper_layer S5(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,-16},{34,-4}})));
    SCP.upper_layer S6(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,2},{34,16}})));
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

    connect(S1.Up, S2.Dn) annotation (Line(points={{-2.22045e-15,-78},{
            -2.22045e-15,-74}}));
    connect(S2.Up, S3.Dn) annotation (Line(points={{-2.22045e-15,-59},{
            -2.22045e-15,-55}}));
    connect(S7.Up, S8.Dn) annotation (Line(points={{-2.22045e-15,36},{
            -2.22045e-15,40}}));
    connect(S9.Up, S10.Dn) annotation (Line(points={{-2.22045e-15,74},{
            -2.22045e-15,78}}));
    connect(S8.Up, S9.Dn) annotation (Line(points={{-2.22045e-15,55},{
            -2.22045e-15,59}}));
    connect(S1.PQw, Waste) annotation (Line(points={{17.5,-93},{30,-93},{30,
            -100}}));
    connect(S10.Out, Effluent) annotation (Line(points={{35,85.5},{67.5,85.5},{
            67.5,57},{100,57}}));
    connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-30,-93},{-30,
            -100}}));
    connect(S4.Dn, S3.Up) annotation (Line(points={{0,-36},{0,-40}}));
    connect(S4.Up, S5.Dn) annotation (Line(points={{-2,-22},{-2,-16}}));
    connect(S5.Up, S6.Dn) annotation (Line(points={{0,-4},{0,2}}));
    connect(S6.Up, S7.Dn) annotation (Line(points={{0,16},{0,21}}));
    connect(Feed, S4.In) annotation (Line(points={{-100,10},{-67.5,10},{-67.5,
            -28.72},{-35,-28.72}}));

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
      Documentation(info="This component models an ASM1 10 - layer secondary clarifier with 6 layers above the feed_layer (including top_layer)
and 3 layers below the feed_layer (including bottom_layer).

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]
"));
  end JenaSecClarModTakacs;

  record SmallPlantIni
    "Initialisation record for ASM1 SmallPlant model"
    extends Modelica.Icons.Record;
    import WWU = WasteWater.WasteWaterUnits;
    /* PI Controller */
    parameter Real PI1_x=-3.511076570565e-004 "Start output of controller"
      annotation (Dialog(group="PI Controller"));
      /* Inflow [15]*/
      //    parameter Boolean useCI=true "Use constant inflow?"; //not used yet
      parameter WWU.VolumeFlowRate Q=21477 "Inflow";
      parameter WWU.VolumeFlowRate Q_2=Q/2 "Half of inflow" annotation(Dialog(enable=false));
      parameter WWU.MassConcentration Si=3 "Soluble inert organic matter";
      parameter WWU.MassConcentration Ss=64 "Readily biodegradable substrate";
      parameter WWU.MassConcentration Xi=59 "Particulate inert organic matter";
      parameter WWU.MassConcentration Xs=224 "Slowly biodegradable substrate";
      parameter WWU.MassConcentration Xbh=32 "Active heterotrophic biomass";
      parameter WWU.MassConcentration Xba=0 "Active autotrophic biomass";
      parameter WWU.MassConcentration Xp=0 "Particulate products from biomass decay";
      parameter WWU.MassConcentration So=0 "Dissolved oxygen";
      parameter WWU.MassConcentration Sno=0 "Nitrate and nitrite nitrogen";
      parameter WWU.MassConcentration Snh=30 "Ammonium nitrogen";
      parameter WWU.MassConcentration Snd=6.4 "Soluble biodegradable organic nitrogen";
      parameter WWU.MassConcentration Xnd=12 "Particulate biodegradable organic nitrogen";
      parameter WWU.Alkalinity Salk=7 "Alkalinity";

    /* Tank 1 - denitrification */
    parameter WWU.MassConcentration Tank1_Si=3.000000000000e+001
      "Soluble inert organic matter"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Ss=2.395032857582e+000
      "Readily biodegradable substrate"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xi=1.275518549259e+003
      "Particulate inert organic matter"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xs=3.770076754487e+001
      "Slowly biodegradable substrate"
      annotation (Dialog(tab="Tank 1",group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xbh=1.956193873766e+003
      "Active heterotrophic biomass"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xba=8.829237725627e+001
      "Active autotrophic biomass"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xp=7.087641710603e+002
      "Particulate products from biomass decay"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_So=7.377559296960e-003
      "Dissolved oxygen"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Sno=2.060772419090e+000
      "Nitrate and nitrite nitrogen"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Snh=8.182199118905e+000
      "Ammonium nitrogen"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Snd=5.508870585039e-001
      "Soluble biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.MassConcentration Tank1_Xnd=2.635166937210e+000
      "Particulate biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    parameter WWU.Alkalinity Tank1_Salk=5.179082991135e+000
      "Alkalinity"
      annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
    /* Tank 2 */
    parameter WWU.MassConcentration Tank2_Si=3.000000000000e+001
      "Soluble inert organic matter"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Ss=2.463117211568e+000
      "Readily biodegradable substrate"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xi=1.278333736389e+003
      "Particulate inert organic matter"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xs=2.140590310375e+001
      "Slowly biodegradable substrate"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xbh=1.966614626250e+003
      "Active heterotrophic biomass"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xba=8.900572493248e+001
      "Active autotrophic biomass"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xp=7.113292476107e+002
      "Particulate products from biomass decay"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_So=3.632593914266e+000
      "Dissolved oxygen"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Sno=4.856770069816e+000
      "Nitrate and nitrite nitrogen"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Snh=5.478663911860e+000
      "Ammonium nitrogen"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Snd=7.252693834073e-001
      "Soluble biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.MassConcentration Tank2_Xnd=1.586608768203e+000
      "Particulate biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
    parameter WWU.Alkalinity Tank2_Salk=4.782438895247e+000
      "Alkalinity"
      annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));

    /* Tank 3 */
    parameter WWU.MassConcentration Tank3_Si=3.000000000000e+001
      "Soluble inert organic matter"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Ss=1.768379818970e+000
      "Readily biodegradable substrate"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xi=1.280658681727e+003
      "Particulate inert organic matter"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xs=1.342037061251e+001
      "Slowly biodegradable substrate"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xbh=1.971253187539e+003
      "Active heterotrophic biomass"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xba=8.953776792719e+001
      "Active autotrophic biomass"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xp=7.135293892258e+002
      "Particulate products from biomass decay"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_So=1.499999536940e+000
      "Dissolved oxygen"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Sno=7.023954787236e+000
      "Nitrate and nitrite nitrogen"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Snh=3.469832897751e+000
      "Ammonium nitrogen"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Snd=6.330054822579e-001
      "Soluble biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.MassConcentration Tank3_Xnd=1.058875620146e+000
      "Particulate biodegradable organic nitrogen"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
    parameter WWU.Alkalinity Tank3_Salk=4.485176510073e+000
      "Alkalinity"
      annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));

    /* Settler */
    parameter SI.Length Settler_hs=5.029601648736e-001
      "Height of sludge layer" annotation (Dialog(tab="Settler"));
    parameter WWU.MassConcentration Settler_Si1=3.000000000000e+001
      "Soluble inert organic matter" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_Ss1=1.681287279702e+000
      "Readily biodegradable substrate" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_So1=1.499999390854e+000
      "Dissolved oxygen" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_Sno1=7.168869418367e+000
      "Nitrate and nitrite nitrogen" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_Snh1=2.943675968574e+000
      "Ammonium nitrogen" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_Snd1=6.126843777685e-001
      "Soluble biodegradable organic nitrogen" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.Alkalinity Settler_Salk1=4.461450405862e+000
      "Alkalinity" annotation (Dialog(
        tab="Settler",
        group="First stirrer tank"));
    parameter WWU.MassConcentration Settler_Si2=3.000000000000e+001
      "Soluble inert organic matter" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.MassConcentration Settler_Ss2=1.635315887679e+000
      "Readily biodegradable substrate" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.MassConcentration Settler_So2=1.499999562861e+000
      "Dissolved oxygen" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.MassConcentration Settler_Sno2=7.338549109702e+000
      "Nitrate and nitrite nitrogen" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.MassConcentration Settler_Snh2=2.791485011898e+000
      "Ammonium nitrogen" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.MassConcentration Settler_Snd2=6.003165935477e-001
      "Soluble biodegradable organic nitrogen" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));
    parameter WWU.Alkalinity Settler_Salk2=4.437580751343e+000
      "Alkalinity" annotation (Dialog(
        tab="Settler",
        group="Second stirrer tank"));

    annotation (defaultComponentName="ini");
  end SmallPlantIni;

  record SmallPlantAquaSim
    extends SmallPlantIni;
  end SmallPlantAquaSim;

  package Data
    extends Modelica.Icons.VariantsPackage;
  end Data;
  annotation (
    Documentation(info="This package contains example ASM1 wastewater treatment plant models to demonstrate the usage of
the WasteWater.ASM1 library.
Open the models and simulate them according to the description provided in the models.

The following demo models are present:

 - SmallPlant
 - BenchPlant
 - ComplexPlant

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

Copyright (C) 2003, Gerald Reichl
"));
end Examples;
