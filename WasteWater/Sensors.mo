within WasteWater;
package Sensors "Sensor package"
  extends Modelica.Icons.SensorsPackage;
model sensor_COD "Ideal sensor to measure chemical oxygen demand (COD)"
  extends WasteWater.Icons.sensor(Substance="COD");
  Interfaces.WWFlow            In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput
                                        COD annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0.0;
  COD = In.Si + In.Ss + In.Xi + In.Xs + In.Xbh + In.Xba + In.Xp;

  annotation (
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_COD;

model sensor_NH "Ideal sensor to measure ammonium nitrogen"
  extends WasteWater.Icons.sensor(Substance="NH");

  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput Snh annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0;
  Snh = In.Snh;

  annotation (
    Documentation(info="This component measures the ammonium nitrogen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_NH;

model sensor_NO "Ideal sensor to measure nitrate nitrogen"
  extends WasteWater.Icons.sensor(Substance="NO");
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput Sno annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0;
  Sno = In.Sno;

  annotation (
    Documentation(info="This component measures the nitrate nitrogen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_NO;

model sensor_O2 "Ideal sensor to measure dissolved oxygen concentration"
  extends WasteWater.Icons.sensor(Substance="O2");

  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput So annotation (Placement(transformation(
          extent={{88,-10},{108,10}})));
equation

  In.Q = 0;
  So = In.So;

  annotation (
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={223,223,159},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,50},{0,38}},
          thickness=0.5),
        Line(
          points={{-50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{-36,34},{-28,26}},
          thickness=0.5),
        Line(
          points={{34,36},{26,28}},
          thickness=0.5),
        Line(
          points={{0,0},{26,28}},
          thickness=0.5),
        Polygon(
          points={{30,32},{10,24},{24,12},{30,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-36,-10},{36,-32}}, textString=
                                              "O2"),
        Line(
          points={{0,-50},{0,-90}},
          thickness=0.5),
        Line(points={{50,0},{88,0}}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name")}));
end sensor_O2;

model sensor_Q "Ideal sensor to measure the flow rate of an ASM1 wastewater stream"
  extends WasteWater.Icons.sensor(Substance="O2");
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.WWFlow Out(FilledIcon=false)
                        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  WasteWater.Interfaces.VolumeFlowRateOutput Q
    annotation (Placement(transformation(
        origin={0,-98},
        extent={{-10,-10},{10,10}},
        rotation=270)));
equation

  In.Q + Out.Q = 0;
  Q = In.Q;
  // eventually abs(In.Q) to be shure to have pos. signal
  In.Si = Out.Si;
  In.Ss = Out.Ss;
  In.Xi = Out.Xi;
  In.Xs = Out.Xs;
  In.Xbh = Out.Xbh;
  In.Xba = Out.Xba;
  In.Xp = Out.Xp;
  In.So = Out.So;
  In.Sno = Out.Sno;
  In.Snh = Out.Snh;
  In.Snd = Out.Snd;
  In.Xnd = Out.Xnd;
  In.Salk = Out.Salk;

  annotation (
    Documentation(info="This component measures the flow of an ASM1 wastewater stream and provides
the result as output signal (to be further processed with blocks of
the Modelica.Blocks library).
"));
end sensor_Q;

model sensor_TKN "Ideal TKN and total nitrogen sensor"
  extends WasteWater.Icons.sensor(Substance="TKN");

  extends ASM1.Interfaces.stoichiometry;
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput TKN[2]
    annotation (Placement(transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0.0;
  TKN[1] = In.Snh + In.Snd + In.Xnd + i_xb*(In.Xbh + In.Xba) + i_xp*(In.Xp + In.Xi);
  TKN[2] = TKN[1] + In.Sno;

  annotation (
    Documentation(info="This component measures the Total Kjeldal Nitrogen (TKN) and the
total nitrogen (N_total) concentration [g/m3] of ASM1 wastewater
and provides the result as output signal (to be further processed
with blocks of the Modelica.Blocks library).

signal[1] - TKN
signal[2] - N_total
"));
end sensor_TKN;

model sensor_TSS "Ideal sensor to measure total suspended solids concentration (ASM1)"
  extends WasteWater.Icons.sensor(Substance="TSS");
  Interfaces.WWFlow In annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  WasteWater.Interfaces.MassConcentrationOutput TSS annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0;

  TSS = 0.75*(In.Xs + In.Xbh + In.Xba + In.Xp + In.Xi);
  // the factor 0.75 needs to be adapted due to plant dependency
  // 0.75 is from the COST Benchmark configuration

  annotation (
    Documentation(info="This component measures the total suspended solids concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_TSS;
end Sensors;
