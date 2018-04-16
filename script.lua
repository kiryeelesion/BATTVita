-- BATTVita Versión 1

if not files.exists("resources/") then
    os.message("No se encuentran archivos!")
end

color.loadpalette()
fondo = image.load("resources/fondo.png")

bateriasi = image.load("resources/bateria_existe.png")
bateriano = image.load("resources/bateria_no_existe.png")
bateriabaja = image.load("resources/bateriabaja.png")
cargando = image.load("resources/Cargando.png")

iconobateria20 = image.load("resources/bateria20.png")
iconobateria40 = image.load("resources/bateria40.png")
iconobateria60 = image.load("resources/bateria60.png")
iconobateria80 = image.load("resources/bateria80.png")
iconobateria100 = image.load("resources/bateria100.png")

voltaje = image.load("resources/displayc.png")
corriente = image.load("resources/displayi.png")
ciclos = image.load("resources/displayc.png")
salud = image.load("resources/displays.png")

temperatura20 = image.load("resources/temperatura20.png")
temperatura40 = image.load("resources/temperatura40.png")
temperatura60 = image.load("resources/temperatura60.png")
temperatura80 = image.load("resources/temperatura80.png")
temperatura100 = image.load("resources/temperatura100.png")

while true do
    buttons.read()
    fondo:blit(0,0)
    screen.print(100,20,"BATTVita ",1.5,color.cyan,color.shadow)

    --Modulo batería existe
    if batt.exists() then
        bateriasi:blit(20,430)
        screen.print(100,480,"La batería esta presente en la consola ",1.2,color.black,color.gray)
    else
        bateriano:blit(20,430)
        screen.print(100,480,"La batería NO esta presente en la consola ",1.2,color.black,color.gray)
    end
    -- fin modulo batería existe

    -- Modulo icono de batería 
    if batt.lifepercent() <= 20 then
        iconobateria20:blit(55,100)
        screen.print(70,200,tostring(batt.lifepercent()).." %",1.7,color.black,color.gray)
    elseif batt.lifepercent() > 20 and batt.lifepercent() <= 40 then
        iconobateria40:blit(55,100)
        screen.print(70,200,tostring(batt.lifepercent()).." %",1.7,color.black,color.gray)
    elseif batt.lifepercent() > 40 and batt.lifepercent() <= 60 then
        iconobateria60:blit(55,100)
        screen.print(70,200,tostring(batt.lifepercent()).." %",1.7,color.black,color.gray)
    elseif batt.lifepercent() > 60 and batt.lifepercent() <= 80 then
        iconobateria80:blit(55,100)
        screen.print(70,200,tostring(batt.lifepercent()).." %",1.7,color.black,color.gray)
    elseif batt.lifepercent() > 80 then
        iconobateria100:blit(55,100)
        screen.print(70,200,tostring(batt.lifepercent()).." %",1.7,color.black,color.gray)
    end
    -- Fin modulo icono de batería 

    --Modulo Voltaje
    voltaje:blit(300,100)
    screen.print(320,140,"Voltaje: "..batt.volt(),1.7,color.black,color.shadow)
    --Fin modulo Voltaje
    --modulo corriente
    corriente:blit(300,180)
    screen.print(320,220,batt.remaincap(),1.7,color.black,color.shadow)
    -- fin modulo
    --modulo corriente
    ciclos:blit(300,260)
    screen.print(320,300,"Ciclos: "..tostring(batt.cycle()),1.7,color.black,color.shadow)
    -- fin modulo
    --modulo corriente
    salud:blit(300,340)
    screen.print(320,380,"Salud: "..tostring(batt.soh()).." %",1.7,color.black,color.shadow)
    -- fin modulo

    --modulo tiempo de la bateria
    screen.print(520,50,"tiempo restante: "..tostring(batt.lifetimemin()).." minutos",1.2,color.black,color.shadow)
    -- fin modulo

    --Modulo temperatura
    if tonumber(batt.temp()) <= 20 then
        temperatura20:blit(700,150)
        screen.print(750,250,tostring(batt.temp()).." °C",1.7,color.black,color.gray)
    elseif tonumber(batt.temp()) > 20 and tonumber(batt.temp()) <= 40 then
        temperatura40:blit(700,150)
        screen.print(750,200,tostring(batt.temp()).." °C",1.7,color.black,color.gray)
    elseif tonumber(batt.temp()) > 40 and tonumber(batt.temp()) <= 60 then
        temperatura60:blit(700,150)
        screen.print(750,200,tostring(batt.temp()).." °C",1.7,color.black,color.gray)
    elseif tonumber(batt.temp()) > 60 and tonumber(batt.temp()) <= 80 then
        temperatura80:blit(700,150)
        screen.print(750,200,tostring(batt.temp()).." °C",1.7,color.black,color.gray)
    elseif tonumber(batt.temp()) > 80 then
        temperatura90:blit(700,150)
        screen.print(750,200,tostring(batt.temp()).." °C",1.7,color.black,color.gray)
    end 
    -- Fin modulo temperatura 

    --Modulo mensajes del sistema
    if batt.low() then
        os.message("batería baja, por favor conecte la consola")
        bateriabaja:blit(700,430)
    end
    if batt.charging() then
        os.message("Cargando...")
        cargando:blit(700,430)
    end

    screen.flip()
end