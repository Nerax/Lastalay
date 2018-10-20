local looped = 8
local looped2 = 16

Citizen.CreateThread(function()
    local checkbox2 = false
    WarMenu.CreateMenu('list', "Simple Interactions")
    WarMenu.SetSubTitle('list', 'Simple Interactions')
    WarMenu.CreateSubMenu('idles', 'list', 'Рутина')
    WarMenu.CreateSubMenu('stoiki', 'idles', 'Стойки зацикленные')
    WarMenu.CreateSubMenu('actns0', 'idles', 'Действия с прдметами')
	WarMenu.CreateSubMenu('actns', 'idles', 'Действия зацикленные')
	WarMenu.CreateSubMenu('actns2', 'idles', 'Действия прерывистые')
	WarMenu.CreateSubMenu('avoid', 'idles', 'Испуг')
	WarMenu.CreateSubMenu('dead', 'idles', 'Без сознания - очнуться')
	WarMenu.CreateSubMenu('weapact', 'idles', 'Действия с оружием')
	WarMenu.CreateSubMenu('dance', 'idles', 'Танцы')
	WarMenu.CreateSubMenu('all', 'idles', 'Трюки')
    WarMenu.CreateSubMenu('gest', 'list', 'Жесты при разговоре')
	WarMenu.CreateSubMenu('usual', 'gest', 'Обычные')
	WarMenu.CreateSubMenu('happy', 'gest', 'Радость')
	WarMenu.CreateSubMenu('angry', 'gest', 'Злость и раздражение')
	WarMenu.CreateSubMenu('sad', 'gest', 'Печаль и скука')
	WarMenu.CreateSubMenu('gangsta', 'gest', 'Гэнгста')
	WarMenu.CreateSubMenu('maner', 'gest', 'Манерные')
	WarMenu.CreateSubMenu('car', 'gest', 'В машине')
	WarMenu.CreateSubMenu('walkact', 'gest', 'При ходьбе')
	WarMenu.CreateSubMenu('sit', 'list', 'Сидячие и лежачие')
	WarMenu.CreateSubMenu('sitchair', 'sit', 'На стуле')
	WarMenu.CreateSubMenu('sitchprop', 'sit', 'С объектом')
	WarMenu.CreateSubMenu('sittable', 'sit', 'За столом')
	WarMenu.CreateSubMenu('sitwall', 'sit', 'На выступе')
	WarMenu.CreateSubMenu('lieflor', 'sit', 'Лежать на полу')
	WarMenu.CreateSubMenu('liebed', 'sit', 'Лежать на чем-то')
	WarMenu.CreateSubMenu('combat', 'list', 'Бой')
	WarMenu.CreateSubMenu('hideshot', 'combat', 'Укрытия под обстрелом')
	WarMenu.CreateSubMenu('kill', 'combat', 'Смерть и ранения')
	WarMenu.CreateSubMenu('fight', 'combat', 'Ближний бой')
	WarMenu.CreateSubMenu('others', 'list', 'Другое')
	WarMenu.CreateSubMenu('barmen', 'others', 'Бармен')
	WarMenu.CreateSubMenu('mecanic', 'others', 'Механик')
	WarMenu.CreateSubMenu('cop', 'others', 'Полицейский')
	WarMenu.CreateSubMenu('different', 'others', 'Разное')
	WarMenu.CreateSubMenu('scens', 'list', 'Scenarios')
    WarMenu.CreateSubMenu('job', 'scens', 'Jobs')
    WarMenu.CreateSubMenu('hobby', 'scens', 'Hobbies')
    WarMenu.CreateSubMenu('drink', 'scens', 'Drinking & Drugs')
    WarMenu.CreateSubMenu('ems', 'scens', 'EMS Scenarios')
    WarMenu.CreateSubMenu('sat', 'scens', 'Sat Down Scenarios')
    WarMenu.CreateSubMenu('misc', 'scens', 'Misc')
    WarMenu.CreateSubMenu('creds', 'list', 'Credits')

    for theId,theItems in pairs(idles) do
        RequestAnimDict(theItems.dic)
    end
     for theId,theItems in pairs(gest) do
        RequestAnimDict(theItems.dic)
    end
	 for theId,theItems in pairs(sit) do
        RequestAnimDict(theItems.dic)
    end
	 for theId,theItems in pairs(combat) do
        RequestAnimDict(theItems.dic)
    end
	 for theId,theItems in pairs(others) do
        RequestAnimDict(theItems.dic)
    end

    while true do

        local ped = PlayerPedId()

        if checkbox then
            looped = 1
        else
            looped = 32
        end

        if checkbox2 then
            looped2 = 1
        else
            looped2 = 0
        end

        if WarMenu.IsMenuOpened('list') then

           	
			if WarMenu.MenuButton('Рутина', 'idles') then
            end
			
			if WarMenu.MenuButton('Жесты при разговоре', 'gest') then
            end
			
			if WarMenu.MenuButton('Сидячие и лежачие', 'sit') then
            end
			
			if WarMenu.MenuButton('Бой', 'combat') then
            end
			
			if WarMenu.MenuButton('Другое', 'others') then
            end
			
		    if WarMenu.MenuButton('Scenarios', 'scens') then
            end

            if WarMenu.MenuButton('Credits', 'creds') then
            end

      			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('idles') then
            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Стойки зацикленные', 'stoiki') then
            elseif WarMenu.MenuButton('Действия с прдметами', 'actns0') then
			elseif WarMenu.MenuButton('Действия зацикленные', 'actns') then
			elseif WarMenu.MenuButton('Действия прерывистые', 'actns2') then
			elseif WarMenu.MenuButton('Испуг', 'avoid') then
			elseif WarMenu.MenuButton('Без сознания - очнуться', 'dead') then
			elseif WarMenu.MenuButton('Действия с оружием', 'weapact') then
			elseif WarMenu.MenuButton('Танцы', 'dance') then
			elseif WarMenu.MenuButton('Трюки', 'all') then
            end
		
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('stoiki') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Стойки зацикленные" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('actns0') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Действия с прдметами" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
			       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('actns') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Действия зацикленные" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end

				       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('actns2') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Действия прерывистые" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('avoid') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Испуг" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
					WarMenu.Display()
        elseif WarMenu.IsMenuOpened('dead') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Без сознания - очнуться" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
	
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('weapact') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Действия с оружием" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
				WarMenu.Display()
        elseif WarMenu.IsMenuOpened('dance') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Танцы" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
					WarMenu.Display()
        elseif WarMenu.IsMenuOpened('all') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(idles) do
                if theItems.category == "Трюки" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
			    WarMenu.Display()
        elseif WarMenu.IsMenuOpened('gest') then
            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Обычные', 'usual') then
            elseif WarMenu.MenuButton('Радость', 'happy') then
			elseif WarMenu.MenuButton('Злость и раздражение', 'angry') then
			elseif WarMenu.MenuButton('Печаль и скука', 'sad') then
			elseif WarMenu.MenuButton('Гэнгста', 'gangsta') then
			elseif WarMenu.MenuButton('Манерные', 'maner') then
			elseif WarMenu.MenuButton('В машине', 'car') then
			elseif WarMenu.MenuButton('При ходьбе', 'walkact') then
            end

				       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('usual') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Обычные" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
		
				       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('happy') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Радость" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
	
			
					       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('angry') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Злость и раздражение" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
					       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sad') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Печаль и скука" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
					       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('gangsta') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Гэнгста" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
				
				       WarMenu.Display()
        elseif WarMenu.IsMenuOpened('maner') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "Манерные" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
		
		WarMenu.Display()
        elseif WarMenu.IsMenuOpened('car') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "В машине" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
		
		WarMenu.Display()
        elseif WarMenu.IsMenuOpened('walkact') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(gest) do
                if theItems.category == "При ходьбе" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
		
		 WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sit') then
            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('На стуле', 'sitchair') then
            elseif WarMenu.MenuButton('С объектом', 'sitchprop') then
			elseif WarMenu.MenuButton('За столом', 'sittable') then
			elseif WarMenu.MenuButton('На выступе', 'sitwall') then
			elseif WarMenu.MenuButton('Лежать на полу', 'lieflor') then
			elseif WarMenu.MenuButton('Лежать на чем-то', 'liebed') then
			end

        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sitchair') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "На стуле" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sitchprop') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "С объектом" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
					
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sittable') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "За столом" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
					
					WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sitwall') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "На выступе" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
					
					WarMenu.Display()
        elseif WarMenu.IsMenuOpened('lieflor') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "Лежать на полу" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
		WarMenu.Display()
        elseif WarMenu.IsMenuOpened('liebed') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(sit) do
                if theItems.category == "Лежать на чем-то" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
				 WarMenu.Display()
        elseif WarMenu.IsMenuOpened('combat') then
            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Укрытия под обстрелом', 'hideshot') then
            elseif WarMenu.MenuButton('Смерть и ранения', 'kill') then
			elseif WarMenu.MenuButton('Ближний бой', 'fight') then
		end
				
				WarMenu.Display()
        elseif WarMenu.IsMenuOpened('hideshot') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(combat) do
                if theItems.category == "Укрытия под обстрелом" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
						WarMenu.Display()
        elseif WarMenu.IsMenuOpened('kill') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(combat) do
                if theItems.category == "Смерть и ранения" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
				WarMenu.Display()
        elseif WarMenu.IsMenuOpened('fight') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(combat) do
                if theItems.category == "Ближний бой" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
				 WarMenu.Display()
        elseif WarMenu.IsMenuOpened('others') then
            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Бармен', 'barmen') then
			elseif WarMenu.MenuButton('Механик', 'mecanic') then
			elseif WarMenu.MenuButton('Полицейский', 'cop') then
			elseif WarMenu.MenuButton('Разное', 'different') then
                    end
				
					WarMenu.Display()
        elseif WarMenu.IsMenuOpened('barmen') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(others) do
                if theItems.category == "Бармен" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
	WarMenu.Display()
        elseif WarMenu.IsMenuOpened('mecanic') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(others) do
                if theItems.category == "Механик" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
				WarMenu.Display()
        elseif WarMenu.IsMenuOpened('cop') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(others) do
                if theItems.category == "Полицейский" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
			
				WarMenu.Display()
        elseif WarMenu.IsMenuOpened('different') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(others) do
                if theItems.category == "Разное" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
				
				
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('scens') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Jobs', 'job') then
            elseif WarMenu.MenuButton('Hobbies', 'hobby') then
            elseif WarMenu.MenuButton('Drinks + Drugs', 'drink') then
            elseif WarMenu.MenuButton('EMS Animations', 'ems') then
            elseif WarMenu.MenuButton('Sitting Scenarios', 'sat') then
            elseif WarMenu.MenuButton('Misc', 'misc') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('job') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Jobs" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('hobby') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Hobby" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('drink') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Drink" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ems') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "EMS" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sat') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Sat" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('misc') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Misc" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('creds') then

            if WarMenu.Button('Warmenu Base By:~h~ Warxander') then
                TriggerEvent("chatMessage", "IllusiveTea", {255, 0, 0}, "Neat easter egg! :D")
            elseif WarMenu.Button('Menu By:~h~ IllusiveTea') then
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 167) then --f6
            WarMenu.OpenMenu('list')
        end

        Citizen.Wait(0)
    end
end)
