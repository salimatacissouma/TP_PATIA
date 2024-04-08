(define (problem PrintJob)
(:domain eTipp)
(:objects
		dummy-sheet
		sheet1
		sheet2
		sheet3
		sheet4
		sheet5
		sheet6
		sheet7 - sheet_t
		image-1
		image-2
		image-3
		image-4
		image-5
		image-6
		image-7 - image_t
)
(:init
		(Uninitialized)
		(Oppositeside Front Back)
		(Oppositeside Back Front)
		(Location dummy-sheet Some_Finisher_Tray)
		(Prevsheet sheet1 dummy-sheet)
		(Prevsheet sheet2 sheet1)
		(Prevsheet sheet3 sheet2)
		(Prevsheet sheet4 sheet3)
		(Prevsheet sheet5 sheet4)
		(Prevsheet sheet6 sheet5)
		(Prevsheet sheet7 sheet6)
		(Sheetsize sheet1 Letter)
		(Sheetsize sheet2 Letter)
		(Sheetsize sheet3 Letter)
		(Sheetsize sheet4 Letter)
		(Sheetsize sheet5 Letter)
		(Sheetsize sheet6 Letter)
		(Sheetsize sheet7 Letter)
		(Location sheet1 Some_Feeder_Tray)
		(Location sheet2 Some_Feeder_Tray)
		(Location sheet3 Some_Feeder_Tray)
		(Location sheet4 Some_Feeder_Tray)
		(Location sheet5 Some_Feeder_Tray)
		(Location sheet6 Some_Feeder_Tray)
		(Location sheet7 Some_Feeder_Tray)
		(Imagecolor image-1 Black)
		(Imagecolor image-2 Black)
		(Imagecolor image-3 Color)
		(Imagecolor image-4 Color)
		(Imagecolor image-5 Black)
		(Imagecolor image-6 Black)
		(Imagecolor image-7 Color)
		(Notprintedwith sheet1 Front Black)
		(Notprintedwith sheet1 Back Black)
		(Notprintedwith sheet1 Front Color)
		(Notprintedwith sheet1 Back Color)
		(Notprintedwith sheet2 Front Black)
		(Notprintedwith sheet2 Back Black)
		(Notprintedwith sheet2 Front Color)
		(Notprintedwith sheet2 Back Color)
		(Notprintedwith sheet3 Front Black)
		(Notprintedwith sheet3 Back Black)
		(Notprintedwith sheet3 Front Color)
		(Notprintedwith sheet3 Back Color)
		(Notprintedwith sheet4 Front Black)
		(Notprintedwith sheet4 Back Black)
		(Notprintedwith sheet4 Front Color)
		(Notprintedwith sheet4 Back Color)
		(Notprintedwith sheet5 Front Black)
		(Notprintedwith sheet5 Back Black)
		(Notprintedwith sheet5 Front Color)
		(Notprintedwith sheet5 Back Color)
		(Notprintedwith sheet6 Front Black)
		(Notprintedwith sheet6 Back Black)
		(Notprintedwith sheet6 Front Color)
		(Notprintedwith sheet6 Back Color)
		(Notprintedwith sheet7 Front Black)
		(Notprintedwith sheet7 Back Black)
		(Notprintedwith sheet7 Front Color)
		(Notprintedwith sheet7 Back Color)
)
(:goal (and
		(Hasimage sheet1 Front image-1)
		(Notprintedwith sheet1 Front Color)
		(Notprintedwith sheet1 Back Black)
		(Notprintedwith sheet1 Back Color)
		(Hasimage sheet2 Front image-2)
		(Notprintedwith sheet2 Front Color)
		(Notprintedwith sheet2 Back Black)
		(Notprintedwith sheet2 Back Color)
		(Hasimage sheet3 Front image-3)
		(Notprintedwith sheet3 Front Black)
		(Notprintedwith sheet3 Back Black)
		(Notprintedwith sheet3 Back Color)
		(Hasimage sheet4 Front image-4)
		(Notprintedwith sheet4 Front Black)
		(Notprintedwith sheet4 Back Black)
		(Notprintedwith sheet4 Back Color)
		(Hasimage sheet5 Front image-5)
		(Notprintedwith sheet5 Front Color)
		(Notprintedwith sheet5 Back Black)
		(Notprintedwith sheet5 Back Color)
		(Hasimage sheet6 Front image-6)
		(Notprintedwith sheet6 Front Color)
		(Notprintedwith sheet6 Back Black)
		(Notprintedwith sheet6 Back Color)
		(Hasimage sheet7 Front image-7)
		(Notprintedwith sheet7 Front Black)
		(Notprintedwith sheet7 Back Black)
		(Notprintedwith sheet7 Back Color)
		(Sideup sheet1 Front)
		(Sideup sheet2 Front)
		(Sideup sheet3 Front)
		(Sideup sheet4 Front)
		(Sideup sheet5 Front)
		(Sideup sheet6 Front)
		(Sideup sheet7 Front)
		(Stackedin sheet1 sys_OutputTray)
		(Stackedin sheet2 sys_OutputTray)
		(Stackedin sheet3 sys_OutputTray)
		(Stackedin sheet4 sys_OutputTray)
		(Stackedin sheet5 sys_OutputTray)
		(Stackedin sheet6 sys_OutputTray)
		(Stackedin sheet7 sys_OutputTray))
)
(:metric minimize (total-time))
)
