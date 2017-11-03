within WasteWater;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;
  package References
    extends Modelica.Icons.References;
    model Haertel1990 "<html>Lutz H&auml;rtel, 
  \"<a href=\"http://d-nb.info/910696519\">
  Modellans&auml;tze zur dynamischen Simulation des Belebtschlammverfahrens</a>\",
  Dissertation, TH Darmstadt, 1990</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Haertel1990;

    model Henze1987 "<html>M. Henze and C.P.L. Grady Jr and W. Gujer and G.v.R. Marais and T. Matsuo,
  \"Activated Sludge Model No.1\",
  <em>IAWQ</em>,
   1987</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Henze1987;

    model Henze2000 "<html>M. Henze and W.Gujer and T. Mino and. M.v. Loosdrecht,
  \"<a href=\"ftp://ceres.udc.es/Master_en_Ingenieria_del_Agua/master%20antiguo_antes%20del%202012/Segundo_Curso/Programas_Comerciales_en_Ingenieria_Hidraulica_y_Sanitaria/ajacome-aquasim/MODELOS-ASM1-ASM2-ASM3.pdf\">
  Activated Sludge Models ASM1, ASM2, ASM2d and ASM3</a>\",
  <em>IWA Task Group on Mathematical Modelling for Design and Operation of Biological Wastewater Treatment</em>,
   2000</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Henze2000;

    model Krebs2000 "<html>P. Krebs and M. Armbruster and W. Rodi,
  \"Numerische Nachklaerbeckenmodelle\",
  in <em>Korrespondenz Abwasser. 47 (7)</em>, pp 985-999,
   2000</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Krebs2000;

    model Otterpohl1992 "<html>R. Otterpohl and M. Freund, 
  \"<a href=\"http://wst.iwaponline.com/content/26/5-6/1391\">
  Dynamic Models for Clarifiers of Activated Sludge Plants with Dry and Wet Weather Flows
  </a>\", in <em>Water Science and Technology</em>, vol. 26, no. 5-6, pp. 1391-1400,
  1992</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Otterpohl1992;

    model Reichl2003 "<html>Gerald Reichl, 
  \"<a href=\"https://modelica.org/events/Conference2003/papers/h05_Reichl.pdf\">
  WasteWater - a Library for Modeling and Simulation of Wastewater Treatment Plants in Modelica
  </a>\", in <em>Modelica Conference</em> (Link&ouml;ping, Sweden), pp. 171-176,
  November 3-4, 2003</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Reichl2003;

    model Reichl2005 "<html>Gerald Reichl, 
  \"<a href=\"http://d-nb.info/978219236\">
  Optimierte Bewirtschaftung von Kläranlagen basierend auf der Modellierung mit Modelica</a>\",
  Dissertation, TU Ilmenau, 2005</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Reichl2005;

    model Takacs1991 "<html>I. Takacs and G.G. Patry and D. Nolasco, 
  \"<a href=\"https://doi.org/10.1016/0043-1354(91)90066-Y\">
  A dynamic model of the clarification-thickening process</a>\",
  in <em>Water Research</em>, vol. 25, pp. 1263-1271,
  1991</html>"
      extends Modelica.Icons.References;
      annotation (preferredView="info", DocumentationClass=false);
    end Takacs1991;
    annotation (Documentation(info="<html>
<p>List of reference in which this library is based on. 
The library itself was used as part of the German dissertation 
<a href=\"modelica://WasteWater.UsersGuide.References.Reichl2005\">[Reichl2005]</a>.</p>
</html>"));
  end References;

  class Contact "Contact"
  extends Modelica.Icons.Contact;
    annotation (Documentation(info="<html>
<h5>Main Author</h5>
<blockquote>
Gerald Reichl<br />
Technische Universitaet Ilmenau<br />
Faculty of Informatics and Automation<br />
Department Dynamics and Simulation of ecological Systems<br />
P.O. Box 10 05 65<br />
98684 Ilmenau<br />
Germany<br />
email: <a href=\"mailto:gerald.reichl@tu-ilmenau.de\">gerald.reichl@tu-ilmenau.de</a><br />
</blockquote>
<p>Copyright &copy; 2000 - 2003, Gerald Reichl</p>
</html>"));
  end Contact;

  class ModelicaLicense "Modelica License 1.1"
    annotation (Documentation(info="<html>
<head>
  <title>The Modelica License 1.1</title>
<style type=\"text/css\">
*       { font-size: 10pt; font-family: Arial,sans-serif; }
h5      { font-size: 11pt; font-weight: bold; color: green; }
h4      { font-size: 13pt; font-weight: bold; color: green; }
</style>
</head>
<h4>
 The Modelica License (Version 1.1 of June 30, 2000)
</h4>
<p>
Redistribution and use in source and binary forms, with or without modification
are permitted, provided that the following conditions are met:
<ol>
  <li> The author and copyright notices in the source files, these license
       conditions and the disclaimer below are (a) retained and (b) reproduced
       in the documentation provided with the distribution.</li>
  <li> Modifications of the original source files are allowed, provided that a
       prominent notice is inserted in each changed file and the accompanying
       documentation, stating how and when the file was modified, and provided
       that the conditions under (1) are met.</li>
  <li> It is not allowed to charge a fee for the original version or a modified
       version of the software, besides a reasonable fee for distribution and
       support. Distribution in aggregate with other (possibly commercial)
       programs as part of a larger (possibly commercial) software distribution
       is permitted, provided that it is not advertised as a product of your
       own.</li>
</ol>
<h5>Disclaimer</h5>
<p>
The software (sources, binaries, etc.) in their original or in a modified form
 are provided \"as is\" and the copyright holders assume no responsibility for
 its contents what so ever. Any express or implied warranties, including, but
 not limited to, the implied warranties of merchantability and fitness for a
 particular purpose are <b>disclaimed</b>. <b>In no event</b> shall the
 copyright holders, or any party who modify and/or redistribute the package,
 <b>be liable</b> for any direct, indirect, incidental, special, exemplary,
 or consequential damages, arising in any way out of the use of this software,
 even if advised of the possibility of such damage.
</p>
</html>"));
  end ModelicaLicense;
  annotation (DocumentationClass=true, Documentation(info="<html>
<p>This library contains components to build models of biological municipal 
wastewater treatment plants based on the Activated Sludge Model No. 1, 2d and 3 (ASM1, ASM2d, AMS3)
 by the International Association on Water Quality (IAWQ) 
<a href=\"modelica://WasteWater.UsersGuide.References\">[Henze1987, Henze2000]</a>.</p>
</html>"));
end UsersGuide;
