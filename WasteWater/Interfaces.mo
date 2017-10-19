within WasteWater;
package Interfaces "Colection of special interfaces"
  extends Modelica.Icons.InterfacesPackage;
  connector MassConcentrationOutput =
                         output WasteWater.WasteWaterUnits.MassConcentration "Real output connector in [g/m3]"   annotation (
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
                         output WasteWater.WasteWaterUnits.MassConcentration "Real output connector in [m3/d]"   annotation (
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
    parameter Boolean InIcon = true "If true In-icon else Out-icon";
    flow WWU.VolumeFlowRate Q;
    WWU.MassConcentration Si;
    WWU.MassConcentration Ss;
    WWU.MassConcentration Xi;
    WWU.MassConcentration Xs;
    WWU.MassConcentration Xbh;
    WWU.MassConcentration Xba;
    WWU.MassConcentration Xp;
    WWU.MassConcentration So;
    WWU.MassConcentration Sno;
    WWU.MassConcentration Snh;
    WWU.MassConcentration Snd;
    WWU.MassConcentration Xnd;
    WWU.Alkalinity Salk;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}),
          graphics={
            Rectangle(
              visible=InIcon,
              extent={{-100,100},{100,-100}},
              lineColor={191,95,0},
              fillColor={191,95,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              visible=not InIcon,
              extent={{-100,100},{100,-100}},
              lineColor={191,95,0}),
            Text(
              visible=InIcon,
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="%name"),
              Text(
              visible=not InIcon,
              extent={{-100,40},{100,-40}},
              lineColor={191,95,0},
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
The parameter <code>InIcon</code> controls the design only.
</p>
</html>
"));

  end WWFlow;

  connector AirFlow "Airflow connector"
    flow WWU.VolumeFlowRate Q_air;
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
end Interfaces;
