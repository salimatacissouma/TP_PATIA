(define (problem DLOG-20-20-40)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	driver4 - driver
	driver5 - driver
	driver6 - driver
	driver7 - driver
	driver8 - driver
	driver9 - driver
	driver10 - driver
	driver11 - driver
	driver12 - driver
	driver13 - driver
	driver14 - driver
	driver15 - driver
	driver16 - driver
	driver17 - driver
	driver18 - driver
	driver19 - driver
	driver20 - driver
	truck1 - truck
	truck2 - truck
	truck3 - truck
	truck4 - truck
	truck5 - truck
	truck6 - truck
	truck7 - truck
	truck8 - truck
	truck9 - truck
	truck10 - truck
	truck11 - truck
	truck12 - truck
	truck13 - truck
	truck14 - truck
	truck15 - truck
	truck16 - truck
	truck17 - truck
	truck18 - truck
	truck19 - truck
	truck20 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	package7 - obj
	package8 - obj
	package9 - obj
	package10 - obj
	package11 - obj
	package12 - obj
	package13 - obj
	package14 - obj
	package15 - obj
	package16 - obj
	package17 - obj
	package18 - obj
	package19 - obj
	package20 - obj
	package21 - obj
	package22 - obj
	package23 - obj
	package24 - obj
	package25 - obj
	package26 - obj
	package27 - obj
	package28 - obj
	package29 - obj
	package30 - obj
	package31 - obj
	package32 - obj
	package33 - obj
	package34 - obj
	package35 - obj
	package36 - obj
	package37 - obj
	package38 - obj
	package39 - obj
	package40 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	s6 - location
	s7 - location
	s8 - location
	s9 - location
	s10 - location
	s11 - location
	s12 - location
	s13 - location
	s14 - location
	s15 - location
	s16 - location
	s17 - location
	s18 - location
	s19 - location
	s20 - location
	s21 - location
	s22 - location
	s23 - location
	s24 - location
	s25 - location
	s26 - location
	s27 - location
	s28 - location
	s29 - location
	p0-13 - location
	p0-23 - location
	p1-20 - location
	p1-23 - location
	p2-3 - location
	p2-7 - location
	p2-11 - location
	p3-14 - location
	p4-6 - location
	p4-27 - location
	p5-26 - location
	p6-0 - location
	p6-8 - location
	p6-9 - location
	p6-19 - location
	p7-3 - location
	p7-25 - location
	p8-4 - location
	p8-11 - location
	p8-15 - location
	p9-22 - location
	p10-0 - location
	p10-21 - location
	p11-4 - location
	p11-10 - location
	p11-20 - location
	p11-23 - location
	p12-2 - location
	p12-24 - location
	p13-24 - location
	p14-29 - location
	p15-25 - location
	p15-27 - location
	p15-28 - location
	p16-25 - location
	p17-9 - location
	p17-12 - location
	p17-16 - location
	p17-19 - location
	p18-0 - location
	p18-25 - location
	p18-29 - location
	p19-7 - location
	p19-14 - location
	p19-29 - location
	p20-9 - location
	p20-14 - location
	p21-1 - location
	p21-27 - location
	p22-20 - location
	p23-21 - location
	p24-1 - location
	p24-17 - location
	p25-3 - location
	p25-5 - location
	p25-29 - location
	p26-18 - location
	p27-14 - location
	p29-12 - location
	p29-23 - location
	p29-24 - location
	)
	(:init
	(at driver1 s22)
	(at driver2 s28)
	(at driver3 s12)
	(at driver4 s10)
	(at driver5 s17)
	(at driver6 s20)
	(at driver7 s15)
	(at driver8 s28)
	(at driver9 s5)
	(at driver10 s21)
	(at driver11 s23)
	(at driver12 s19)
	(at driver13 s4)
	(at driver14 s6)
	(at driver15 s27)
	(at driver16 s23)
	(at driver17 s17)
	(at driver18 s5)
	(at driver19 s11)
	(at driver20 s16)
	(at truck1 s3)
	(empty truck1)
	(at truck2 s10)
	(empty truck2)
	(at truck3 s7)
	(empty truck3)
	(at truck4 s13)
	(empty truck4)
	(at truck5 s29)
	(empty truck5)
	(at truck6 s22)
	(empty truck6)
	(at truck7 s23)
	(empty truck7)
	(at truck8 s3)
	(empty truck8)
	(at truck9 s3)
	(empty truck9)
	(at truck10 s26)
	(empty truck10)
	(at truck11 s5)
	(empty truck11)
	(at truck12 s24)
	(empty truck12)
	(at truck13 s21)
	(empty truck13)
	(at truck14 s8)
	(empty truck14)
	(at truck15 s25)
	(empty truck15)
	(at truck16 s1)
	(empty truck16)
	(at truck17 s16)
	(empty truck17)
	(at truck18 s26)
	(empty truck18)
	(at truck19 s28)
	(empty truck19)
	(at truck20 s29)
	(empty truck20)
	(at package1 s19)
	(at package2 s24)
	(at package3 s1)
	(at package4 s16)
	(at package5 s15)
	(at package6 s27)
	(at package7 s14)
	(at package8 s24)
	(at package9 s4)
	(at package10 s23)
	(at package11 s10)
	(at package12 s28)
	(at package13 s28)
	(at package14 s16)
	(at package15 s7)
	(at package16 s1)
	(at package17 s20)
	(at package18 s27)
	(at package19 s26)
	(at package20 s22)
	(at package21 s10)
	(at package22 s25)
	(at package23 s4)
	(at package24 s26)
	(at package25 s11)
	(at package26 s13)
	(at package27 s5)
	(at package28 s1)
	(at package29 s0)
	(at package30 s29)
	(at package31 s29)
	(at package32 s18)
	(at package33 s21)
	(at package34 s10)
	(at package35 s1)
	(at package36 s8)
	(at package37 s0)
	(at package38 s20)
	(at package39 s3)
	(at package40 s13)
	(path s0 p0-13)
	(path p0-13 s0)
	(path s13 p0-13)
	(path p0-13 s13)
	(path s0 p0-23)
	(path p0-23 s0)
	(path s23 p0-23)
	(path p0-23 s23)
	(path s1 p1-20)
	(path p1-20 s1)
	(path s20 p1-20)
	(path p1-20 s20)
	(path s1 p1-23)
	(path p1-23 s1)
	(path s23 p1-23)
	(path p1-23 s23)
	(path s2 p2-3)
	(path p2-3 s2)
	(path s3 p2-3)
	(path p2-3 s3)
	(path s2 p2-7)
	(path p2-7 s2)
	(path s7 p2-7)
	(path p2-7 s7)
	(path s2 p2-11)
	(path p2-11 s2)
	(path s11 p2-11)
	(path p2-11 s11)
	(path s3 p3-14)
	(path p3-14 s3)
	(path s14 p3-14)
	(path p3-14 s14)
	(path s4 p4-6)
	(path p4-6 s4)
	(path s6 p4-6)
	(path p4-6 s6)
	(path s4 p4-27)
	(path p4-27 s4)
	(path s27 p4-27)
	(path p4-27 s27)
	(path s5 p5-26)
	(path p5-26 s5)
	(path s26 p5-26)
	(path p5-26 s26)
	(path s6 p6-0)
	(path p6-0 s6)
	(path s0 p6-0)
	(path p6-0 s0)
	(path s6 p6-8)
	(path p6-8 s6)
	(path s8 p6-8)
	(path p6-8 s8)
	(path s6 p6-9)
	(path p6-9 s6)
	(path s9 p6-9)
	(path p6-9 s9)
	(path s6 p6-19)
	(path p6-19 s6)
	(path s19 p6-19)
	(path p6-19 s19)
	(path s7 p7-3)
	(path p7-3 s7)
	(path s3 p7-3)
	(path p7-3 s3)
	(path s7 p7-25)
	(path p7-25 s7)
	(path s25 p7-25)
	(path p7-25 s25)
	(path s8 p8-4)
	(path p8-4 s8)
	(path s4 p8-4)
	(path p8-4 s4)
	(path s8 p8-11)
	(path p8-11 s8)
	(path s11 p8-11)
	(path p8-11 s11)
	(path s8 p8-15)
	(path p8-15 s8)
	(path s15 p8-15)
	(path p8-15 s15)
	(path s9 p9-22)
	(path p9-22 s9)
	(path s22 p9-22)
	(path p9-22 s22)
	(path s10 p10-0)
	(path p10-0 s10)
	(path s0 p10-0)
	(path p10-0 s0)
	(path s10 p10-21)
	(path p10-21 s10)
	(path s21 p10-21)
	(path p10-21 s21)
	(path s11 p11-4)
	(path p11-4 s11)
	(path s4 p11-4)
	(path p11-4 s4)
	(path s11 p11-10)
	(path p11-10 s11)
	(path s10 p11-10)
	(path p11-10 s10)
	(path s11 p11-20)
	(path p11-20 s11)
	(path s20 p11-20)
	(path p11-20 s20)
	(path s11 p11-23)
	(path p11-23 s11)
	(path s23 p11-23)
	(path p11-23 s23)
	(path s12 p12-2)
	(path p12-2 s12)
	(path s2 p12-2)
	(path p12-2 s2)
	(path s12 p12-24)
	(path p12-24 s12)
	(path s24 p12-24)
	(path p12-24 s24)
	(path s13 p13-24)
	(path p13-24 s13)
	(path s24 p13-24)
	(path p13-24 s24)
	(path s14 p14-29)
	(path p14-29 s14)
	(path s29 p14-29)
	(path p14-29 s29)
	(path s15 p15-25)
	(path p15-25 s15)
	(path s25 p15-25)
	(path p15-25 s25)
	(path s15 p15-27)
	(path p15-27 s15)
	(path s27 p15-27)
	(path p15-27 s27)
	(path s15 p15-28)
	(path p15-28 s15)
	(path s28 p15-28)
	(path p15-28 s28)
	(path s16 p16-25)
	(path p16-25 s16)
	(path s25 p16-25)
	(path p16-25 s25)
	(path s17 p17-9)
	(path p17-9 s17)
	(path s9 p17-9)
	(path p17-9 s9)
	(path s17 p17-12)
	(path p17-12 s17)
	(path s12 p17-12)
	(path p17-12 s12)
	(path s17 p17-16)
	(path p17-16 s17)
	(path s16 p17-16)
	(path p17-16 s16)
	(path s17 p17-19)
	(path p17-19 s17)
	(path s19 p17-19)
	(path p17-19 s19)
	(path s18 p18-0)
	(path p18-0 s18)
	(path s0 p18-0)
	(path p18-0 s0)
	(path s18 p18-25)
	(path p18-25 s18)
	(path s25 p18-25)
	(path p18-25 s25)
	(path s18 p18-29)
	(path p18-29 s18)
	(path s29 p18-29)
	(path p18-29 s29)
	(path s19 p19-7)
	(path p19-7 s19)
	(path s7 p19-7)
	(path p19-7 s7)
	(path s19 p19-14)
	(path p19-14 s19)
	(path s14 p19-14)
	(path p19-14 s14)
	(path s19 p19-29)
	(path p19-29 s19)
	(path s29 p19-29)
	(path p19-29 s29)
	(path s20 p20-9)
	(path p20-9 s20)
	(path s9 p20-9)
	(path p20-9 s9)
	(path s20 p20-14)
	(path p20-14 s20)
	(path s14 p20-14)
	(path p20-14 s14)
	(path s21 p21-1)
	(path p21-1 s21)
	(path s1 p21-1)
	(path p21-1 s1)
	(path s21 p21-27)
	(path p21-27 s21)
	(path s27 p21-27)
	(path p21-27 s27)
	(path s22 p22-20)
	(path p22-20 s22)
	(path s20 p22-20)
	(path p22-20 s20)
	(path s23 p23-21)
	(path p23-21 s23)
	(path s21 p23-21)
	(path p23-21 s21)
	(path s24 p24-1)
	(path p24-1 s24)
	(path s1 p24-1)
	(path p24-1 s1)
	(path s24 p24-17)
	(path p24-17 s24)
	(path s17 p24-17)
	(path p24-17 s17)
	(path s25 p25-3)
	(path p25-3 s25)
	(path s3 p25-3)
	(path p25-3 s3)
	(path s25 p25-5)
	(path p25-5 s25)
	(path s5 p25-5)
	(path p25-5 s5)
	(path s25 p25-29)
	(path p25-29 s25)
	(path s29 p25-29)
	(path p25-29 s29)
	(path s26 p26-18)
	(path p26-18 s26)
	(path s18 p26-18)
	(path p26-18 s18)
	(path s27 p27-14)
	(path p27-14 s27)
	(path s14 p27-14)
	(path p27-14 s14)
	(path s29 p29-12)
	(path p29-12 s29)
	(path s12 p29-12)
	(path p29-12 s12)
	(path s29 p29-23)
	(path p29-23 s29)
	(path s23 p29-23)
	(path p29-23 s23)
	(path s29 p29-24)
	(path p29-24 s29)
	(path s24 p29-24)
	(path p29-24 s24)
	(link s0 s13)
	(link s13 s0)
	(link s0 s27)
	(link s27 s0)
	(link s1 s4)
	(link s4 s1)
	(link s1 s7)
	(link s7 s1)
	(link s1 s15)
	(link s15 s1)
	(link s1 s17)
	(link s17 s1)
	(link s1 s21)
	(link s21 s1)
	(link s1 s26)
	(link s26 s1)
	(link s1 s27)
	(link s27 s1)
	(link s1 s28)
	(link s28 s1)
	(link s2 s3)
	(link s3 s2)
	(link s2 s17)
	(link s17 s2)
	(link s2 s29)
	(link s29 s2)
	(link s3 s7)
	(link s7 s3)
	(link s3 s19)
	(link s19 s3)
	(link s3 s27)
	(link s27 s3)
	(link s4 s9)
	(link s9 s4)
	(link s4 s24)
	(link s24 s4)
	(link s5 s4)
	(link s4 s5)
	(link s5 s22)
	(link s22 s5)
	(link s6 s0)
	(link s0 s6)
	(link s6 s2)
	(link s2 s6)
	(link s6 s4)
	(link s4 s6)
	(link s6 s22)
	(link s22 s6)
	(link s7 s13)
	(link s13 s7)
	(link s7 s16)
	(link s16 s7)
	(link s7 s21)
	(link s21 s7)
	(link s7 s24)
	(link s24 s7)
	(link s7 s25)
	(link s25 s7)
	(link s8 s5)
	(link s5 s8)
	(link s8 s17)
	(link s17 s8)
	(link s8 s19)
	(link s19 s8)
	(link s8 s23)
	(link s23 s8)
	(link s8 s25)
	(link s25 s8)
	(link s8 s26)
	(link s26 s8)
	(link s8 s29)
	(link s29 s8)
	(link s9 s0)
	(link s0 s9)
	(link s9 s29)
	(link s29 s9)
	(link s10 s2)
	(link s2 s10)
	(link s10 s11)
	(link s11 s10)
	(link s10 s24)
	(link s24 s10)
	(link s10 s29)
	(link s29 s10)
	(link s11 s4)
	(link s4 s11)
	(link s11 s24)
	(link s24 s11)
	(link s11 s27)
	(link s27 s11)
	(link s12 s1)
	(link s1 s12)
	(link s12 s9)
	(link s9 s12)
	(link s13 s11)
	(link s11 s13)
	(link s13 s17)
	(link s17 s13)
	(link s14 s2)
	(link s2 s14)
	(link s14 s8)
	(link s8 s14)
	(link s14 s16)
	(link s16 s14)
	(link s14 s20)
	(link s20 s14)
	(link s14 s27)
	(link s27 s14)
	(link s15 s7)
	(link s7 s15)
	(link s15 s16)
	(link s16 s15)
	(link s16 s9)
	(link s9 s16)
	(link s16 s11)
	(link s11 s16)
	(link s16 s24)
	(link s24 s16)
	(link s16 s29)
	(link s29 s16)
	(link s17 s6)
	(link s6 s17)
	(link s17 s10)
	(link s10 s17)
	(link s18 s5)
	(link s5 s18)
	(link s18 s6)
	(link s6 s18)
	(link s18 s7)
	(link s7 s18)
	(link s18 s9)
	(link s9 s18)
	(link s18 s20)
	(link s20 s18)
	(link s18 s29)
	(link s29 s18)
	(link s19 s13)
	(link s13 s19)
	(link s20 s3)
	(link s3 s20)
	(link s20 s25)
	(link s25 s20)
	(link s21 s2)
	(link s2 s21)
	(link s21 s4)
	(link s4 s21)
	(link s21 s12)
	(link s12 s21)
	(link s21 s27)
	(link s27 s21)
	(link s22 s10)
	(link s10 s22)
	(link s22 s14)
	(link s14 s22)
	(link s22 s26)
	(link s26 s22)
	(link s23 s3)
	(link s3 s23)
	(link s23 s13)
	(link s13 s23)
	(link s24 s6)
	(link s6 s24)
	(link s24 s18)
	(link s18 s24)
	(link s24 s26)
	(link s26 s24)
	(link s24 s29)
	(link s29 s24)
	(link s25 s4)
	(link s4 s25)
	(link s25 s5)
	(link s5 s25)
	(link s25 s12)
	(link s12 s25)
	(link s25 s13)
	(link s13 s25)
	(link s26 s6)
	(link s6 s26)
	(link s26 s12)
	(link s12 s26)
	(link s26 s20)
	(link s20 s26)
	(link s26 s27)
	(link s27 s26)
	(link s27 s2)
	(link s2 s27)
	(link s27 s7)
	(link s7 s27)
	(link s27 s25)
	(link s25 s27)
	(link s28 s13)
	(link s13 s28)
	(link s28 s25)
	(link s25 s28)
	(link s29 s4)
	(link s4 s29)
	(link s29 s6)
	(link s6 s29)
	(link s29 s11)
	(link s11 s29)
	(link s29 s25)
	(link s25 s29)
)
	(:goal (and
	(at driver1 s19)
	(at driver2 s20)
	(at driver4 s10)
	(at driver5 s6)
	(at driver6 s8)
	(at driver7 s8)
	(at driver10 s17)
	(at driver12 s7)
	(at driver14 s0)
	(at driver15 s18)
	(at driver17 s24)
	(at driver18 s22)
	(at driver19 s27)
	(at driver20 s19)
	(at truck1 s13)
	(at truck2 s2)
	(at truck3 s7)
	(at truck4 s14)
	(at truck6 s5)
	(at truck7 s23)
	(at truck10 s27)
	(at truck13 s19)
	(at truck14 s2)
	(at truck15 s2)
	(at truck16 s24)
	(at truck17 s18)
	(at truck18 s22)
	(at truck19 s26)
	(at truck20 s22)
	(at package1 s27)
	(at package2 s22)
	(at package3 s14)
	(at package4 s22)
	(at package5 s17)
	(at package6 s18)
	(at package7 s5)
	(at package8 s1)
	(at package9 s0)
	(at package10 s0)
	(at package11 s20)
	(at package12 s14)
	(at package13 s15)
	(at package14 s1)
	(at package15 s16)
	(at package16 s14)
	(at package17 s28)
	(at package18 s23)
	(at package19 s27)
	(at package20 s21)
	(at package21 s2)
	(at package22 s0)
	(at package23 s29)
	(at package24 s15)
	(at package25 s23)
	(at package26 s24)
	(at package27 s14)
	(at package28 s11)
	(at package29 s8)
	(at package30 s1)
	(at package31 s11)
	(at package32 s7)
	(at package33 s11)
	(at package34 s8)
	(at package35 s20)
	(at package36 s4)
	(at package37 s9)
	(at package38 s11)
	(at package39 s12)
	(at package40 s11)
	))


)
