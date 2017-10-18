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
end Interfaces;
