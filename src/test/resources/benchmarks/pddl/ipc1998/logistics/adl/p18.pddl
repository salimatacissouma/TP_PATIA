(define (problem log-x-18)
   (:domain logistics-adl)
   (:objects package20 package19 package18 package17 package16
             package15 package14 package13 package12 package11 package10
             package9 package8 package7 package6 package5 package4 package3
             package2 package1 - obj
             city30 city29 city28 city27 city26 city25 city24 city23 city22
             city21 city20 city19 city18 city17 city16 city15 city14 city13
             city12 city11 city10 city9 city8 city7 city6 city5 city4 city3
             city2 city1 - city
             truck30 truck29 truck28 truck27 truck26 truck25 truck24
             truck23 truck22 truck21 truck20 truck19 truck18 truck17
             truck16 truck15 truck14 truck13 truck12 truck11 truck10 truck9
             truck8 truck7 truck6 truck5 truck4 truck3 truck2 truck1
             - truck
             plane10 plane9 plane8 plane7 plane6 plane5 plane4 plane3 plane2
             plane1 - airplane
             city30-2 city30-1 city29-2 city29-1 city28-2 city28-1 city27-2
             city27-1 city26-2 city26-1 city25-2 city25-1 city24-2 city24-1
             city23-2 city23-1 city22-2 city22-1 city21-2 city21-1 city20-2
             city20-1 city19-2 city19-1 city18-2 city18-1 city17-2 city17-1
             city16-2 city16-1 city15-2 city15-1 city14-2 city14-1 city13-2
             city13-1 city12-2 city12-1 city11-2 city11-1 city10-2 city10-1
             city9-2 city9-1 city8-2 city8-1 city7-2 city7-1 city6-2
             city6-1 city5-2 city5-1 city4-2 city4-1 city3-2 city3-1
             city2-2 city2-1 city1-2 city1-1 - location
             city30-3 city29-3 city28-3 city27-3 city26-3 city25-3 city24-3
             city23-3 city22-3 city21-3 city20-3 city19-3 city18-3 city17-3
             city16-3 city15-3 city14-3 city13-3 city12-3 city11-3 city10-3
             city9-3 city8-3 city7-3 city6-3 city5-3 city4-3 city3-3
             city2-3 city1-3 - airport)
   (:init (in-city city30-3 city30)
          (in-city city30-2 city30)
          (in-city city30-1 city30)
          (in-city city29-3 city29)
          (in-city city29-2 city29)
          (in-city city29-1 city29)
          (in-city city28-3 city28)
          (in-city city28-2 city28)
          (in-city city28-1 city28)
          (in-city city27-3 city27)
          (in-city city27-2 city27)
          (in-city city27-1 city27)
          (in-city city26-3 city26)
          (in-city city26-2 city26)
          (in-city city26-1 city26)
          (in-city city25-3 city25)
          (in-city city25-2 city25)
          (in-city city25-1 city25)
          (in-city city24-3 city24)
          (in-city city24-2 city24)
          (in-city city24-1 city24)
          (in-city city23-3 city23)
          (in-city city23-2 city23)
          (in-city city23-1 city23)
          (in-city city22-3 city22)
          (in-city city22-2 city22)
          (in-city city22-1 city22)
          (in-city city21-3 city21)
          (in-city city21-2 city21)
          (in-city city21-1 city21)
          (in-city city20-3 city20)
          (in-city city20-2 city20)
          (in-city city20-1 city20)
          (in-city city19-3 city19)
          (in-city city19-2 city19)
          (in-city city19-1 city19)
          (in-city city18-3 city18)
          (in-city city18-2 city18)
          (in-city city18-1 city18)
          (in-city city17-3 city17)
          (in-city city17-2 city17)
          (in-city city17-1 city17)
          (in-city city16-3 city16)
          (in-city city16-2 city16)
          (in-city city16-1 city16)
          (in-city city15-3 city15)
          (in-city city15-2 city15)
          (in-city city15-1 city15)
          (in-city city14-3 city14)
          (in-city city14-2 city14)
          (in-city city14-1 city14)
          (in-city city13-3 city13)
          (in-city city13-2 city13)
          (in-city city13-1 city13)
          (in-city city12-3 city12)
          (in-city city12-2 city12)
          (in-city city12-1 city12)
          (in-city city11-3 city11)
          (in-city city11-2 city11)
          (in-city city11-1 city11)
          (in-city city10-3 city10)
          (in-city city10-2 city10)
          (in-city city10-1 city10)
          (in-city city9-3 city9)
          (in-city city9-2 city9)
          (in-city city9-1 city9)
          (in-city city8-3 city8)
          (in-city city8-2 city8)
          (in-city city8-1 city8)
          (in-city city7-3 city7)
          (in-city city7-2 city7)
          (in-city city7-1 city7)
          (in-city city6-3 city6)
          (in-city city6-2 city6)
          (in-city city6-1 city6)
          (in-city city5-3 city5)
          (in-city city5-2 city5)
          (in-city city5-1 city5)
          (in-city city4-3 city4)
          (in-city city4-2 city4)
          (in-city city4-1 city4)
          (in-city city3-3 city3)
          (in-city city3-2 city3)
          (in-city city3-1 city3)
          (in-city city2-3 city2)
          (in-city city2-2 city2)
          (in-city city2-1 city2)
          (in-city city1-3 city1)
          (in-city city1-2 city1)
          (in-city city1-1 city1)
          (at plane10 city6-3)
          (at plane9 city10-3)
          (at plane8 city9-3)
          (at plane7 city23-3)
          (at plane6 city15-3)
          (at plane5 city6-3)
          (at plane4 city8-3)
          (at plane3 city28-3)
          (at plane2 city12-3)
          (at plane1 city19-3)
          (at truck30 city30-1)
          (at truck29 city29-2)
          (at truck28 city28-2)
          (at truck27 city27-2)
          (at truck26 city26-2)
          (at truck25 city25-1)
          (at truck24 city24-2)
          (at truck23 city23-2)
          (at truck22 city22-2)
          (at truck21 city21-1)
          (at truck20 city20-1)
          (at truck19 city19-2)
          (at truck18 city18-1)
          (at truck17 city17-1)
          (at truck16 city16-1)
          (at truck15 city15-2)
          (at truck14 city14-1)
          (at truck13 city13-2)
          (at truck12 city12-2)
          (at truck11 city11-1)
          (at truck10 city10-1)
          (at truck9 city9-2)
          (at truck8 city8-2)
          (at truck7 city7-1)
          (at truck6 city6-1)
          (at truck5 city5-2)
          (at truck4 city4-2)
          (at truck3 city3-2)
          (at truck2 city2-1)
          (at truck1 city1-1)
          (at package20 city28-1)
          (at package19 city19-2)
          (at package18 city10-2)
          (at package17 city20-1)
          (at package16 city20-1)
          (at package15 city13-1)
          (at package14 city8-1)
          (at package13 city17-1)
          (at package12 city9-1)
          (at package11 city7-3)
          (at package10 city4-2)
          (at package9 city7-1)
          (at package8 city15-1)
          (at package7 city23-1)
          (at package6 city22-1)
          (at package5 city12-2)
          (at package4 city28-3)
          (at package3 city6-3)
          (at package2 city28-3)
          (at package1 city16-1))
   (:goal (and (at package20 city6-2)
               (at package19 city12-2)
               (at package18 city2-1)
               (at package17 city25-1)
               (at package16 city22-2)
               (at package15 city4-1)
               (at package14 city6-3)
               (at package13 city1-3)
               (at package12 city29-1)
               (at package11 city6-1)
               (at package10 city30-3)
               (at package9 city17-3)
               (at package8 city10-1)
               (at package7 city14-1)
               (at package6 city28-1)
               (at package5 city25-2)
               (at package4 city10-1)
               (at package3 city10-3)
               (at package2 city9-2)
               (at package1 city29-3))))