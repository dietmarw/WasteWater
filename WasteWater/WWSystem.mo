within WasteWater;
record WWSystem "Global settings for the waste water system to be modelled."

  /* General */
  parameter Types.BioTreatment BioTreat=WasteWater.Types.BioTreatment.ASM1 "Type of biologial treatment";
  parameter Real PI1_x=-3.511076570565e-004 "Start output of controller";

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
  parameter Types.MassConcentration Tank1_Si=3.000000000000e+001 "Soluble inert organic matter" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Ss=2.395032857582e+000 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xi=1.275518549259e+003 "Particulate inert organic matter" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xs=3.770076754487e+001 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xbh=1.956193873766e+003 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xba=8.829237725627e+001 "Active autotrophic biomass" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xp=7.087641710603e+002 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_So=7.377559296960e-003 "Dissolved oxygen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Sno=2.060772419090e+000 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Snh=8.182199118905e+000 "Ammonium nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Snd=5.508870585039e-001 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.MassConcentration Tank1_Xnd=2.635166937210e+000 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  parameter Types.Alkalinity Tank1_Salk=5.179082991135e+000 "Alkalinity" annotation (Dialog(tab="Tank 1", group="Tank 1 - denitrification"));
  /* Tank 2 */
  parameter Types.MassConcentration Tank2_Si=3.000000000000e+001 "Soluble inert organic matter" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Ss=2.463117211568e+000 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xi=1.278333736389e+003 "Particulate inert organic matter" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xs=2.140590310375e+001 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xbh=1.966614626250e+003 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xba=8.900572493248e+001 "Active autotrophic biomass" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xp=7.113292476107e+002 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_So=3.632593914266e+000 "Dissolved oxygen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Sno=4.856770069816e+000 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Snh=5.478663911860e+000 "Ammonium nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Snd=7.252693834073e-001 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.MassConcentration Tank2_Xnd=1.586608768203e+000 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));
  parameter Types.Alkalinity Tank2_Salk=4.782438895247e+000 "Alkalinity" annotation (Dialog(tab="Tank 2", group="Tank 2 - nitrification"));

  /* Tank 3 */
  parameter Types.MassConcentration Tank3_Si=3.000000000000e+001 "Soluble inert organic matter" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Ss=1.768379818970e+000 "Readily biodegradable substrate" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xi=1.280658681727e+003 "Particulate inert organic matter" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xs=1.342037061251e+001 "Slowly biodegradable substrate" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xbh=1.971253187539e+003 "Active heterotrophic biomass" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xba=8.953776792719e+001 "Active autotrophic biomass" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xp=7.135293892258e+002 "Particulate products from biomass decay" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_So=1.499999536940e+000 "Dissolved oxygen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Sno=7.023954787236e+000 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Snh=3.469832897751e+000 "Ammonium nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Snd=6.330054822579e-001 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.MassConcentration Tank3_Xnd=1.058875620146e+000 "Particulate biodegradable organic nitrogen" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));
  parameter Types.Alkalinity Tank3_Salk=4.485176510073e+000 "Alkalinity" annotation (Dialog(tab="Tank 3", group="Tank 3 - nitrification"));

  /* Settler */
  parameter SI.Length Settler_hs=5.029601648736e-001
    "Height of sludge layer" annotation (Dialog(tab="Settler"));
  parameter Types.MassConcentration Settler_Si1=3.000000000000e+001 "Soluble inert organic matter" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_Ss1=1.681287279702e+000 "Readily biodegradable substrate" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_So1=1.499999390854e+000 "Dissolved oxygen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_Sno1=7.168869418367e+000 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_Snh1=2.943675968574e+000 "Ammonium nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_Snd1=6.126843777685e-001 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.Alkalinity Settler_Salk1=4.461450405862e+000 "Alkalinity" annotation (Dialog(tab="Settler", group="First stirrer tank"));
  parameter Types.MassConcentration Settler_Si2=3.000000000000e+001 "Soluble inert organic matter" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.MassConcentration Settler_Ss2=1.635315887679e+000 "Readily biodegradable substrate" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.MassConcentration Settler_So2=1.499999562861e+000 "Dissolved oxygen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.MassConcentration Settler_Sno2=7.338549109702e+000 "Nitrate and nitrite nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.MassConcentration Settler_Snh2=2.791485011898e+000 "Ammonium nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.MassConcentration Settler_Snd2=6.003165935477e-001 "Soluble biodegradable organic nitrogen" annotation (Dialog(tab="Settler", group="Second stirrer tank"));
  parameter Types.Alkalinity Settler_Salk2=4.437580751343e+000 "Alkalinity" annotation (Dialog(tab="Settler", group="Second stirrer tank"));

    annotation (
      defaultComponentName="WWS",
      defaultComponentPrefixes="inner parameter",
      missingInnerMessage="
Your model is using an outer \"WWSystem\" component but
an inner \"WWSystem\" component is not defined.
For simulation drag WasteWater.WWSystem into your model
to specify system properties. The default system settings
are used for the current simulation.
",    Icon(graphics={
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
