// OpenSCAD-Modell Netzwerkschrank/Wandverteiler mit Equipment
// Version: 2013-08-03
//
// Lizenz: LGPL
// Autor:  https://datakadabra.wordpress.com
//
//
// Alle Einheiten in mm wenn nicht anders benannt.
// Postfix _W = width, _H = height, _D = depth, _S = strength


// Normgroessen n. EIA 310-D, IEC 60297 und DIN 41494 SC48D
RU_H               = 44.450;  // Rack Unit oder Hoeheneinheit HE
RU_REDUCT          =  0.787;  // Panel kleiner als HE fuer leichteren Einbau
STRIP_W            = 15.880;
STRIP_HOLE_W       =  5.486;  // n. UNC #12-24 (UNF #10-32 waer 4,826)
STRIP_HOLES_DIST_1 = 15.880;  // zw. den Bohrungen innerhalb einer HE
STRIP_HOLES_DIST_2 = 12.700;  // zw. den Bohrungen benachbarter HE

// Anschlussbuchsen/Kleinteile/Schnittstellen:
           W=0;   H=1;   D=2;   COLOR=3;        // z.B. RJ45[W]
RJ45    = [15.24, 14.10, 18.00, "lightgray"  ]; 
RJ11    = [15.24, 14.10, 18.00, "yellow"     ]; 
RJ11A   = [15.24, 14.10, 18.00, "orange"     ]; // asymmetrische Nase
SCHUKO  = [36.50, 20.00, 12.00               ]; 
BNC     = [06.35, 06.35,  8.00               ];
F_STECK = [ 6.00, 15.00, 15.00               ]; // Falsch
VGA     = [                                  ]; // Falsch
HDMI    = [                                  ]; // Falsch
LED     = [ 4.00,  3.00,  1.00, [0.7,1.0,0.0]];
NONE    = []; 

// Andere Konstanten:
STRIP_STRENGTH = 2;
WALL_STRENGTH  = 1.5;
SCREW_STRENGTH = 3;  // Schraubenkopf

// Farben:
METAL_COLOR = [0.8, 0.8, 0.8];  // r,g,b,a
GOLD_COLOR  = [0.9, 0.9, 0.5];  // gold-plated conductors
LED_COLOR   = [0.7, 1.0, 0.0];
EQUIP_COLOR = [0.4, 0.4, 0.4];
WALL_COLOR  = [0.9, 0.9, 0.7];



//cabinet(310, 570, 260, 220, 10, 10);  // Triton Rack 10" 10 HE
cabinet(600, 635, 515, 490-60, 12, 19);    // Triton RBA AD5 19" 12 HE
//cabinet(280, 730, 310, 270, 15, 10);  // 19Power 10" 15 HE
//cabinet(280, 600, 310, 270, 12, 10);  // 19Power 10" 12 HE
//cabinet(600, 604, 400, 350, 12, 19);  // Bieger.de Wallkit WK12U 19" 12 HE


EQUIP_LAYOUT = 11;
module equipment(w, h, d) 
{	
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 11)
	{	
		translate(ru(11)) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(10,-1)) cablecanal(w, 1, true);
		translate(ru(9,-2)) switch(24, w, 257);
		translate(ru(8,-3)) cablecanal(w, 1, true);
		translate(ru(6)) 
		{ 
			translate([110, 2, 10]) speedport();
			translate([360, 2, 10]) ntba();
			shelf(w, 400, 4); 
		}
		translate(ru(1)) 
		{ 
			shelf(w, 400, 4); 
			translate([80, RU_H+2, 60]) nas_medion(); 
			translate([30, 2, 10]) videoserver(w-30, RU_H, 336); 
		}
		translate(ru(0)) pdu(8, w);
	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 10)
	{	
		translate(ru(11,0,d-150)) pdu(8, w);
		translate(ru(9)) 
		{ 
			shelf(w, 400, 4); 
			translate([ 30, 2, 10]) nas_medion(); 
			translate([110, 2, 10]) speedport();
			translate([360, 2, 10]) ntba();
		}
		translate(ru(8)) blend(w);
		translate(ru(7)) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(6,-1)) blend(w);
		translate(ru(5,-1)) switch(24, w, 257);
		translate(ru(4,-2)) blend(w);
		translate(ru(3,-2)) blend(w);
		translate(ru(2,-2)) blend(w);
		translate(ru(1,-2)) blend(w);
	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 0)
	{	
		translate(ru(8)) 
		{ 
			shelf(w, 400, 4); 
			translate([ 30, 2, 10]) nas_medion(); 
			translate([110, 2, 10]) speedport();
			translate([360, 2, 10]) ntba();
		}
		translate(ru(7)) cablecanal(w, 1, true);
		translate(ru(6,-1)) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(4, 1)) cablecanal(w, 1, true);
		translate(ru(3)) switch(24, w, 257);
		translate(ru(2)) blend(w);
		translate(ru(1)) blend(w);
		translate(ru(0)) pdu(8, w);
	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 1)
	{	
		translate(ru(8)) 
		{ 
			shelf(w, 400, 4); 
			translate([ 30, 2, 10]) nas_medion(); 
			translate([110, 2, 10]) speedport();
			translate([360, 2, 10]) ntba();
		}
		translate(ru(7)) cablecanal(w, 1, true);
		translate(ru(6,-1)) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(4, 1)) cablecanal(w, 1, true);
		translate(ru(3)) switch(24, w, 257);
		//translate(ru(2)) blend(w);
		translate(ru(1)) shelf(w, 400, 4);
		translate(ru(0)) pdu(8, w);
	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 2)
	{	
		translate(ru(8)) { shelf(w, 400, 4); translate([50, 2, 10]) nas_medion(); }
		translate(ru(7)) { shelf(w, 400, 4); translate([30, 2, 10]) speedport(); }
		translate(ru(6)) cablecanal(w, 1, true);
		translate(ru(5)) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(4)) switch(24, w, 257);
		translate(ru(3)) cablecanal(w, 1, true);
		translate(ru(2)) blend(w);
		translate(ru(1)) blend(w);
		translate(ru(0)) pdu(8, w);
	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 3)
	{	

		translate(ru(8 )) { shelf(w, 400, 4); translate([50, 2, 10]) nas_medion(); }
		translate(ru(7 )) patchpanel(RJ45, 16, w, 100, 4);
		translate(ru(6 )) cablecanal(w, 1, true);
		translate(ru(5 )) switch(24, w, 257);
		translate(ru(4 )) cablecanal(w, 1, true);
		translate(ru(3 )) { shelf(w, 400, 4); translate([30, 2, 10]) speedport(); }
		translate(ru(2 )) blend(w);
		translate(ru(1 )) blend(w);
		translate(ru(0 )) pdu(8, w);

	}
	// --------------------------------------------------------------------
	if (EQUIP_LAYOUT == 4)
	{
		translate(ru(9)) pdu(4, w);
		translate(ru(5)) { shelf(w, 152, 4); translate([50, 2, 10]) nas_medion(); }		
		translate(ru(4)) { shelf(w, 152, 4); translate([30, 2, 10]) 
								videoserver(230, 28, 136); }
		translate(ru(3)) { shelf(w, 152, 4); translate([30, 2, 10]) speedport(); }
		translate(ru(2)) { shelf(w, 152, 4); translate([30, 2, 10]) 
								soho_switch(230,38,10); }
		translate(ru(1)) blend(w);
		translate(ru(0)) patchpanel(RJ45, 12, w, 60, 4);
	}
	// --------------------------------------------------------------------

	
	// ausserhalb des Racks:
	translate([-10, -210, d - 60]) 
		rotate([90, 0, 90])
			tv_multiswitch(150, 28, 120);  // Falsch

}


function ru(level, move_by_holes=0, d=0) = [0, (level*RU_H)+(move_by_holes*STRIP_HOLES_DIST_2), d];


// ============================== Kleinteile & Buchsen ==============================

module screw(w=STRIP_HOLE_W)
{
	color(METAL_COLOR) 
		cylinder(h=STRIP_STRENGTH, r=w/2, center=true);
}

module led(is_diff)
{
	if (!is_diff)
	{
		translate([0, 0, -LED[D]])
			color(LED_COLOR)
				cube([LED[W], LED[H], LED[D]], center=true);
	}
}


module schuko(is_diff)  // aka Stecker-Typ F oder CEE 7/4
{	
	pin_diameter = 4.8;
	pin_height   = 19;
	pin_pin_dist = 19;
	screw_w      = 3.5;
	pg_contact_w = 1.5;   // protective ground
	pg_contact_h = 4;

	if (is_diff)
	{
		color(EQUIP_COLOR) union()
		{
			// Fassung:
			cylinder(h=SCHUKO[H], r=SCHUKO[W]/2, center=true);

			// Schraubenvertiefung:
			translate([0, 0, SCHUKO[D]-1])
				cylinder(h=pin_height, r=screw_w/2, center=true);	

			// Hauptkontakt-Vertiefungen:
			translate([-pin_pin_dist/2, 0, SCHUKO[H]-1])
				cylinder(h=pin_height, r=pin_diameter/2, center=true);

			translate([ pin_pin_dist/2, 0, SCHUKO[H]-1])
				cylinder(h=pin_height, r=pin_diameter/2, center=true);	
		}
	}
	else
	{
		translate([0, 0, SCHUKO[D]]) screw(screw_w);

		// Schutzkontakte:
		color(METAL_COLOR)
		{
			translate([pg_contact_w/2, (SCHUKO[W]/2)-(pg_contact_h/2), SCHUKO[D]/2])
				cube([pg_contact_w, pg_contact_h, SCHUKO[H]/3], center=true);

			translate([pg_contact_w/2, -((SCHUKO[W]/2)-(pg_contact_h/2)), SCHUKO[D]/2])
				cube([pg_contact_w, pg_contact_h, SCHUKO[H]/3], center=true);
		}
	}
}


module rj(is_diff, type)
{
	s = 1;

	if (is_diff)
	{
		cube([RJ45[W], RJ45[H], RJ45[D]+(RJ45[D]/2)], center = true);
	}
	else
	{
		// Buchse Plastikteil:
		color("black")
			translate([0, 0, (RJ45[D]/2)+(RJ45[D]/4)+0.3])
				cube([RJ45[W], RJ45[H], RJ45[D]/2], center = true);

		// Buchse Metallteil:
		color(type[COLOR]) difference()
		{
			translate([0, 0, RJ45[D]/4])
				cube([RJ45[W], RJ45[H], RJ45[D]/2], center = true);
			translate([0, -s, RJ45[D]/4])
				cube([RJ45[W]-(s*2), RJ45[H]-(s*5), RJ45[D]], center = true);

			// Aussparung fuer die Patchkabel-Steckernase:
			translate([0, (RJ45[H]/2)-s-s-((s+s)/2), (RJ45[D]/4)])
				cube([RJ45[W]/2, s+s+0.2, RJ45[D]], center = true);
			translate([0, (RJ45[H]/2)-s-(s/2), (RJ45[D]/4)])
				cube([RJ45[W]/4, s+0.2, RJ45[D]], center = true);
		}
	}
}


module bnc(is_diff)
{
	nose_h    = 1.5;
	nose_w    = 2.5;
	conduct_s = 0.5;

	if (is_diff)
	{
		translate([0, 0, 2.49])
			cylinder(h=5, r=(BNC[W]/2)+0.75, center=true);
	}
	else
	{
		color("black")
			translate([0, 0, 2.49])
				cylinder(h=5, r=(BNC[W]/2)+0.75, center=true);
		
		translate([0, 0, -BNC[D]+5])
		{
			// Kontakt fuer Aussenleiter
			color(METAL_COLOR) difference()
			{
				cylinder(h=BNC[D], r=BNC[W]/2, center=true);
				translate([0, 0, -1]) // unten geschlossen
					cylinder(h=BNC[D]-1, r=(BNC[W]/2)-conduct_s, center=true);
			}

			// Anschlussnase zur Kabelfixierung
			color(METAL_COLOR)
				translate([0, (BNC[W]/2)+(nose_h/2), -(BNC[H]/2)+1])
					rotate([90, 0, 0])
						cylinder(h=nose_h, r=nose_w/2, center=true);

			// Kontakt fuer Innenleiter "Seele", inkl. Iso (#)
			//   | #|# |
			//   |##|##|
			color("white") // Iso
			{
				cylinder(h=0.1, r=(BNC[W]/2)-conduct_s-1, center=true);
				difference()
				{
					cylinder(h=BNC[D], r=2, center=true);
					translate([0, 0, -1])
						cylinder(h=BNC[D]-1, r=1.5, center=true);
				}
			}
			color(GOLD_COLOR) difference()
			{
				translate([0, 0, -1])
					cylinder(h=BNC[D]-2, r=1.5, center=true);
				translate([0, 0, -(BNC[D]/2)-1])
					cylinder(h=BNC[D]-5, r=1, center=false);
			}
		}

	}
}


module f_steck(is_diff)
{
}


module vga(is_diff)
{
}


module jack(type, is_diff)
{
	if (type == RJ45  ||
	    type == RJ11  ||
	    type == RJ11A  ) rj(is_diff, type);
	if (type == BNC    ) bnc(is_diff);
	if (type == F_STECK) f_steck(is_diff);
	if (type == VGA    ) vga(is_diff);
	if (type == SCHUKO ) schuko(is_diff);
	if (type == LED    ) led(is_diff);
}


module jackrow(jacktypes, is_diff, multiply_by=1, port_dist=1)
{
	for (m=[1 : multiply_by], p=[0 : 20])
	{
		translate([((p+m)*(jacktypes[0][W]+port_dist)), h/2, 0])
			jack(jacktypes[p], is_diff);
	}
}


// =============== Non-10"/19", Standalone Devices, SOHO Appliances ===============

module standalone(w, h, d, front_jacktypes, rear_jacktypes, case_color, port_dist=3)
{
	p_x = 15;

	color(case_color) difference()
	{
		cube([w, h, d], center = false);
		translate([p_x, h/2, 0])  jackrow(front_jacktypes, true, 1, port_dist); 
		translate([p_x, h/2, d]) 
			rotate([180, 0, 0]) jackrow(rear_jacktypes, true, 1, port_dist); 
	}
	translate([p_x, h/2, 0])  jackrow(front_jacktypes, false, 1, port_dist); 
	translate([p_x, h/2, d]) 
		rotate([180, 0, 0]) jackrow(rear_jacktypes, false, 1, port_dist); 
}

module soho_switch(w, h, d, ports)
{
	standalone(w, h, d, [], 
			[RJ45,RJ45,RJ45,RJ45,RJ45,RJ45,RJ45, RJ45,RJ45,RJ45,RJ45,RJ45,RJ45,RJ45], 
			"lightseagreen", 0);
}

module speedport() // Speedport W 724V (IP-Anschluss) / NTBBA
{
	standalone(230, 28, 135, [LED,LED,LED,LED], [RJ45,RJ45,RJ45,RJ45,,RJ11,RJ11,,F_STECK,F_STECK], "white", 3);
}

module videoserver(w, h, d)
{
	standalone(w, h, d, [LED,LED], [RJ45,,BNC,BNC,BNC,BNC], "lightskyblue", 8);
}

module tv_multiswitch(w, h, d)
{
	standalone(w, h, d, [BNC,BNC,BNC,BNC,BNC,BNC], [BNC,BNC,BNC,BNC,BNC,BNC], "tan", 8);
}

module nas_medion()
{
	w = 173; h = 63; d = 135; case_color = [0.2,0.2,0.2];
	translate([h, 0, 0])
		rotate([0, 0, 90])
			standalone(w, h, d, [LED,LED], [RJ45], case_color); // 1 Kg
}

module ntba() // aka NT, Network Termination for ISDN Basic Acces
{
	// RJ11 asym. nose Amt/Splitter; 
	// 2x RJ45 S0-Bus, Anschlussklemmen ab, a1b1a2b2
	standalone(118, 40, 149, [RJ11A,,RJ45,RJ45], [LED], "white", 3);
}

module splitter()  // aka BBAE
{
	// F_STECK, RJ11 asym nose Amt; RJ45 DSL
	standalone(60, 65, 25, [RJ11A,,RJ45], "white");

}

module tae()  // Telekommunikationsanschlusseinheit
{
	standalone(60, 65, 25, [F_STECK], "white");
}




// ================================ Einschuebe ====================================

module gear(w, rack_units, d, screws)  // Einschub o. Rack-Primitive
{
	//    |<------ mounting flange dim 19" ------>|<-- vary 
	// ,--|----.                             .----|--.
	// |    [] |<---- inside dim 17.72" ---->| []    |
	// |    [] |                             | []    |
	//

	h        = (rack_units * RU_H) - RU_REDUCT;
	screw_rx = STRIP_W / 2;
	screw_lx = w + STRIP_W + (STRIP_W / 2);

	// Technikkoerper:
	translate([STRIP_W, RU_REDUCT/2, STRIP_STRENGTH])
		color(METAL_COLOR) 
			cube([w, h, d]);

	// Frontplatte:
	translate([0, RU_REDUCT/2, 0])
		color(EQUIP_COLOR)
			cube([w+(2*STRIP_W), h, STRIP_STRENGTH]);

	// Fixierschrauben:
	if (screws == 2 || screws == 6)
	{
		translate([screw_rx, h/2, 0]) screw();
		translate([screw_lx, h/2, 0]) screw();
	}
	if (screws == 4 || screws == 6)
	{
		translate([screw_rx,    STRIP_HOLES_DIST_2/2,  0]) screw();
 		translate([screw_lx,    STRIP_HOLES_DIST_2/2,  0]) screw();
		translate([screw_rx, h-(STRIP_HOLES_DIST_2/2), 0]) screw();
		translate([screw_lx, h-(STRIP_HOLES_DIST_2/2), 0]) screw();
	}
}


module blend(w)
{
	gear(w, 1, 0, 2);
}


module cablecanal(w, rack_units, is_open)
{
	finger_d    = 60;
	finger_w    = 15;
	finger_dist = 7;
	holes       = 3;
	hole_dist   = 50;
	hole_r      = (RU_H/3)-3;
	hole_w      = ((w-(2*STRIP_W)-(hole_dist*(holes-1)))/holes);

	difference()
	{
		gear(w, rack_units, 0, 4);
		// Oeffnungen auf der Rückseite zur Kabelfuehrung nach Hinten
		for (x = [STRIP_W+hole_r : hole_w+hole_dist : w])
		{
			color(EQUIP_COLOR)	
			{
				hull()
				{
					translate([x, RU_H/2, 0]) 
						cylinder(h=STRIP_STRENGTH+5, r=hole_r, center=true);
					translate([x+hole_w, RU_H/2, 0]) 
						cylinder(h=STRIP_STRENGTH+5, r=hole_r, center=true);
				}
			}
		}
	}

	color(EQUIP_COLOR)
	{
		for (x = [STRIP_W : finger_w+finger_dist : w])
		{
			// 22 Finger unten
			translate([x, 5, -finger_d]) 
				cube([finger_w, 2, finger_d]);

			// 22 Finger oben
			translate([x, (rack_units*RU_H)-7, -finger_d]) 
				cube([finger_w, 2, finger_d]);
		}
		// Verschlussklappe
		if (is_open)
		{
			translate([STRIP_W-4, 0, -finger_d])
				cube([w, rack_units*RU_H, 2]);
		}	
	}
}


module cablemgr(w)
{
	radius      = 2;
	bend_radius = 15;
	angle_1     = 90;
	angle_2     = 90;

	gear(w, 1, 0, 2);

/*
	// lower arm
	rotate([0, 0, angle_1])
		translate([bend_radius + radius, 0.02, 0])
			rotate([90, 0, 0])
				difference() 
				{
					cylinder(r=radius, h=50);
					translate([0, 0, -1])
						cylinder(r=inner_radius, h=52);
				}
	
	// upper arm
	rotate([0, 0, angle_2])
		translate([bend_radius + radius, -0.02, 0])
			rotate([-90, 0, 0])
				difference() 
				{
					cylinder(r=radius, h=50);
					translate([0, 0, -1])
						cylinder(r=inner_radius, h=52);
				}
*/

	dist = w / 5; // 10" nur 3

	for (x = [1 : dist : w-(STRIP_W*2)])
		translate([x+STRIP_W+(dist/2), RU_H/2, 0])
			rotate([0, 90, 0])
				color(EQUIP_COLOR)
					difference() 
					{
						// bend

						// torus
						rotate_extrude()
							translate([bend_radius+radius, 0, 0])
								circle(r = radius);

						// torus cutout
						// rotate_extrude()
						// 		translate([bend_radius + radius, 0, 0])
						//			circle(r=inner_radius);
				
						// lower cutout
						// rotate([0, 0, angle_1])
						// 		translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), -100, -50])
						//			cube([100, 100, 100]);

						// upper cutout
							rotate([0, 0, angle_2])
								translate([-50*(((angle_2-angle_1)<=180)?1:0), 0, -50])
									cube([100, 100, 10]);
					}
}


module shelf(w, d, screws)  // 10" d=152, 19" d=?
{
	difference()
	{
		gear(w, 1, d, screws); // Gibt keine Fachboeden > 1 HE
		translate([STRIP_W+STRIP_STRENGTH, STRIP_STRENGTH, -1])
			color(EQUIP_COLOR)
				cube([w-(2*STRIP_STRENGTH), RU_H-RU_REDUCT-STRIP_STRENGTH+1, d+4]);

		// Bodenbohrungen:
		for (x=[w/8 : w/8 : w], 
		     z=[d/4 : d/4 : d/1.25])
		{
			translate([x, 1, z])
				rotate([90])
					color(EQUIP_COLOR)
						cylinder(h=STRIP_STRENGTH+1, r=2, center=true);
		}
	}
}


module patchpanel(jacktype, num_ports, w, d, screws)
{
	p_dist = 12;
	p_x    = (w / 2) - ((num_ports * (jacktype[W] + p_dist)) / 2);

	difference()
	{
		gear(w, 1, d, screws); // immer 1 HE, fuer 2 HE werden 2 Panels verbaut
		translate([p_x, RU_H/2, 0]) jackrow([jacktype], true, num_ports, p_dist);
	}
	translate([p_x, RU_H/2, 0]) jackrow([jacktype], false, num_ports, p_dist);
}


module switch(num_ports, w, d)
{
	p_x = (w / 2) - (((num_ports / 2) * RJ45[W]) / 2);
	l_x = w - ((num_ports / 2) * LED[W]) - 10;

	difference()
	{
		gear(w, 1, d, 4);  // Haben eigtl. immer 4 Schrauben
		translate([p_x, (RU_H/2)-(RJ45[H]/2)-1, 0]) jackrow([RJ45], true, num_ports/2);
		translate([p_x, (RU_H/2)+(RJ45[H]/2)+1, 0]) jackrow([RJ45], true, num_ports/2);
	}
	translate([p_x, (RU_H/2)-(RJ45[H]/2)-1, 0]) jackrow([RJ45], false, num_ports/2);
	translate([p_x, (RU_H/2)+(RJ45[H]/2)+1, 0]) jackrow([RJ45], false, num_ports/2);

	// Uplink
	
	// Statusanzeige mit Leuchtdioden:
	translate([l_x, (RU_H/2)-(LED[H]*2)-2, 0]) jackrow([LED], false, num_ports/2);
	translate([l_x, (RU_H/2)-(LED[H]/2)-2, 0]) jackrow([LED], false, num_ports/2);
	translate([l_x, (RU_H/2)+(LED[H]/2)+2, 0]) jackrow([LED], false, num_ports/2);
	translate([l_x, (RU_H/2)+(LED[H]*2)+2, 0]) jackrow([LED], false, num_ports/2);
}


module pdu(num_ports, w)
{
	patchpanel(SCHUKO, num_ports, w, 60, 2);
	// An/Aus-Schalter:
	color("red")
		translate([w, RU_H/2, 0])
			cube([10, 15, 5], center=true);
}



// ============================= Montagekaefig + Waende ==============================

module mounting_strip(rack_units)  // Montagerahmen
{
	strip_h = rack_units * RU_H;

	// Blechwinkel:
	color(METAL_COLOR) difference()
	{
		cube([STRIP_W, strip_h, STRIP_W]);
		translate([STRIP_STRENGTH, -1, STRIP_STRENGTH])
			cube([STRIP_W, strip_h+2, STRIP_W]);

		//                   ___________________________________________ 
		//                  |  | 15,88 |          |                     |
		// Gewindebohrungen | (|)     (|)     (|) | (|)     ( )     ( ) |
		// & Abstaende von  |                  |12,70|                  |
		// Lochmitte        |_________1HE_________|_________1HE_________|

		for (u   =[0 : rack_units-1], 
		     dist=[(STRIP_HOLES_DIST_2/2),
		           (STRIP_HOLES_DIST_2/2)+STRIP_HOLES_DIST_1,
		           (STRIP_HOLES_DIST_2/2)+STRIP_HOLES_DIST_1+STRIP_HOLES_DIST_1])
		{
			translate([STRIP_W/2, (u*RU_H)+dist, 0])
			{
				cube([STRIP_HOLE_W, 
				      STRIP_HOLE_W, 
				      STRIP_STRENGTH+STRIP_STRENGTH+1], center=true);
			}
		}

		// Gewinedebohrungen an der Seite, Standards?
	}
}


module cabinet(outer_w, outer_h, outer_d, mount_d, rack_units, formfactor_inch)
{
	// Aussenwaende:
	color(WALL_COLOR) difference()
	{
		cube([outer_w+(WALL_STRENGTH*2), outer_h, outer_d]);
		translate([-1, WALL_STRENGTH, -1])
			cube([outer_w+(WALL_STRENGTH*2), outer_h-(WALL_STRENGTH*2), 
					outer_d-WALL_STRENGTH+1]);

		// Kabeloeffnung unten
		translate([outer_w/3, -1, outer_d-(outer_d/4)])
			cube([outer_w/3, WALL_STRENGTH+2, outer_d/7]);

		// Kabeloeffnung oben
		translate([outer_w/3, outer_h-2, outer_d-(outer_d/4)])
			cube([outer_w/3, WALL_STRENGTH+2, outer_d/7]);
	}


	// Montagerahmen:
	shelf_w           = formfactor_inch * 25.4; // Umrechnungsgroesse Zoll->mm
	strip_wall_dist_x = (outer_w - shelf_w - (STRIP_W * 2)) / 2;
	strip_wall_dist_y = (outer_h - (rack_units * RU_H)) / 2;
	strip_wall_dist_z = (outer_d - mount_d);

	translate([strip_wall_dist_x, strip_wall_dist_y, strip_wall_dist_z])
		mounting_strip(rack_units);

	translate([outer_w - strip_wall_dist_x, strip_wall_dist_y, strip_wall_dist_z])
		mirror() mounting_strip(rack_units);

	translate([strip_wall_dist_x, strip_wall_dist_y, 
	           strip_wall_dist_z-STRIP_STRENGTH]) 
		equipment(shelf_w, ru_units*RU_H, mount_d);
}




// Implementierung:
// - Negativkoerper werden manchmal mit 1 oder 2mm verlaengert um
//   CSG-Renderfehler zu vermeiden. 
